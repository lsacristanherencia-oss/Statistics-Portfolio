# Análisis de supervivencia de la duración de la baja laboral tras una operación

🇬🇧 [English version](README.md)

Proyecto académico (Máster en Estadística e Investigación Operativa, UPC–UB, asignatura de Estadística Actuarial).
Estudia cuánto tiempo permanecen de baja laboral profesionales asegurados tras una operación, con análisis de supervivencia clásico en R.

**Definición del evento:** el evento (`status = 1`) es la reincorporación al trabajo, es decir, el fin de la baja; `status = 0` indica censura.

## Variables

| Variable | Descripción |
|---|---|
| `time` | Duración de la baja laboral tras la operación (meses) |
| `status` | 1 = evento (reincorporación), 0 = censura |
| `x1` | 1 = asegurado menor de 40 años, 0 = mayor de 40 |
| `x2` | 1 = operación menor, 0 = operación no menor |
| `x3` | 1 = persisten otras patologías tras la operación, 0 = no persisten |

## Métodos

| Paso | Método |
|---|---|
| Estimación no paramétrica | Curvas de supervivencia de Kaplan–Meier (global y por `x1`, `x2`, `x3`) |
| Comparación de grupos | Tests log-rank |
| Modelos paramétricos | AFT Weibull y Exponencial, comparados con AIC; interpretación como razones de tiempos |
| Modelo semiparamétrico | Cox de riesgos proporcionales; curvas de supervivencia predichas para dos perfiles |
| Diagnóstico | Test de residuos de Schoenfeld (`cox.zph`); modelo de Cox estratificado cuando falla la proporcionalidad |

Todos los números del texto del informe (coeficientes, hazard ratios, p-valores, concordancia) se calculan a partir de los modelos ajustados al compilarlo.

## Estructura

```
informe_supervivencia_baja_laboral.Rmd   # informe completo (en español): código + texto
informe_supervivencia_baja_laboral.pdf   # informe compilado
data/                                    # ver data/README.md
```

## Cómo reproducirlo

1. Instala R y RStudio, y LaTeX con `xelatex` (por ejemplo TinyTeX).
2. Instala los paquetes:
   ```r
   install.packages(c("survival", "survminer", "knitr", "rmarkdown"))
   ```
3. Coloca `HOSPI.csv` en `data/` (ver `data/README.md`).
4. Abre el `.Rmd` en RStudio (directorio de trabajo = esta carpeta) y pulsa **Knit to PDF**.

## Resultados

- **Kaplan–Meier:** la probabilidad de seguir de baja tras 2 semanas (0,5 meses) es del 43,5 %.
- **Tests log-rank:** las curvas de supervivencia difieren por edad (`x1`, p = 0,0004), tipo de operación (`x2`, p < 0,001) y patologías persistentes (`x3`, p = 0,0004).
- **Modelos paramétricos:** el AFT Weibull ajusta mucho mejor que el exponencial (AIC 215,8 frente a 289,7). Su escala (1,41) corresponde a una forma menor que 1, es decir, un riesgo de reincorporación que decrece con el tiempo. Razones de tiempos: ×0,60 para menores de 40 años (`x1`), ×0,08 para operaciones menores (`x2`) y ×1,75 para patologías persistentes (`x3`).
- **Modelo de Cox:** hazard ratios de reincorporación de 1,38 para `x1`, 5,23 para `x2` y 0,69 para `x3` (todos con p < 0,01); concordancia de 0,732.
- **Perfiles predichos:** para un asegurado mayor de 40 años con operación mayor y patologías persistentes, la probabilidad de seguir de baja tras 2 semanas es del 77,8 %; con una operación menor, es del 26,9 %.
- **Riesgos proporcionales:** el test de Schoenfeld da p = 0,026 para `x2` (global p = 0,085). El modelo de Cox estratificado por `x2` da HR 1,36 para `x1` y 0,70 para `x3` (similares al modelo sin estratificar) y no muestra evidencia contra la proporcionalidad (global p = 0,50).

## Limitaciones

- Un único colectivo de asegurados, pocas covariables y sin interacciones.
- Sin validación externa.
- Tras estratificar por `x2`, el modelo no estima un coeficiente para el tipo de operación.

## Autora

Laura Sacristán Herencia
