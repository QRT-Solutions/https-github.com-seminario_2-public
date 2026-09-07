# STRAT-20260903-DONCHIAN_DBL-M30-v1.1

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Version LONG-ONLY. Se define un Canal de Donchian de N=20 velas M30, calculado con el maximo de las velas en shift 3 a shift 22. Señal larga: dos cierres consecutivos (shift 2 y shift 1) por encima del maximo del canal. No se opera el lado corto.

Resultado propuesto: Captura de tendencias alcistas sostenidas, dejando correr la ganancia mediante un canal de salida mas corto (N_exit=10) en vez de un Take Profit fijo, tal como el sistema Turtle Trading original.

Invalidación: El precio cierra una vela M30 por debajo del minimo de las ultimas N_exit=10 velas (canal de salida corto), o se activa el Stop Loss inicial de proteccion (1.0x ATR Diario) antes de que el canal de salida se active.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-DONCHIAN_DBL-M30-v1.1.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-DONCHIAN_DBL-M30-v1.1_specification.json) |
| Fuente Pine | No disponible |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "donchian_trailing",
    "channel_period": 10
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": null,
    "barrier_2_stop_atr_multiplier": 1.0,
    "barrier_3_time_stop_max_bars": 200,
    "note": "No fixed take profit. Source submits TP=0; trailing Donchian exit uses lows of closed bars 2..11. The former 50 ATR sentinel was documentation-only."
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
