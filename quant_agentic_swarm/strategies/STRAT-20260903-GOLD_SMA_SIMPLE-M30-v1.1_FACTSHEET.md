# STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30 (shift = 1), la SMA rapida de 20 periodos cruza la SMA lenta de 50 periodos condicionado a que el precio de cierre este filtrado por la EMA 200 en M30 (Close[1] > EMA_200[1] para compras, Close[1] < EMA_200[1] para ventas) y el Circuit Breaker mensual no este activo.

Resultado propuesto: Elevacion del Profit Factor (> 1.50) y mitigacion de drawdowns mediante el filtrado de cruces en consolidacion lateral contra la tendencia macro, blindando las ganancias con Breakeven elastico (+0.75x ATR D1) y pausando rachas negativas con Circuit Breaker mensual tras 4 perdidas continuas.

Invalidación: Cierre de vela M30 con cruce opuesto de SMA 20/50, activacion de Breakeven, ejecucion del Stop Loss (0.75x ATR Diario) o expiracion de la Barrera 3 de tiempo (48 barras = 24 horas).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1_specification.json) |
| Fuente Pine | [Disponible](STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1.pine) |
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
