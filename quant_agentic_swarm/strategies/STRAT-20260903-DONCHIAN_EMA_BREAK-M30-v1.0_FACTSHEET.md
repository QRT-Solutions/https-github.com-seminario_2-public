# STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Ruptura de canal Donchian de N=20 periodos en M30 al cierre de vela (Close[1] > MAX(High[2..21]) para Long, o Close[1] < MIN(Low[2..21]) para Short) sincronizada con la direccion de la tendencia estructural mayor definida por la EMA de 200 periodos en M30 (Close[1] > EMA200[1] para Long, Close[1] < EMA200[1] para Short).

Resultado propuesto: Expansion direccional sostenida y continuacion del impulso en favor de la tendencia dominante, alcanzando una relacion beneficio/riesgo de 2.0 a 1.

Invalidación: Cierre de vela M30 que cruce en direccion contraria a la EMA 200 o que retroceda mas alla de la media del canal antes de alcanzar la Barrera 1 (Take Profit).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0_specification.json) |
| Fuente Pine | [Disponible](STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0.pine) |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 1.5
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 1.5,
    "barrier_2_stop_atr_multiplier": 0.75,
    "barrier_3_time_stop_max_bars": 32
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
