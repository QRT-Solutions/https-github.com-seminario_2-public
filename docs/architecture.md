# Arquitectura

`pyproject.toml` centraliza metadatos y dependencias. Hatchling construye el paquete;
`uv.lock` fija la resolución CPython 3.12 y `requirements.txt` exporta el núcleo
para pip. El grupo `dev` agrega tests, lint, tipos, seguridad y MkDocs.

| Componente | Responsabilidad |
|---|---|
| `src/seminario_lab/config.py` | Raíz explícita o ancestros del cwd; confinamiento de rutas |
| `validation.py` | Registro, esquema, IDs, artefactos y sincronía |
| `integrity.py` / `provenance.py` | Hashes y revisión Git identificada |
| `platforms.py` | Preparación y compilación opcionales en workspaces de pruebas |
| `publication.py` | Regresiones de secretos, rutas e historial |
| `masterclass/` | Presentación, guion y recursos locales |
| `quant_agentic_swarm/strategies/` | Fuente canónica de 17 estrategias |

No se modifica `sys.path`, no se busca configuración en carpetas del autor y no
se escribe al importar. Fuera del árbol se exige `--project`. No se cargan `.env`
ni conexiones automáticas. El núcleo no instala el stack científico de los
cuadernos retirados de esta edición.

Actualizar dependencias exige revisar, resolver, probar y exportar:

```sh
uv lock
uv export --locked --no-dev --no-emit-project --format requirements.txt --output-file requirements.txt
```

La instalación bloqueada sigue la [semántica de uv](https://docs.astral.sh/uv/concepts/projects/sync/).
MkDocs prepara una copia explícita de la documentación en `.local/site-source`;
`site/` es un producto de construcción. Ninguno se publica automáticamente.
