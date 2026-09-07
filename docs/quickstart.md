# Guía rápida

Instala Git y uv. Se utiliza CPython 3.12; uv puede obtenerlo automáticamente.
Ejecuta los tres comandos del [README](../README.md) desde la carpeta donde quieras
clonar. `uv run --locked` instala desde `uv.lock` y falla si el manifiesto exige
una nueva resolución. `--no-dev` instala únicamente el núcleo.

Dentro del clon:

```sh
uv run --locked --no-dev seminario doctor
uv run --locked --no-dev seminario verify
```

Abre `masterclass/index.html` como archivo local para seguir la presentación. Los
recursos obligatorios están incluidos; sus gráficos interactivos son ilustraciones
docentes. Los históricos y notebooks retirados de esta edición no son necesarios.

Fuera del proyecto: `seminario --project "RUTA DEL PROYECTO" verify`.
Las rutas con espacios son válidas si se entrecomillan. No se necesitan variables
de entorno, claves, brokers, Wine ni cuentas. `.env` no se carga automáticamente.

## Desarrollo

```sh
uv sync --locked --group dev
uv run pytest
uv run mkdocs build --strict
```

El sitio estático queda en `site/`. La construcción no publica en GitHub Pages.
Consulta [contribución](../CONTRIBUTING.md) para los controles completos.

## Alternativa con pip

`requirements.txt` se genera desde el lock, con versiones y hashes del núcleo.
Crea y activa un entorno Python 3.12 según el procedimiento de tu sistema:

```sh
python -m pip install --require-hashes -r requirements.txt
python -m pip install --no-deps .
seminario verify
```

No edites el export de requirements a mano; véase [arquitectura](architecture.md).
