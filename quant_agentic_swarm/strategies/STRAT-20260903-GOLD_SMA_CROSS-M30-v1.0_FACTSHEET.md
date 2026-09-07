# STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30 (shift = 1), la SMA rapida de 20 periodos cruza por encima de la SMA lenta de 50 periodos, condicionado a que el precio de cierre este estrictamente por encima de la EMA 200 en M30 para largos (o cruce bajista con Close < EMA 200 para cortos).

Resultado propuesto: Captura del impulso inercial direccional intermedio con un ratio beneficio/riesgo de 2.0 a 1, eliminando la mayoria de los quiebres falsos (whipsaws) que ocurren en rangos laterales contra la marea institucional de largo plazo.

Invalidación: Cierre de vela M30 con cruce opuesto de SMA 20/50, o ejecucion de la Barrera 2 de Stop Loss anclada al 0.75x ATR Diario.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0_specification.json) |
| Fuente Pine | [Disponible](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0.pine) |
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
    "barrier_3_time_stop_max_bars": 48
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
