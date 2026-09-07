# Empieza aquí

Aprenderás a convertir una idea en reglas que otra persona pueda revisar.
Necesitas nociones de precios OHLC y lectura básica de código; el recorrido de
verificación solo requiere Git, uv y Python 3.12.

1. Prepara el [entorno](quickstart.md) y ejecuta `seminario quickstart`.
2. Abre la [presentación](../masterclass/index.html) y sigue el [guion](../masterclass/guion.md).
3. Elige una ficha del [catálogo de 17 estrategias](strategies.md).
4. Compara sus reglas con el contrato y la fuente canónica.
5. Ejecuta la validación y explica qué comprueba y qué sigue sin comprobar.

| Tema | Ejercicio | Evidencia para discutir |
|---|---|---|
| Hipótesis | Escribir condición, resultado esperado e invalidación | Contrato con supuestos explícitos |
| Entrada | Identificar qué barra conoce cada indicador | Fuente comentada, sin datos futuros implícitos |
| Salida | Diferenciar objetivo fijo, stop, tiempo y salida móvil | Semántica del contrato frente al código |
| Dimensionamiento | Expresar un mismo riesgo en precio, ATR y R | Cálculo manual con unidades declaradas |
| Validación | Separar igualdad de archivos de paridad matemática | Reporte de `seminario verify` y límites |
| Colaboración | Revisar una propuesta de cambio con evidencia | Diff, tests y declaración de lo pendiente |

Los cuadernos históricos de la masterclass y sus datasets se reservan para la
siguiente edición. No son requisitos ocultos del recorrido actual.
[Glosario y errores frecuentes](glossary.md) · [Metodología](methodology.md).
