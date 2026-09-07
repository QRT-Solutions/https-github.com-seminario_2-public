# Contribuir — QRT Solutions

Describe el problema y cómo reproducirlo. Una contribución puede mejorar explicación,
accesibilidad, pruebas o implementación; una rentabilidad más alta no es un criterio
de aceptación. Los cambios deben ser pertinentes al seminario.

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

Mantén IDs y fuentes canónicas de estrategias. Si cambias un cálculo, documenta
antes/después, supuestos y evidencia. Los notebooks históricos
no forman parte de esta edición. No incluyas
históricos, secretos, cuentas, rutas personales o transcripciones de libros.

Las contribuciones originales se aceptan bajo MIT. Declara recursos de terceros,
sus permisos y cualquier ayuda de herramientas que sea relevante para revisar el
cambio. Consulta [conducta](CODE_OF_CONDUCT.md) y [seguridad](SECURITY.md).
