# STRAT-20260902-USGAP_MOM-M15-v1.0

Autoría: QRT Solutions. Extensión de investigación y backtesting.

## Hipótesis

En la apertura de la sesion regular de EEUU (09:30 ET), el precio presenta un gap (Open_hoy - Close_dia_previo) >= 1.0x ATR_D(14)[shift 1] respecto al cierre previo, y la primera vela M15 de la sesion cierra confirmando la direccion del gap (Close > Open_sesion para largos, Close < Open_sesion para cortos) sin retroceder mas del 50% de su propio rango High-Low.

Resultado propuesto: Aceleracion direccional sostenida durante la sesion regular de EEUU, extendiendo el rango de precio en la direccion del gap.

Invalidación: El precio retorna y una vela M15 cierra mas alla del 50% del gap dentro de las dos primeras velas M15 de la sesion (primeros 30 minutos).

## Disponibilidad comprobable

| Evidencia | Estado |
|---|---|
| Fuente MQL5 | [Disponible](STRAT-20260902-USGAP_MOM-M15-v1.0.mq5) |
| Contrato | [Esquema v2](STRAT-20260902-USGAP_MOM-M15-v1.0_specification.json) |
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
    "barrier_3_time_stop_max_bars": 26
  }
}
```

Las afirmaciones de rendimiento o antecedentes narrativos del contrato original
no sustituyen un reporte reproducible. Los números del catálogo no constituyen
una certificación de resultados ni una instrucción de ejecución operativa.
Consulta [metodología](../../docs/methodology.md) y [plataformas](../../docs/strategies.md).
