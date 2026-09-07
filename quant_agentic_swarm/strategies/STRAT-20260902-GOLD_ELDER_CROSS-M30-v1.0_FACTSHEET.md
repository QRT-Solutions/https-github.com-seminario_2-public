# STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30, la EMA rapida (9) cruza sobre la EMA lenta (21), condicionado a que el precio de cierre este estrictamente alineado con la tendencia macro dictada por la EMA 200 en M30 (Close > EMA 200 con pendiente no negativa para largos; Close < EMA 200 con pendiente no positiva para cortos).

Resultado propuesto: Desplazamiento tendencial asimetrico en la direccion macro del oro (XAUUSD), capturando expansiones de momentum institucional y eliminando mas del 50% de los falsos quiebres (whipsaws) que ocurren contra la tendencia principal.

Invalidación: Cierre de vela M30 que reingrese y vulnere en sentido opuesto la EMA 200, o ejecucion de la Barrera 2 de Stop Loss anclada a volatilidad diaria.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0_specification.json) |
| Fuente Pine | No disponible |
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
