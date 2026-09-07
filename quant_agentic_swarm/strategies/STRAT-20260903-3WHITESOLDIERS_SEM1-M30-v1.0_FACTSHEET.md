# STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Deteccion pura del patron Three White Soldiers en 3 velas consecutivas de M30 al cierre (Close > Open en las velas 3, 2 y 1; cierres crecientes Close[1] > Close[2] > Close[3]; y aperturas dentro del cuerpo anterior: Open[2] en [Open[3], Close[3]] y Open[1] en [Open[2], Close[2]]). Sin filtros de tendencia previa, sin filtros de ratio cuerpo/mecha y sin filtros de regimen de volatilidad.

Resultado propuesto: Captura del impulso comprador inmediatamente posterior a las 3 velas alcistas consecutivas, estableciendo la linea base de rendimiento intrinseco del patron antes de la incorporacion de filtros.

Invalidación: Cierre de una vela M30 por debajo del minimo del primer soldado (Low[3]) antes de alcanzar el Take Profit, o expiracion de la Barrera 3 (32 barras M30).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0_specification.json) |
| Fuente Pine | [Disponible](STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0.pine) |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 2.0
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 2.0,
    "barrier_2_stop_atr_multiplier": 1.0,
    "barrier_3_time_stop_max_bars": 32
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
