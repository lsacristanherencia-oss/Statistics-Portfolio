# Análisis del precio de la vivienda: métodos multivariantes y machine learning en R

🇬🇧 English version: [README.md](README.md)

Trabajo académico en grupo (Técnicas de Marketing Cuantitativo, Máster en Estadística e Investigación Operativa, UPC), realizado con dos compañeros. El objetivo es entender qué características determinan el precio de una vivienda y comprobar si se puede predecir, con un [dataset de Kaggle](https://www.kaggle.com/datasets/debayank2024/house-price-prediction) de 2.000 viviendas (superficie, habitaciones, baños, plantas, año, ubicación, estado, garaje, precio).

**Hallazgo principal (honesto):** las variables apenas se relacionan con el precio (correlaciones cercanas a 0, contrastes Chi-cuadrado y ANOVA no significativos), por lo que todos los modelos rinden cerca del azar. El informe lo documenta y muestra ejemplos que sugieren que los datos son sintéticos.

## Métodos
- Análisis exploratorio: matriz de correlaciones, Chi-cuadrado (quintiles de precio vs variables categóricas), ANOVA
- Reducción de dimensión: ACP, análisis de correspondencias simple y múltiple (CA / MCA)
- Aprendizaje no supervisado: clustering jerárquico (Ward), k-means, silueta
- Clasificación supervisada de quintiles de precio: k-NN, Naive Bayes, Random Forest, SVM
- Regresión del precio con una red neuronal (Keras)

## Resultados
| Modelo | Accuracy (5 clases, azar ≈ 20%) |
|---|---|
| k-NN | 22,0% (k = 5) |
| Naive Bayes | 20,7% |
| SVM | 17,7% |
| Random Forest | 21,5% (error OOB 78,55%) |
| Red neuronal (regresión) | sin capacidad predictiva útil (R² ≤ 0 en test) |

Anchura media de silueta de k-means 0,127 (estructura de clusters débil).

## Contenido
- `informe_precio_vivienda_ml.Rmd` – informe completo (en inglés, R Markdown → PDF)
- `data/` – coloca aquí `FW_DATASET.xlsx` (ver `data/README.md`)

## Cómo ejecutarlo
1. Copia `FW_DATASET.xlsx` en `data/`.
2. Instala los paquetes del primer chunk (Keras/TensorFlow es opcional: si no está, se omite la red neuronal).
3. Compila `informe_precio_vivienda_ml.Rmd` (requiere LaTeX, p. ej. TinyTeX).

*Trabajo académico; no pretende ser una herramienta real de predicción de precios.*
