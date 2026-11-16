# Frecuencia de siniestros en seguros de automóvil: modelos Poisson con datos telemáticos (R)

🇬🇧 English version: [README.md](README.md)

Trabajo académico de la asignatura *Estadística Actuarial* (Máster en Estadística e Investigación Operativa, UPC). Modela el **número de siniestros** de asegurados de automóvil con regresión de Poisson, compara factores de riesgo tradicionales y telemáticos y estudia cómo tratar la **distancia recorrida** (offset clásico vs. offset generalizado, según Boucher et al., 2013). El informe está en español.

## Métodos
- Análisis descriptivo según número de siniestros y según género
- GLM Poisson con factores tradicionales (sexo, antigüedad del carné)
- GLM Poisson con factores tradicionales + telemáticos (exceso de velocidad, conducción urbana) y `log(km)` como **offset clásico**
- GLM Poisson con `log(km)` como covariable (**offset generalizado**)
- Comparación de modelos: AIC, contraste de razón de verosimilitudes, frecuencia observada vs. predicha según kilómetros
- Cálculo de la prima pura (frecuencia × coste medio de 2.000 €) y efecto del exceso de velocidad sobre la prima

## Resultados principales
- Las mujeres y los conductores con ≥ 2 años de carné tienen menor frecuencia de siniestros; el exceso de velocidad (≈ +14 %) y la conducción urbana (≈ +13 %) la aumentan (modelo f).
- El exceso de velocidad encarece la prima del perfil de ejemplo en ≈ 14 %.
- Con el offset generalizado, el coeficiente de `log(km)` es 0,36 (p < 0,001): el riesgo crece con la distancia **menos que proporcionalmente**. El AIC mejora de 8383 (offset clásico) a 8225, y el contraste de razón de verosimilitudes rechaza la proporcionalidad exacta (p < 2,2e-16).
- Prima del perfil de ejemplo (hombre, con exceso, urbano, antigüedad < 2 años) con 5.000 / 25.000 km: 163 € / 815 € con el offset clásico frente a 297 € / 531 € con el generalizado.

## Contenido
- `informe_poisson_frecuencia_siniestros.Rmd` – informe completo (R Markdown → PDF)
- `data/` – `datostelemat.csv` (no incluido; ver `data/README.md`)

## Cómo ejecutarlo
1. Copia `datostelemat.csv` en `data/`.
2. Instala `knitr`, `dplyr`, `ggplot2`, `tidyr`.
3. Compila el Rmd (requiere LaTeX, p. ej. TinyTeX).

