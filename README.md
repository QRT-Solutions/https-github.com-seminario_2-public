# QRT Quantitative Seminar — Diseño y validación de estrategias

Un seminario para convertir una idea de mercado en una hipótesis explícita, un
contrato revisable y una implementación que otras personas puedan comprobar.

[English](README.en.md) · [Empieza aquí](docs/start.md) · [Catálogo](docs/strategies.md) · [Contribuir](CONTRIBUTING.md)

## Qué aprenderás

- Separar hipótesis, reglas de entrada, salidas y dimensionamiento.
- Detectar supuestos ocultos, selección múltiple y afirmaciones sin evidencia.
- Leer contratos de estrategias y contrastarlos con fuentes Pine Script y MQL5.
- Diferenciar código disponible, contrato válido, compilación y equivalencia numérica.

La [presentación](masterclass/index.html) y su [guion](masterclass/guion.md) acompañan
un catálogo de **17 estrategias**, con fuentes canónicas, fichas y copias verificadas
para las plataformas. Esta edición no distribuye históricos ni los seis notebooks
de investigación: ese material docente se reserva para un seminario posterior.
El catálogo Pine/MQL5 se conserva completo.

## Inicio rápido: tres comandos

Necesitas Git, [uv](https://docs.astral.sh/uv/getting-started/installation/) y CPython
3.12; uv puede instalar el intérprete. Desde PowerShell, bash o zsh:

```sh
git clone https://github.com/felipemillar/seminario_2-public.git
uv run --directory seminario_2-public --locked --no-dev seminario doctor
uv run --directory seminario_2-public --locked --no-dev seminario quickstart
```

La instalación y la verificación no requieren datos de mercado, credenciales ni
cuentas. Abre `seminario_2-public/masterclass/index.html` para ver la presentación sin
servidor y sin fuentes externas obligatorias.

## Qué puedes comprobar

| Comando, dentro del clon | Resultado |
|---|---|
| `uv run seminario doctor` | Intérprete, recursos y estado del catálogo |
| `uv run seminario verify` | Esquema, IDs, artefactos, rutas y copias sincronizadas |
| `uv run seminario quickstart` | Verificación y ubicación de la ruta docente |

Fuera del árbol utiliza `seminario --project "RUTA DEL PROYECTO" verify`.
Las extensiones MT5 para preparación, compilación y pruebas son opcionales y usan
workspaces explícitos. Consulta [plataformas](docs/strategies.md).

## Explorar y contribuir

[Metodología](docs/methodology.md) · [Arquitectura](docs/architecture.md) ·
[Agentes](docs/agents.md) · [Glosario](docs/glossary.md) · [Validación](docs/validation.md)

El candidato incorpora tests, Ruff, tipos, escaneo de secretos y documentación
estática. Los [gates de publicación](docs/release.md) distinguen controles locales
de comprobaciones remotas pendientes. Las ilustraciones docentes y las hipótesis
del catálogo no constituyen evidencia de rentabilidad.

Autoría: **QRT Solutions**. Material original bajo [MIT](LICENSE).
[Licencias de terceros](THIRD_PARTY_NOTICES.md) · [Seguridad](SECURITY.md) ·
[Cambios](CHANGELOG.md) · [Cómo citar](CITATION.cff)

## Base de conocimientos para agentes

La [base de conocimientos](https://github.com/felipemillar/seminario_2-public/tree/main/base_de_conocimientos) incluye 50 documentos en Markdown, un catálogo
y un índice semántico para orientar las consultas de agentes. Consulta primero
[LLM_INDEX.md](https://github.com/felipemillar/seminario_2-public/tree/main/base_de_conocimientos/LLM_INDEX.md). Las imágenes referenciadas no están incluidas
en la carpeta de origen. Se conservan las atribuciones de cada obra.
