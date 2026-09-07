# Seguridad — QRT Solutions

El seminario contiene fuentes de investigación y herramientas de validación, sin
servicio de ejecución operativa. QRT Solutions mantiene la política; la administración
del repositorio corresponde a la organización `QRT-Solutions`. Las correcciones se aplicarán
a la última versión 1.x publicada. El candidato actual todavía no es una release.

## Reportar una vulnerabilidad

El reporte privado de vulnerabilidades está habilitado y fue verificado mediante
la API de GitHub el 2026-09-07. Entra en [Security](https://github.com/QRT-Solutions/seminario_2-public/security)
y selecciona **Report a vulnerability**. GitHub puede pedirte iniciar sesión.
La comprobación corresponde a este repositorio; no se envió un reporte de prueba.

No incluyas vulnerabilidades sin corregir ni datos privados en issues públicos.
Indica versión o SHA afectado, componente, impacto, pasos mínimos de reproducción
y propuesta de corrección si existe. Usa valores ficticios y evidencia redactada;
no compartas credenciales activas. Limita las pruebas a una copia propia y evita
acceder a datos ajenos, interrumpir servicios o realizar ingeniería social.

QRT Solutions tiene como objetivo acusar recibo en 3 días hábiles y entregar una
evaluación inicial en 10. Son objetivos de mantenimiento, no un SLA contractual.
La divulgación se coordinará según impacto y disponibilidad de una corrección.
Se ofrecerá crédito con consentimiento del reportante.

## Prevención y divulgación

El CI revisa secretos, rutas privadas, contratos y dependencias. Antes de publicar
se revisan también historial, metadatos y assets sobre el SHA final. Eliminar una
credencial del código no la revoca: el emisor debe confirmar su rotación. El alcance
docente y la ausencia de componentes operativos forman parte de las
[condiciones de publicación](docs/release.md).
