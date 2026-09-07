# Qué se valida en esta edición

`seminario verify` revisa las 17 entradas, esquema v2, IDs únicos, referencias de
artefactos, confinamiento de rutas, existencia de fuentes, contratos registrados,
Pine v6 y sincronía de copias. No ejecuta ni afirma rentabilidad de estrategias.

La suite cubre escapes de rutas, registros duplicados, divergencia de copias,
salida móvil Donchian, workspaces aislados, secretos en UTF-16, contenedores anidados
y secretos que solo aparecen en el historial. También comprueba que la presentación
use recursos locales y conserve sus licencias. Las comprobaciones estructurales
no sustituyen una revisión visual y de teclado.

```sh
uv sync --locked --group dev
uv run ruff check .
uv run mypy src
uv run pytest
uv run seminario verify
uv run python tools/check_links.py
uv run mkdocs build --strict
uv run python -m seminario_lab.publication
```

El CI prepara Linux x86-64, Windows x86-64 y macOS arm64. Solo se anunciarán como
verificadas las plataformas con ejecución real de esos checks. La compilación
nativa MT5 permanece opcional y requiere evidencia propia.

La política del navegador de esta sesión bloqueó abrir el archivo local de la
presentación; no se eludió ese control. La inspección visual y de navegación queda
pendiente y consta en las condiciones de publicación.
