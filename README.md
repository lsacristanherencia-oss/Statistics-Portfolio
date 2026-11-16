# Statistics Portfolio

🇪🇸 Versión en español: [README_ES.md](README_ES.md)

Academic projects from my MSc in Statistics and Operations Research (UPC · UB), written in R.

**Laura Sacristán Herencia** · Mathematician · [LinkedIn](https://www.linkedin.com/in/lsacristanherencia/)

## Projects

| Project | Topics | Tools |
|---|---|---|
| [**bayesian-housing-seattle**](bayesian-housing-seattle) | Bayesian hierarchical regression (random intercept and slope) for house prices, MCMC diagnostics, comparison with GLM and Random Forest using MAPE | R, Stan (rstan), R Markdown |
| [**survival-analysis-sick-leave**](survival-analysis-sick-leave) | Time to return to work after sick leave: Kaplan-Meier, log-rank test, Weibull/Exponential AFT, Cox proportional hazards, Schoenfeld test, stratified Cox | R (survival), R Markdown |
| [**poisson-claim-frequency**](poisson-claim-frequency) | Motor-insurance claim frequency with telematics data: Poisson GLM, classical vs. generalized offset for distance driven (Boucher et al., 2013), premium calculation | R, R Markdown |
| [**housing-price-ml**](housing-price-ml) | Exploratory analysis, PCA, correspondence analysis, clustering, k-NN, Naive Bayes, Random Forest, SVM and a neural network on a housing dataset (with a clear negative finding) | R, Keras, R Markdown |

## Repository structure
Each folder contains the R Markdown report, an English and Spanish `README`, and a `data/` folder with a note on the data source. Some datasets are not redistributed (instructor-provided data); the READMEs explain where each comes from and how to run the code.

## Reproducing the reports
Open the `.Rmd` file of a project in RStudio, place the data file in its `data/` folder as described in that project's README, and knit to PDF (a LaTeX distribution such as TinyTeX is required; Stan needs `rstan`).
