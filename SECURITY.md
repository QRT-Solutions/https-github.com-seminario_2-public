# Seguridad — QRT Solutions

Este proyecto contiene un laboratorio educativo, sin servicio operativo ni acceso
a cuentas. La primera versión pública aún es candidata. Las correcciones de
seguridad se aplicarán a la última versión 1.x publicada; no se ofrece soporte a
copias del historial privado anterior.

## Reportar una vulnerabilidad

**El canal privado aún debe verificarse antes de publicar v1.0.0.** No adjuntes
credenciales, datos de cuentas o pruebas de explotación a un issue público.
Cuando el mantenedor habilite y compruebe Private Vulnerability Reporting, GitHub
mostrará «Report a vulnerability» en la pestaña Security. Hasta entonces, no se
anuncia un canal privado operativo ni un plazo de respuesta garantizado.

El reporte debe incluir versión o SHA afectado, componente, impacto, pasos mínimos
para reproducir y una propuesta de corrección si existe. Utiliza valores ficticios
y evidencia redactada; nunca compartas tokens activos. Limita las pruebas a una
copia propia y evita acceso a datos de terceros, interrupciones o ingeniería social.

Una vez habilitado el canal, QRT Solutions tendrá como objetivo acusar recibo en
3 días hábiles, dar una evaluación inicial en 10 y acordar la divulgación coordinada
según el impacto y la disponibilidad de una corrección. Se ofrecerá crédito con
consentimiento del reportante. Es un compromiso de mantenimiento propuesto,
pendiente de designación y verificación del responsable.

## Prevención y divulgación

El CI revisa secretos, rutas privadas, contratos y dependencias. Antes de una
publicación se revisan también historial, metadatos y assets sobre el SHA final.
Eliminar una credencial del código no la revoca: el emisor debe confirmar su
rotación. El alcance docente y la ausencia de componentes operativos forman
parte de las [condiciones de publicación](docs/release.md).
