# Estado de publicación

Autoría: QRT Solutions.

El 2026-09-07 el mantenedor autorizó publicar el código en el repositorio nuevo
[seminario_2-public](https://github.com/felipemillar/seminario_2-public) y confirmó
haber cambiado las credenciales anteriores. El repositorio es público y su canal
privado de seguridad se verificó mediante la API. La confirmación del mantenedor
no equivale a una prueba independiente de rechazo de las credenciales antiguas.

El [CI del candidato](https://github.com/felipemillar/seminario_2-public/actions/runs/34132013725)
aprobó Linux, Windows y macOS, secretos y dependencias. Se publica el código del
candidato `1.0.0rc1`; no se ha emitido una release estable ni desplegado Pages.
La revisión humana independiente de la guía y de accesibilidad permanece pendiente.
No se generó una atestación que declare esas revisiones completadas.

## Registro histórico de preparación, anterior a la publicación

Las condiciones y estados siguientes describen la preparación inicial. El estado
actual del repositorio se indica arriba; los controles estrictos del script de
atestación y de Pages se mantienen.

**Dictamen: APROBADO CONDICIONALMENTE para preparación local.
Publicación todavía no autorizada.** El candidato no equivale a v1.0.0 publicada.

La distribución utiliza una historia Git nueva. El repositorio y sus referencias
anteriores permanecen en un archivo privado verificado. No se trasladan ramas,
tags, libros, credenciales ni conexiones personales. El [manifiesto de contenido](content-manifest.json)
detalla la selección de originales.

Por decisión del mantenedor, los históricos y seis notebooks se retiraron de
`masterclass`, junto con sus resultados y dependencias de ejecución. El archivo
privado conserva el laboratorio preparado para una edición posterior. **Las 17
estrategias y las fuentes Pine/MQL5 permanecen en esta distribución.**

## Puertas secuenciales

| Gate | Evidencia exigida | Estado de preparación |
|---|---|---|
| 1. Contención | Archivo privado verificado; credenciales anteriores revocadas en sus emisores | Archivo y exclusión realizados; revocación no confirmada |
| 2. Alcance y derechos | Solo contenido del seminario, licencias originales y avisos de terceros | Sin históricos ni transcripciones; catálogos conservados |
| 3. Construcción | Instalación bloqueada, contratos, sincronía, lint, tipos, tests y documentación | Verificación local y evidencia de candidato |
| 4. Plataformas | Linux x86-64, Windows x86-64 y macOS arm64 sobre el mismo candidato | macOS local; workflows preparados, sin ejecución remota aún |
| 5. Experiencia | Guía completada por una persona independiente, revisión visual/teclado y contacto privado verificado | Canal GitHub habilitado y verificado; guías y controles estáticos preparados; revisión humana pendiente |
| 6. Publicación | Historial, metadatos, assets y auditoría del SHA final; autorización concreta | Gate bloqueado mientras falten evidencias |

El navegador bloqueó la apertura de la presentación local por su política de URLs;
no se eludió ese control. Las comprobaciones estáticas de accesibilidad no certifican
la experiencia visual o móvil. Compilación MT5 y paridad matemática son extensiones
con estado explícito: no se anuncian verificadas sin pruebas nativas.

## Comprobaciones reproducibles

```sh
uv run python tools/release_gate.py
uv run python tools/release_gate.py --publication --attestation APROBACION.json
```

La aprobación externa no se versiona en el mismo commit que certifica. Incluye
`reviewed_commit`, `reviewer`, `validated_platforms`, `evidence_references` y las
confirmaciones booleanas exigidas por `tools/release_gate.py`. No contiene secretos.
Pages recibe esa atestación mediante una entrada del workflow manual y falla si
el SHA o las condiciones no coinciden. Configura el entorno protegido `github-pages`
con revisión del mantenedor antes de [publicar documentación](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

El CI fija acciones por SHA y uv por versión, usa permisos de lectura y no conserva
credenciales Git. Los runners siguen la [tabla oficial](https://docs.github.com/en/actions/reference/runners/github-hosted-runners).
Configura como checks requeridos los jobs de Python por plataforma, `General secret scan`
y `Dependency vulnerabilities`, después de verificar sus nombres efectivos en GitHub.

## Última operación revisable

Antes de cambiar un remoto, reemplazar `main`, subir assets o modificar visibilidad,
se revisarán el SHA exacto, sus referencias y manifiestos. Solo entonces se prepara
la operación concreta para autorización. No se ha hecho push ni se ha sustituido el
historial remoto durante esta implementación.

[Informe de implementación y evidencia](implementation.md).

El único ajuste remoto realizado fue habilitar el reporte privado de vulnerabilidades
y comprobarlo mediante la API. No se cambió visibilidad, ramas ni contenido remoto.
