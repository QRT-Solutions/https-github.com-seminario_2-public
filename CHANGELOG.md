# Changelog — QRT Solutions

## 2026-09-11 — Agente Educador, Gobernanza Multi-Agente, Inyección de Datos y Métricas Porcentuales

- **Agente Educador Cuantitativo (`QuantEducatorAgent`):** Incorporada directiva pedagógica de 3 capas didácticas (Metáfora -> Matemática -> Decisión) en `AGENTS.md` para guiar al alumno paso a paso.
- **Protocolo de 4 Fases con Matriz Sintética (3 Variantes A, B, C):** Estandarizada la co-creación HITL con Stop Loss y Take Profit formulados estrictamente en múltiplos limpios de ATR Diario cerrado shift 1.
- **Shims Multi-Agente:** Desplegados `.cursorrules`, `CLAUDE.md`, `.agents/AGENTS.md` y `GEMINI.md` para garantizar interoperabilidad agéntica en Cursor, Google Antigravity, Claude Code y Gemini.
- **Módulo de Plataforma & Inyección de Datos:** Incorporadas herramientas para eliminar el error `10018: Market closed` (`Script_Unlock_Custom_Symbols_Sessions.mq5`) y permitir la inyección de series históricas de 20+ años M1 (`Script_Universal_Rates_Injector.mq5`).
- **Módulo de Métricas Porcentuales Puras:** Documentado el selector `ENUM_TESTER_CRITERION` para visualizar el Retorno % Acumulado en la columna nativa "Resultado" de MT5 y provisto el manual canónico `MT5/BACKTEST_AUDIT_MANUAL.md` con el Pool de 3 Módulos de Diagnóstico.
- **Documento Maestro para Alumnos:** Añadido `INSTRUCCIONES_SISTEMA_CREADOR_BOTS_IA.md` para usuarios de ChatGPT Web, Claude Web, Antigravity y Cursor.
- **Base de Formación Cuantitativa Canónica (100 Preguntas Científicas):** Publicada la `MT5/GUIA_100_PREGUNTAS_TRADING_CUANTITATIVO.md` y sus 4 pilares temáticos modulares (`MT5/docs_educativos/`) bajo la matriz de 5 dimensiones científicas para resolver integralmente las dudas técnicas, algorítmicas y operativas de los alumnos.

## 2026-09-07 — Repositorio de la empresa

- Publicada la distribución completa, incluida `base_de_conocimientos`, en
  `QRT-Solutions/seminario_2-public`. Se conserva su historial público.
- Actualizados los enlaces de clonación, base de conocimientos, citación, metadatos
  y seguridad para la organización QRT-Solutions.
- El repositorio personal permanece disponible en su ubicación original.

## 2026-09-07 — Base de conocimientos compartida

- Incorporados 50 documentos, README, índice semántico y archivo de exclusiones
  de `base_de_conocimientos`, por solicitud y confirmación del mantenedor.
- Conservados byte a byte los 50 documentos; corregidos enlaces y disponibilidad
  de recursos en los índices. No se incluyen imágenes ausentes en el origen.
- Habilitadas rutas largas de Git al clonar y en CI Windows para conservar
  los nombres originales de los documentos.
- Corregidos falsos positivos de autenticación Basic en prosa y una URL pública
  bibliográfica, con regresiones para conservar la detección de credenciales.
- Registrados hashes y referencias históricas; el verificador mantiene controles
  estrictos para índices, nuevos archivos y textos modificados.

## 2026-09-07 — Repositorio público independiente

- Publicado el código del candidato en `felipemillar/seminario_2-public`, por
  autorización del mantenedor tras confirmar el cambio de credenciales anteriores.
- CI aprobado en Windows, Linux y macOS, con escaneo de secretos y dependencias.
- Canal privado de vulnerabilidades habilitado y verificado en el nuevo repositorio.
- Sin release estable ni Pages; revisiones humanas pendientes documentadas.

## 2026-09-07 — Destino independiente

- Enlaces de clonación, documentación, citación y seguridad dirigidos al nuevo
  repositorio `felipemillar/seminario_2-public`.
- El repositorio original conserva sus ramas, historial y remoto.
- CI invoca `uv run python` para que Windows utilice el intérprete del entorno
  instalado al validar el registro y las copias de estrategias.

## 1.0.0rc1 — 2026-09-06 (candidato local, no publicado)

- Distribución independiente e historia nueva, con archivo privado verificado.
- Retiradas credenciales, conexiones personales, gateway operativo, binarios sin
  procedencia y contenidos ajenos al seminario.
- CPython 3.12, CLI, Hatchling, uv y requirements derivado de un único lock.
- 17 contratos v2 y todo el catálogo Pine/MQL5 conservado. BTC describe sus filtros
  reales y Donchian declara salida móvil sin centinela de beneficio fijo.
- Fuentes canónicas, copias generadas y estados separados de compilación y paridad.
- Presentación, documentación bilingüe, licencias y controles continuos.
- Los seis notebooks y los datos históricos de masterclass se posponen al siguiente
  seminario, junto con su soporte de ejecución y resultados. Se preserva una copia
  privada del laboratorio implementado. El retiro no afecta al catálogo Pine/MQL5.

No se etiqueta v1.0.0 ni se autoriza publicación mientras falten los gates del
candidato final. La evidencia distingue comprobaciones locales y remotas.
