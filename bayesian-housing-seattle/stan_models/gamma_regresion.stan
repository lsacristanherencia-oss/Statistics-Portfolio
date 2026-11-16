// gamma_regression.stan
data {
  int<lower=0> N;                 // número de observaciones
  vector<lower=0>[N] y;           // variable dependiente (precio)
  vector[N] x;                    // predictor (tamaño)
}

parameters {
  real beta_0;
  real beta_1;
  real<lower=0> alpha;            // parámetro de forma
}

model {
  vector[N] mu;

  // Priors
  beta_0 ~ normal(0, 10);
  beta_1 ~ normal(0, 10);
  alpha ~ gamma(2, 0.1);

  // Modelo
  for (i in 1:N)
    mu[i] = exp(beta_0 + beta_1 * x[i]);

  y ~ gamma(alpha, alpha ./ mu);  // parametrización usando tasa = alpha/mu
}
