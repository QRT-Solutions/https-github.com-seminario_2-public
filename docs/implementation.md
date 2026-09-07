# Implementación del candidato

**Actualización 2026-09-07:** el código ya está disponible en el repositorio público
independiente. El [estado de publicación](release.md) recoge la autorización, el CI
remoto y las revisiones pendientes. El informe siguiente conserva el estado de
la preparación local anterior.

Autoría: QRT Solutions. La distribución pública se preparó en un árbol independiente
con historia Git nueva. El original y su historial permanecen en un archivo privado
verificado. Una segunda copia privada conserva el laboratorio histórico implementado
para la edición posterior.

## Alcance final acordado

Se retira exclusivamente el material docente histórico de `masterclass`: seis
notebooks, tres gzip, resultados y soporte Python que ya no tiene consumidores.
La presentación conserva su contenido metodológico con ejemplos sin esos mercados.
Se mantienen las **17 estrategias**, **21 archivos Pine** y **37 fuentes MQL5** del
árbol público, incluidos plantillas, indicadores y copias. Los **25 archivos fuente
canónicos** de las estrategias coinciden byte a byte con sus originales.

## Cambios entregados

- Paquete CPython 3.12 con Hatchling, lock uv, export pip con hashes y CLI común.
- Contratos v2, correcciones descriptivas BTC/Donchian, confinamiento de rutas,
  generación de copias y disponibilidad explícita de cada plataforma.
- Presentación con recursos locales, foco visible, soporte de movimiento reducido
  y estructura de navegación mejorada; documentación bilingüe y MkDocs.
- MIT, avisos de terceros, citación, contribución, conducta, plantillas y política
  de seguridad con el canal privado GitHub habilitado y verificado por API.
- CI preparado para tres plataformas, acciones fijadas por SHA, permisos mínimos,
  escaneo general de secretos y regresiones específicas sobre fuentes e historial.

## Evidencia y límites

La validación local comprende lint, tipos, tests, contratos, sincronía, enlaces,
construcción estricta de documentación, wheel/sdist, instalación bloqueada desde
una ruta con espacios y la alternativa pip con hashes. El manifiesto de release
externo al Git relaciona el SHA final con archivos, paquetes y evidencias.

No se ejecutaron los jobs remotos de Linux y Windows. Docker local no tenía daemon
disponible. La compilación nativa y paridad siguen sin verificar. La apertura visual
de la presentación fue bloqueada por la política de URLs del navegador; se hicieron
controles estáticos y queda pendiente la revisión humana.

Las credenciales se excluyeron del candidato, pero su revocación en los emisores
no está confirmada. No se hizo push, no se creó una release ni se cambiaron remotos
o visibilidad. Los [gates](release.md) mantienen bloqueada la publicación hasta
revisar y autorizar el candidato exacto.

Como ajuste de seguridad autorizado por el encargo, se habilitó Private Vulnerability
Reporting en el repositorio GitHub y se comprobó su estado. No se envió ningún reporte.
