# Bayesian modelling of Seattle housing prices

🇪🇸 [Versión en español](README_ES.md)

Academic project (MSc in Statistics and Operations Research, UPC–UB, Bayesian Analysis course), developed with Jordi Lluch Ortiz.
The goal is to predict house sale prices in Seattle (Aug–Dec 2022) and to compare **Bayesian models fitted with Stan** against classical regression and a Random Forest.

## What is in the analysis

| Step | Method |
|---|---|
| Data cleaning | Unit conversion (sqft/acre → m²), missing `lot_size` set to 0, IQR outlier filter (limits computed on the training set only) |
| Bayesian models (Stan, MCMC/NUTS) | Pooled Normal regression; simple Gamma regression (log link); hierarchical Gamma regression with random intercept and random slope for surface, grouped by zip code or by location type |
| Diagnostics | R-hat, effective sample size, divergences, trace and ACF plots, posterior densities with 80% credible intervals |
| Comparison | Linear regression, Gamma GLM and Random Forest, with both `location_group` and `zip_code`; metric: MAPE on the held-out test set |

## Repository structure

```
informe_bayesiano_seattle.Rmd   # full report (in Spanish): code + text
stan_models/                    # the three Stan models
data/                           # train.csv and test.csv (see data/README.md)
resultados_mape.csv             # generated when the report is rendered
```

## How to reproduce

1. Install R (≥ 4.2), RStudio, a C++ toolchain for Stan (Rtools on Windows, Xcode tools on macOS) and a LaTeX distribution with `xelatex` (e.g. TinyTeX).
2. Install the packages:
   ```r
   install.packages(c("rstan", "tidyverse", "kableExtra", "corrplot", "ggthemes",
                      "bayesplot", "patchwork", "randomForest", "knitr", "rmarkdown"))
   ```
3. Open `informe_bayesiano_seattle.Rmd` in RStudio (set the working directory to this folder) and click **Knit to PDF**, or run:
   ```r
   rmarkdown::render("informe_bayesiano_seattle.Rmd", output_format = "pdf_document")
   ```
4. Sampling takes several minutes. For a fast test, set `QUICK <- TRUE` in the first chunk (**not valid for final results**).

All numbers in the report (MAPE, convergence diagnostics, effects) are computed when it is rendered; seeds are fixed.

## Results

The final comparison table is at the end of the report and saved in `resultados_mape.csv`.

| Model | MAPE (%) |
|---|---|
| Random Forest (zip_code) | 20.91 |
| **Hierarchical Gamma, by zip_code (Bayesian)** | **20.92** |
| Gamma GLM (zip_code) | 21.26 |
| Random Forest (location_group) | 23.59 |
| Linear regression (location_group) | 24.12 |
| Hierarchical Gamma, by location_group (Bayesian) | 24.44 |
| Gamma GLM (location_group) | 24.49 |
| Pooled Normal (Bayesian) | 24.90 |
| Simple Gamma (Bayesian) | 26.93 |

The best Bayesian model (hierarchical Gamma by zip code) and the best classical model (Random Forest by zip code) are practically tied (20.92% vs 20.91%). Using the zip code as grouping variable matters more than the choice between Bayesian and classical methods: all models using it beat their `location_group` counterparts.

Conclusions are deliberately cautious: the comparison uses a single train/test split, so small differences in MAPE should not be read as one approach clearly beating the other. What the hierarchical Bayesian model adds is uncertainty quantification and partial pooling across zip codes with few observations.

## Limitations

- Single train/test split; no cross-validation or LOO comparison.
- Point predictions use posterior means (the posterior predictive is not used for evaluation).
- Only a few months of data and structural variables (no age, no time dimension).

## Data

"Seattle House Price Prediction" by Samuel Cortinhas, from [Kaggle](https://www.kaggle.com/datasets/samuelcortinhas/house-price-prediction-seattle): real house sales in Seattle (WA, USA) between August and December 2022. License: CC0 1.0 (Public Domain), as stated on the Kaggle page.

## Authors

Laura Sacristán Herencia and Jordi Lluch Ortiz.
