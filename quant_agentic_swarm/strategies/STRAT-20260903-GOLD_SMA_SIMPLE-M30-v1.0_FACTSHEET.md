# STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En vela cerrada de M30 (shift = 1), la SMA rapida de 20 periodos cruza la SMA lenta de 50 periodos (cruce alcista o bajista), sin filtros de tendencia macro ni de regimen de volatilidad adicionales.

Resultado propuesto: El precio acelera en la direccion del cruce inmediatamente despues de este, capturando el arranque de un nuevo impulso de corto/mediano plazo tanto en compras como en ventas.

Invalidación: Cierre de vela M30 con cruce opuesto de SMA 20/50, ejecucion del Stop Loss (0.75x ATR Diario) o expiracion de la Barrera 3 de tiempo (48 barras = 24 horas).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0_specification.json) |
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
    "barrier_3_time_stop_max_bars": 48
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
