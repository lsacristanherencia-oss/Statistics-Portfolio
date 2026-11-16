# Modelización bayesiana del precio de la vivienda en Seattle

🇬🇧 [English version](README.md)

Proyecto académico (Máster en Estadística e Investigación Operativa, UPC–UB, asignatura de Análisis Bayesiano), realizado junto a Jordi Lluch Ortiz.
El objetivo es predecir el precio de venta de viviendas en Seattle (ago–dic 2022) y comparar **modelos bayesianos ajustados con Stan** con regresión clásica y Random Forest.

## Qué incluye el análisis

| Paso | Método |
|---|---|
| Limpieza de datos | Conversión de unidades (sqft/acre → m²), `lot_size` faltante = 0, filtro de outliers por IQR (límites calculados solo con train) |
| Modelos bayesianos (Stan, MCMC/NUTS) | Regresión Normal pooled; regresión Gamma simple (enlace log); regresión Gamma jerárquica con intercepto y pendiente aleatorios para la superficie, agrupada por código postal o por tipo de ubicación |
| Diagnósticos | R-hat, tamaño efectivo de muestra, divergencias, trazas y ACF, densidades posteriores con intervalos creíbles del 80% |
| Comparación | Regresión lineal, GLM Gamma y Random Forest, con `location_group` y con `zip_code`; métrica: MAPE en el conjunto de test |

## Estructura

```
informe_bayesiano_seattle.Rmd   # informe completo (en español): código + texto
stan_models/                    # los tres modelos Stan
data/                           # train.csv y test.csv (ver data/README.md)
resultados_mape.csv             # se genera al compilar el informe
```

## Cómo reproducirlo

1. Instala R (≥ 4.2), RStudio, un compilador de C++ para Stan (Rtools en Windows, Xcode tools en macOS) y LaTeX con `xelatex` (por ejemplo TinyTeX).
2. Instala los paquetes:
   ```r
   install.packages(c("rstan", "tidyverse", "kableExtra", "corrplot", "ggthemes",
                      "bayesplot", "patchwork", "randomForest", "knitr", "rmarkdown"))
   ```
3. Abre `informe_bayesiano_seattle.Rmd` en RStudio (directorio de trabajo = esta carpeta) y pulsa **Knit to PDF**, o ejecuta:
   ```r
   rmarkdown::render("informe_bayesiano_seattle.Rmd", output_format = "pdf_document")
   ```
4. El muestreo tarda varios minutos. Para una prueba rápida, pon `QUICK <- TRUE` en el primer chunk (**no válido para los resultados finales**).

Todos los números del informe (MAPE, diagnósticos de convergencia, efectos) se calculan al compilarlo; las semillas están fijadas.

## Resultados

La tabla final de comparación está al final del informe y en `resultados_mape.csv`.

| Modelo | MAPE (%) |
|---|---|
| Random Forest (zip_code) | 20.91 |
| **Jerárquico Gamma por zip_code (bayesiano)** | **20.92** |
| GLM Gamma (zip_code) | 21.26 |
| Random Forest (location_group) | 23.59 |
| Regresión lineal (location_group) | 24.12 |
| Jerárquico Gamma por location_group (bayesiano) | 24.44 |
| GLM Gamma (location_group) | 24.49 |
| Pooled Normal (bayesiano) | 24.90 |
| Gamma simple (bayesiano) | 26.93 |

El mejor modelo bayesiano (jerárquico Gamma por código postal) y el mejor clásico (Random Forest por código postal) están prácticamente empatados (20,92% frente a 20,91%). Agrupar por código postal importa más que elegir entre métodos bayesianos o clásicos: todos los modelos que lo usan mejoran a sus equivalentes con `location_group`.

Las conclusiones son prudentes: la comparación usa una sola partición train/test, por lo que diferencias pequeñas de MAPE no deben leerse como que un enfoque supere claramente al otro. Lo que aporta el modelo jerárquico bayesiano es la cuantificación de la incertidumbre y la compartición de información entre códigos postales con pocas observaciones.

## Limitaciones

- Una sola partición train/test; sin validación cruzada ni LOO.
- Las predicciones usan medias posteriores (no la predictiva posterior).
- Pocos meses de datos y solo variables estructurales (sin antigüedad ni dimensión temporal).

## Datos

"Seattle House Price Prediction", de Samuel Cortinhas, en [Kaggle](https://www.kaggle.com/datasets/samuelcortinhas/house-price-prediction-seattle): ventas reales de viviendas en Seattle (WA, EE.UU.) entre agosto y diciembre de 2022. Licencia: CC0 1.0 (dominio p�blico), seg�n la p�gina de Kaggle.

## Autores

Laura Sacristán Herencia y Jordi Lluch Ortiz.
