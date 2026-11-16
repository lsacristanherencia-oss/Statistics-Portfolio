# Housing price analysis: multivariate methods and machine learning in R

🇪🇸 Versión en español: [README_ES.md](README_ES.md)

Group academic project (Quantitative Marketing Techniques, MSc in Statistics and Operations Research, UPC), developed with two classmates. The goal is to understand which characteristics drive house prices and to test whether they can be predicted, using a [Kaggle dataset](https://www.kaggle.com/datasets/debayank2024/house-price-prediction) of 2,000 houses (area, bedrooms, bathrooms, floors, year built, location, condition, garage, price).

**Main (honest) finding:** the variables show almost no relationship with price (correlations near 0, non-significant Chi-squared and ANOVA tests), so every model performs close to chance. The report documents this carefully and shows examples suggesting the data is synthetic.

## Methods
- Exploratory analysis: correlation matrix, Chi-squared tests (price quintiles vs categorical variables), ANOVA
- Dimension reduction: PCA, simple and multiple correspondence analysis (CA / MCA)
- Unsupervised learning: hierarchical clustering (Ward), k-means, silhouette
- Supervised classification of price quintiles: k-NN, Naive Bayes, Random Forest, SVM
- Regression of price with a neural network (Keras)

## Results
| Model | Accuracy (5 price classes, chance ≈ 20%) |
|---|---|
| k-NN | 22.0% (k = 5) |
| Naive Bayes | 20.7% |
| SVM | 17.7% |
| Random Forest | 21.5% (OOB error 78.55%) |
| Neural network (regression) | no useful predictive power (R² ≤ 0 on the test set) |

K-means silhouette width 0.127 (weak cluster structure).

## Repository contents
- `informe_precio_vivienda_ml.Rmd` – full report (English, R Markdown → PDF)
- `data/` – place `FW_DATASET.xlsx` here (see `data/README.md`)

## How to run
1. Put `FW_DATASET.xlsx` in `data/`.
2. Install the R packages listed in the first chunk (Keras/TensorFlow is optional: if unavailable, the neural network section is skipped).
3. Knit `informe_precio_vivienda_ml.Rmd` (needs a LaTeX distribution, e.g. TinyTeX).

*Academic work; not intended as a real price-prediction tool.*
