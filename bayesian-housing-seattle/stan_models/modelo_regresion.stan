// modelo_regression.stan
data {
  int<lower=0> N;           // número de observaciones
  int<lower=0> K;           // número de predictores
  matrix[N, K] X;           // matriz de predictores
  vector[N] y;              // variable objetivo (precio)
}
parameters {
  real alpha;               // intercepto
  vector[K] beta;           // coeficientes
  real<lower=0> sigma;      // desviación estándar del error
}
model {
  // Likelihood
  y ~ normal(alpha + X * beta, sigma);
}
