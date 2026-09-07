# STRAT-20260903-DONCHIAN_DBL-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Se define un Canal de Donchian de N=20 velas M30, calculado con el maximo y minimo de las velas en shift 3 a shift 22 (excluyendo las 2 velas de confirmacion mas recientes). Señal larga: dos cierres consecutivos (shift 2 y shift 1) por encima del maximo del canal. Señal corta: dos cierres consecutivos por debajo del minimo del canal.

Resultado propuesto: Continuacion direccional sostenida tras la ruptura confirmada, capturando el inicio de una tendencia nueva de mediano plazo.

Invalidación: El precio retorna dentro del canal con el cierre de una vela M30 nuevamente entre el maximo y el minimo del canal, antes de tocar la Barrera de Take Profit.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-DONCHIAN_DBL-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-DONCHIAN_DBL-M30-v1.0_specification.json) |
| Fuente Pine | No disponible |
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
    "barrier_3_time_stop_max_bars": 96
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
