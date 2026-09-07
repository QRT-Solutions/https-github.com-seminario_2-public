# STRAT-20260903-3WHITESOLDIERS-H4-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

Se identifican 3 velas H4 consecutivas alcistas (Close > Open) con cierres crecientes (Close[1] > Close[2] > Close[3], siendo [1] la mas reciente). Cada vela abre dentro del cuerpo real de la vela anterior (Open[2] entre Open[3] y Close[3]; Open[1] entre Open[2] y Close[2]). Cada vela tiene cuerpo real >= 60% de su rango total (Close-Open >= 0.6*(High-Low)) y mecha superior pequeña (High-Close <= 0.25*(Close-Open)). El patron solo es valido si en las 5 velas H4 previas al primer soldado el precio cerraba consistentemente por debajo de la EMA 50 (tendencia bajista confirmada).

Resultado propuesto: Reversion de la tendencia bajista previa hacia una fase alcista sostenida, con el precio extendiendose en la direccion de la ruptura hasta tocar la Barrera de Take Profit o el limite de tiempo.

Invalidación: El precio cierra una vela H4 por debajo del minimo de la primera vela del patron (el 'primer soldado') antes de tocar el Take Profit, o la vela inmediatamente posterior al patron cierra bajista con un cuerpo mayor al 50% del rango combinado de los tres soldados (evidencia de absorcion inmediata de la demanda y fallo del patron).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260903-3WHITESOLDIERS-H4-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260903-3WHITESOLDIERS-H4-v1.0_specification.json) |
| Fuente Pine | No disponible |
| Compilación nativa | No verificada en este candidato |
| Equivalencia numérica entre plataformas | No verificada |

## Salidas y parámetros

```json
{
  "profit_exit": {
    "kind": "fixed_atr",
    "atr_d1_multiplier": 2.5
  },
  "triple_barrier_exits": {
    "barrier_1_profit_atr_d1_multiplier": 2.5,
    "barrier_2_stop_atr_multiplier": 0.75,
    "barrier_3_time_stop_max_bars": 24
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
