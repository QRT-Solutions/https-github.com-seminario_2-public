# STRAT-20260903-3WHITESOLDIERS-H4-v1.1

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Se identifican 3 velas H4 consecutivas alcistas (Close > Open) con cierres crecientes (Close[1] > Close[2] > Close[3]). Version simplificada de diagnostico cuantitativo donde los filtros secundarios de mechas, tendencia previa EMA 50 y regimen de volatilidad Z-Score estan desactivados por defecto para aislar la geometria pura del patron.

Resultado propuesto: Expansion alcista posterior al cierre de los tres soldados, extendiendose hasta la Barrera de Take Profit (2.5x ATR D1) o cierre por tiempo (24 barras H4 = 96 horas).

Invalidación: El precio cierra por debajo del Stop Loss de 0.75x ATR D1 o expira la barrera temporal maxima de 24 barras H4.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-3WHITESOLDIERS-H4-v1.1.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-3WHITESOLDIERS-H4-v1.1_specification.json) |
| Fuente Pine | No disponible |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 2.5
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 2.5,
    "barrier_2_stop_atr_multiplier": 0.75,
    "barrier_3_time_stop_max_bars": 24
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
