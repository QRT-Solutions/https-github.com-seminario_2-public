# Metodología y límites

Autoría: QRT Solutions. Una hipótesis es una proposición comprobable. Una narrativa
económica ayuda a formularla, pero no demuestra causalidad ni rentabilidad.
Esta edición estudia el diseño, los contratos y las fuentes de 17 estrategias;
no publica resultados de backtests ni distribuye históricos de la masterclass.

## Del supuesto al contrato

Explicita condición de entrada, resultado esperado e invalidación. Identifica
activo, timeframe, barras disponibles, indicadores, unidades, salidas y duración.
Toda afirmación debe distinguir una propuesta de una observación verificada.

Los valores predeterminados e identificadores de las estrategias se preservan.
BTC se documenta conforme a su código: EMA12/26 con filtro EMA200 y pendiente de
cinco barras, TP 1 ATR diario, SL 0.75 ATR y 32 barras M30. No se le atribuye un
filtro Z-score que no implementa. Donchian v1.1 expresa salida móvil de canal 10,
sin convertir el antiguo centinela documental de 50 ATR en un objetivo fijo.

## Cuatro niveles de evidencia

| Nivel | Qué comprueba | Qué no demuestra |
|---|---|---|
| Fuente disponible | El artefacto existe y corresponde al ID | Compilación o corrección financiera |
| Contrato válido | Estructura y referencias conformes al esquema | Que cada regla narrativa esté implementada exactamente |
| Compilación identificada | Fuente, versión/hash del compilador y binario nuevo | Equivalencia numérica entre plataformas |
| Paridad numérica | Operaciones, tiempos, precios y costes comparados | Rentabilidad futura |

La validación automática llega a los dos primeros niveles y a la igualdad de
copias generadas. La revisión semántica BTC/Donchian está documentada; no se anuncia
una auditoría exhaustiva de cada regla de los 17 motores. Compilación nativa y
paridad permanecen sin verificar en el candidato.

## Antes de evaluar una estrategia

Documenta procedencia y permiso de datos, zona horaria IANA, significado del timestamp,
rollovers, unidades, calendario, DST, huecos y tratamiento de barras ambiguas.
Explicita comisiones, spread, latencia, tamaño de posición y solapamientos. Si stop
y objetivo se tocan en la misma barra, declara cómo resuelves el orden desconocido.

Separa la selección in-sample de la evaluación fuera de muestra. Un máximo de rejilla
no es una meseta ni una demostración de robustez. Registra todos los ensayos y revisa
sensibilidad, vecindad y conectividad. Los ejemplos interactivos de la presentación
usan cifras ilustrativas; no sustituyen evidencia histórica.

Cuando se pruebe paridad, exige IDs y recuentos exactos, tolerancias numéricas
explícitas y redondeo monetario documentado. Conserva commit, configuración, lock,
datos identificados y operaciones. No uses igualdad de PNG o fuentes como prueba
matemática. No ajustes parámetros para mejorar la presentación del candidato.

Los recorridos con notebooks e históricos de la masterclass se preservaron fuera
de esta distribución para la siguiente edición. Su retiro no elimina ninguna
fuente Pine/MQL5 del catálogo.
