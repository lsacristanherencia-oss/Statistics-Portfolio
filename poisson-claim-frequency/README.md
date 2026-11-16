# Claim frequency in motor insurance: Poisson models with telematics data (R)

🇪🇸 Versión en español: [README_ES.md](README_ES.md)

Academic project for the course *Actuarial Statistics* (MSc in Statistics and Operations Research, UPC). It models the **number of claims** of motor-insurance policyholders with Poisson regression, compares traditional and telematics risk factors, and studies how to treat the **distance driven** (classical offset vs. generalized offset, following Boucher et al., 2013). The report is written in Spanish.

## Methods
- Descriptive analysis by claim count and by gender
- Poisson GLM with traditional factors (sex, driving experience)
- Poisson GLM with traditional + telematics factors (excess of speed, urban driving) and `log(km)` as a **classical offset**
- Poisson GLM with `log(km)` as a covariate (**generalized offset**)
- Model comparison: AIC, likelihood-ratio test, observed vs. predicted claim frequency by distance
- Pure premium calculation (frequency × average claim cost of 2,000 €) and effect of speeding on the premium

## Main results
- Women and drivers with ≥ 2 years of experience have lower claim frequency; speeding (≈ +14%) and urban driving (≈ +13%) increase it (model f).
- Exceeding the speed limit raises the premium for the example profile by ≈ 14%.
- With the generalized offset, the coefficient of `log(km)` is 0.36 (p < 0.001): risk grows with distance **less than proportionally**. AIC improves from 8383 (classical offset) to 8225, and the likelihood-ratio test rejects exact proportionality (p < 2.2e-16).
- Premium for the example profile (man, speeding, urban, experience < 2 years) at 5,000 / 25,000 km: €163 / €815 with the classical offset vs. €297 / €531 with the generalized one.

## Repository contents
- `informe_poisson_frecuencia_siniestros.Rmd` – full report (R Markdown → PDF)
- `data/` – `datostelemat.csv` here (not included; see `data/README.md`)

## How to run
1. Put `datostelemat.csv` in `data/`.
2. Install `knitr`, `dplyr`, `ggplot2`, `tidyr`.
3. Knit the Rmd (LaTeX required, e.g. TinyTeX).
