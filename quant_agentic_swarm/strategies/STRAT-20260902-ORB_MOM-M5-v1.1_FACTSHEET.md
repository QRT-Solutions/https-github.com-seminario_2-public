# STRAT-20260902-ORB_MOM-M5-v1.1

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Se define el Rango de Apertura (OR) como el maximo y minimo de las primeras N_or=3 velas M5 (15 minutos) tras la apertura de la sesion regular de EEUU (13:30 UTC). En cada vela M5 posterior al OR, y unicamente hasta las 14:30 UTC (la 'hora dorada' post-apertura), se calcula ROC_i = (Close_i - Close_i-1) / Close_i-1. Si tres valores consecutivos de ROC son crecientes y del mismo signo (ROC_i > ROC_i-1 > ROC_i-2, con ROC_i > 0 para largos o ROC_i < 0 para cortos) Y el Close de la vela actual rompe el extremo del OR (Close > OR_high para largos, Close < OR_low para cortos), se genera la señal de entrada.

Resultado propuesto: Continuacion direccional del precio con un objetivo de ganancia mas alcanzable dentro de una sola sesion (1.0x ATR Diario en vez de 1.5x), dado que el analisis del backtest v1.0 mostro que el 89.5% de las salidas ocurrian por cierre de sesion y no por Take Profit -evidencia de que el objetivo original era demasiado ambicioso para el marco temporal intradia.

Invalidación: El precio retorna dentro del Rango de Apertura con cierre de una vela M5 nuevamente dentro del OR tras haberlo roto (fallo de ruptura), o el Z-Score de volatilidad diaria cae por debajo del umbral antes de la confirmacion de la señal.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260902-ORB_MOM-M5-v1.1.mq5) |
| Contrato | [Esquema v2](STRAT-20260902-ORB_MOM-M5-v1.1_specification.json) |
| Fuente Pine | No disponible |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 1.0
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 1.0,
    "barrier_2_stop_atr_multiplier": 0.5,
    "barrier_3_time_stop_max_bars": 75
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
