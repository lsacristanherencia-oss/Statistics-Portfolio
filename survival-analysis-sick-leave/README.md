# Survival analysis of sick-leave duration after surgery

🇪🇸 [Versión en español](README_ES.md)

Academic project (MSc in Statistics and Operations Research, UPC–UB, Actuarial Statistics course).
It studies how long insured professionals stay on sick leave after an operation, using classical survival analysis in R.

**Event definition:** the event (`status = 1`) is the return to work, i.e. the end of the sick leave; `status = 0` means censored.

## Variables

| Variable | Description |
|---|---|
| `time` | Duration of the sick leave after the operation (months) |
| `status` | 1 = event (return to work), 0 = censored |
| `x1` | 1 = insured under 40, 0 = over 40 |
| `x2` | 1 = minor operation, 0 = not minor |
| `x3` | 1 = other conditions persist after the operation, 0 = they do not |

## Methods

| Step | Method |
|---|---|
| Non-parametric estimation | Kaplan–Meier survival curves (overall and by `x1`, `x2`, `x3`) |
| Group comparison | Log-rank tests |
| Parametric models | AFT Weibull and Exponential, compared with AIC; interpretation as time ratios |
| Semiparametric model | Cox proportional hazards; predicted survival curves for two insured profiles |
| Model checking | Schoenfeld residuals test (`cox.zph`); stratified Cox model when proportionality fails |

All numbers quoted in the report text (coefficients, hazard ratios, p-values, concordance) are computed from the fitted models when the report is rendered.

## Repository structure

```
informe_supervivencia_baja_laboral.Rmd   # full report (in Spanish): code + text
informe_supervivencia_baja_laboral.pdf   # rendered report
data/                                    # see data/README.md
```

## How to reproduce

1. Install R and RStudio, and a LaTeX distribution with `xelatex` (e.g. TinyTeX).
2. Install the packages:
   ```r
   install.packages(c("survival", "survminer", "knitr", "rmarkdown"))
   ```
3. Place `HOSPI.csv` in `data/` (see `data/README.md`).
4. Open the `.Rmd` in RStudio (working directory = this folder) and click **Knit to PDF**.

## Results

- **Kaplan–Meier:** the probability of still being on leave after 2 weeks (0.5 months) is 43.5%.
- **Log-rank tests:** the survival curves differ by age (`x1`, p = 0.0004), type of operation (`x2`, p < 0.001) and persistent conditions (`x3`, p = 0.0004).
- **Parametric models:** the Weibull AFT model fits much better than the Exponential (AIC 215.8 vs 289.7). Its scale (1.41) corresponds to a shape below 1, i.e. a return-to-work hazard that decreases over time. Time ratios: ×0.60 for under-40s (`x1`), ×0.08 for minor operations (`x2`) and ×1.75 for persistent conditions (`x3`).
- **Cox model:** hazard ratios of return to work of 1.38 for `x1`, 5.23 for `x2` and 0.69 for `x3` (all p < 0.01); concordance 0.732.
- **Predicted profiles:** for an insured person over 40 with a major operation and persistent conditions, the probability of still being on leave after 2 weeks is 77.8%; with a minor operation instead, it is 26.9%.
- **Proportional hazards:** Schoenfeld test p = 0.026 for `x2` (global p = 0.085). A Cox model stratified by `x2` gives HR 1.36 for `x1` and 0.70 for `x3` (similar to the unstratified model) and no evidence against proportionality (global p = 0.50).

## Limitations

- Single group of insured people, small number of covariates and no interactions.
- No external validation.
- After stratifying by `x2`, the model does not estimate a coefficient for the type of operation.

## Author

Laura Sacristán Herencia
