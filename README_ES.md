# Statistics Portfolio

🇬🇧 English version: [README.md](README.md)

Proyectos académicos de mi Máster en Estadística e Investigación Operativa (UPC · UB), desarrollados en R.

**Laura Sacristán Herencia** · Matemática · [LinkedIn](https://www.linkedin.com/in/lsacristanherencia/)

## Proyectos

| Proyecto | Temas | Herramientas |
|---|---|---|
| [**bayesian-housing-seattle**](bayesian-housing-seattle) | Regresión jerárquica bayesiana (intercepto y pendiente aleatorios) para precios de vivienda, diagnóstico MCMC, comparación con GLM y Random Forest mediante MAPE | R, Stan (rstan), R Markdown |
| [**survival-analysis-sick-leave**](survival-analysis-sick-leave) | Tiempo hasta la reincorporación tras una baja laboral: Kaplan-Meier, test log-rank, AFT Weibull/Exponencial, Cox de riesgos proporcionales, test de Schoenfeld, Cox estratificado | R (survival), R Markdown |
| [**poisson-claim-frequency**](poisson-claim-frequency) | Frecuencia de siniestros en seguro de automóvil con datos telemáticos: GLM Poisson, offset clásico vs. generalizado para los kilómetros (Boucher et al., 2013), cálculo de primas | R, R Markdown |
| [**housing-price-ml**](housing-price-ml) | Análisis exploratorio, ACP, análisis de correspondencias, clustering, k-NN, Naive Bayes, Random Forest, SVM y red neuronal sobre datos de vivienda (con un hallazgo negativo claro) | R, Keras, R Markdown |

## Estructura del repositorio
Cada carpeta contiene el informe en R Markdown, un `README` en inglés y en español y una carpeta `data/` con una nota sobre el origen de los datos. Algunos datos no se redistribuyen (proporcionados por el profesorado); los README explican de dónde proceden y cómo ejecutar el código.

## Cómo reproducir los informes
Abre el `.Rmd` de un proyecto en RStudio, coloca el archivo de datos en su carpeta `data/` como indica el README del proyecto y compila a PDF (hace falta una distribución LaTeX como TinyTeX; Stan requiere `rstan`).
