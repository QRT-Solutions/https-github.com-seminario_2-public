# Catálogo y extensiones de backtesting

El [registro](../quant_agentic_swarm/STRATEGY_REGISTRY.json) conserva 17 IDs.
Las fuentes canónicas residen en `quant_agentic_swarm/strategies/`; cada una tiene
contrato v2 y ficha. `MT5/estrategias/` y `TradingView/pine/strategies/` son copias
generadas, verificadas por contenido. Los indicadores y ejemplos Pine conservados
son material auxiliar, no entradas adicionales del catálogo.

```sh
uv run python quant_agentic_swarm/tools/validate_registry.py
uv run python quant_agentic_swarm/tools/deploy_strategies.py
uv run python quant_agentic_swarm/tools/deploy_strategies.py --check
```

BTC documenta el filtro EMA200 con pendiente de cinco barras, sin inventar un
filtro Z-score no implementado; SL 0.75 ATR D1, TP 1 ATR D1 y 32 barras M30.
Donchian v1.1 declara `donchian_trailing`, canal de salida 10 y ausencia de TP fijo.
El antiguo 50 ATR era un centinela documental, no una barrera que hubiera que reducir.
El esquema v1 queda disponible solo como referencia de migración.

## MT5 opcional

La CLI principal no instala ni importa MetaTrader5. El adaptador opcional prepara
un workspace `artifacts/mt5/NOMBRE`, copia una fuente e identifica una prueba:

```sh
uv run python -m seminario_lab.platforms --workspace ejemplo prepare --strategy STRAT-20260903-DONCHIAN_DBL-M30-v1.1 --symbol XAUUSD --start 2022-02-01 --end 2024-02-01
```

En Windows puedes compilar con MetaEditor explícito mediante el subcomando `compile`,
indicando `--source MQL5/Experts/ID.mq5`, `--editor RUTA` y `--editor-version VERSION`.
Se guardan hashes de fuente, compilador y binario. No se incluyen EX5 en Git.

El subcomando `test --terminal terminal64.exe` acepta únicamente una copia portable
ubicada dentro del workspace marcado, con configuración de Strategy Tester y
compilación previa. No descubre terminales, no copia a escritorios Wine, no agrega
cuentas ni termina procesos globalmente. El historial importado y sus permisos son
responsabilidad del experimento. El adaptador falla si no existe un reporte nuevo.
La compilación y ejecución nativas todavía requieren validación en Windows.

Los reportes HTML permanecen como evidencia local. Su existencia no demuestra
paridad con Python o Pine: se necesita comparar tiempos, precios, operaciones,
indicadores, redondeos y costes con tolerancias documentadas.

## Las 17 entradas

| Estrategia | Ficha y contrato | Pine | MQL5 |
|---|---|---|---|
| 3WHITESOLDIERS_SEM1-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0_specification.json) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0.pine) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0.mq5) |
| DONCHIAN_EMA_BREAK-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0_specification.json) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0.pine) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0.mq5) |
| GOLD_SMA_SIMPLE-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0.mq5) |
| GOLD_SMA_SIMPLE-M30-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1_specification.json) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1.pine) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1.mq5) |
| GOLD_SMA_CROSS-M30-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1_specification.json) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1.pine) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1.mq5) |
| GOLD_SMA_CROSS-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0_specification.json) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0.pine) | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0.mq5) |
| USGAP_MOM-M15-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.1_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.1.mq5) |
| USGAP_MOM-M15-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-USGAP_MOM-M15-v1.0.mq5) |
| GOLD_ELDER_CROSS-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0.mq5) |
| GOLD_PULLBACK_EMA-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0.mq5) |
| BTC_TREND_CROSS-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-BTC_TREND_CROSS-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-BTC_TREND_CROSS-M30-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-BTC_TREND_CROSS-M30-v1.0.mq5) |
| 3WHITESOLDIERS-H4-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.0.mq5) |
| 3WHITESOLDIERS-H4-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.1_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-3WHITESOLDIERS-H4-v1.1.mq5) |
| DONCHIAN_DBL-M30-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.0.mq5) |
| DONCHIAN_DBL-M30-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.1_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260903-DONCHIAN_DBL-M30-v1.1.mq5) |
| ORB_MOM-M5-v1.0 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.0_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.0_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.0.mq5) |
| ORB_MOM-M5-v1.1 | [Ficha](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.1_FACTSHEET.md) · [Contrato](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.1_specification.json) | No disponible | [Fuente](../quant_agentic_swarm/strategies/STRAT-20260902-ORB_MOM-M5-v1.1.mq5) |
