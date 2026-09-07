# STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30 (shift = 1), la SMA rápida de 20 periodos cruza por encima de la SMA lenta de 50 periodos condicionado a que el precio de cierre esté por encima de la EMA 200 en M30 (modo Long-Only optimizado por asimetría direccional).

Resultado propuesto: Maximización de la esperanza matemática (E > +2.50 USD/trade) y elevación del Profit Factor (> 1.40) al descartar las posiciones en corto, con toma de beneficios calibrada en la masa modal de MFE (1.10x ATR Diario) y blindaje mediante Breakeven elástico (+0.50x ATR D1).

Invalidación: Cierre de vela M30 con cruce opuesto de SMA 20/50, activación de Breakeven o ejecución del Stop Loss de 0.75x ATR Diario.

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1_specification.json) |
| Fuente Pine | [Disponible](STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1.pine) |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 1.1
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 1.1,
    "barrier_2_stop_atr_multiplier": 0.75,
    "barrier_3_time_stop_max_bars": 48
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
