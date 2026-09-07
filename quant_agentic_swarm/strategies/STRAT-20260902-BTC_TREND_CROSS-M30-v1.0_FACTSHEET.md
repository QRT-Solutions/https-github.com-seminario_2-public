# STRAT-20260902-BTC_TREND_CROSS-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Cruce alcista EMA 12 > 26 con precio de cierre estrictamente superior a EMA 200 en M30 (para largos), o cruce bajista EMA 12 < 26 con precio inferior a EMA 200 (para cortos), evaluado al cierre de barra (shift 1).

Resultado propuesto: Hipótesis de continuación; TP 1.0 ATR D1 y SL 0.75 ATR D1 (relación nominal 4:3 antes de costes).

Invalidación: Stop Loss 0.75 ATR D1 o 32 barras M30; salida preventiva por cruce desactivada por defecto.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260902-BTC_TREND_CROSS-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260902-BTC_TREND_CROSS-M30-v1.0_specification.json) |
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
    "barrier_2_stop_atr_multiplier": 0.75,
    "barrier_3_time_stop_max_bars": 32
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
