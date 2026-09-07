# STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30 con alineacion de tendencia definida por la cascada de Fibonacci EMA 13 > EMA 34 > EMA 89 (para compras) o EMA 13 < EMA 34 < EMA 89 (para ventas), el precio genera un retroceso (pullback) hacia el soporte/resistencia dinamico entre EMA 13 y EMA 34, y la vela cierra confirmando el rechazo a favor del flujo principal (Close > EMA 13 en compra, Close < EMA 13 en venta).

Resultado propuesto: Entrada asimetrica de alta probabilidad con bajo Drawdown inicial, evitando comprar en sobreextension y alcanzando un Payoff Ratio superior a 1.8x al capturar la continuacion del impulso tendencial en el oro.

Invalidación: Cierre de vela M30 que perfore la EMA 34 en contra de la tendencia, o activacion de la Barrera 2 de Stop Loss anclada a ATR diario.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0_specification.json) |
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
