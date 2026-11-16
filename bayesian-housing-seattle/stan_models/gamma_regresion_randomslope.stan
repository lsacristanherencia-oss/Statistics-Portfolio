data {
  int<lower=1> N;                     // Número de observaciones
  int<lower=1> K;                     // Número de predictores fijos (sin random slope), estandarizados
  int<lower=1> J;                     // Número de grupos (zonas)
  array[N] int<lower=1, upper=J> zone;   // Índice de zona para cada observación
  vector[N] size_m2;                  // Predictor con pendiente aleatoria
  matrix[N, K] X;                     // Otros predictores fijos
  vector<lower=0>[N] y;               // Variable respuesta (precio)
}
parameters {
  real mu_alpha;                      // Media global de interceptos
  real mu_beta1;                      // Media global de pendientes size_m2
  real<lower=0> sigma_alpha;          // SD jerarquía interceptos
  real<lower=0> sigma_beta1;          // SD jerarquía pendientes size_m2
  vector[J] alpha_zone;               // Interceptos por zona
  vector[J] beta1_zone;               // Pendientes size_m2 por zona
  vector[K] gamma;                    // Betas fijos para el resto de predictores
  real<lower=0> shape;                // Forma de la gamma
}
transformed parameters {
  vector[N] log_mu;
  vector<lower=0>[N] mu;
  for (i in 1:N) {
    log_mu[i] = alpha_zone[zone[i]]
              + beta1_zone[zone[i]] * size_m2[i]
              + X[i] * gamma;
    mu[i] = exp(log_mu[i]);
  }
}
model {
  mu_alpha ~ normal(13.6, 3);
  mu_beta1 ~ normal(0, 0.5);
  sigma_alpha ~ normal(0, 1);      // half-normal (sigma_alpha > 0)
  sigma_beta1 ~ normal(0, 0.5);    // half-normal (sigma_beta1 > 0)

  alpha_zone ~ normal(mu_alpha, sigma_alpha);
  beta1_zone ~ normal(mu_beta1, sigma_beta1);
  
  for (k in 1:K)
    gamma[k] ~ normal(0, 0.5);
  
  shape ~ gamma(2, 0.1);
  
  for (i in 1:N) {
    y[i] ~ gamma(shape, shape / mu[i]);
  }
}
generated quantities {
  vector[N] y_rep;
  for (i in 1:N)
    y_rep[i] = gamma_rng(shape, shape / mu[i]);
}
