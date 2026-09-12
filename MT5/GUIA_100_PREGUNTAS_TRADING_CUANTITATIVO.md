# Guía Canónica de Formación Cuantitativa: Las 100 Preguntas Esenciales del Trader Sistemático

> **Autor Institucional:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Repositorio Oficial `seminario_2` & Plataforma Educativa Institucional  
> **Versión:** 2.0 (Edición Definitiva con Matriz Científica de 5 Dimensiones)  
> **Propósito:** Responder exhaustivamente a las dudas técnicas, conceptuales y operativas de los alumnos de la Masterclass Cuantitativa.

---

## 1. Presentación y Filosofía del Estándar QRT

Esta obra recopila y resuelve de manera formal las **100 preguntas y problemas fundamentales** que enfrenta todo desarrollador cuantitativo al construir, probar y auditar sistemas automatizados de trading.

Cada una de las 100 preguntas ha sido redactada y resuelta bajo la **Matriz Científica Institucional de 5 Dimensiones**:
1. **Tesis / Principio Causal:** El fundamento lógico y de microestructura de mercado que explica el fenómeno.
2. **Evidencia & Fuente Canónica:** La referencia bibliográfica de la literatura cuantitativa clásica y moderna (Kaufman, Aronson, López de Prado, Sweeney, Crabel, Minervini, Elder, etc.).
3. **Rigor Matemático / Algorítmico:** La formulación matemática formal, ecuaciones invariantes y límites probabilísticos.
4. **Protocolo Operativo (Paso a Paso):** El procedimiento práctico y reproducible en MetaTrader 5, Pine Script v6 o scripts de Python.
5. **Criterio de Falsabilidad / Validación:** El umbral empírico medible que permite validar o rechazar el modelo de forma objetiva.

---

## 2. Mapa Modular de los 4 Pilares

La guía está estructurada en 4 pilares temáticos de 25 preguntas cada uno, disponibles en documentos dedicados de alta resolución:

| Pilar | Ámbito Temático | Preguntas | Archivo Canónico |
| :--- | :--- | :--- | :--- |
| **Pilar 1** | **Entorno, Plataformas (MT5 / TradingView) & Datos Históricos** | Q-001 a Q-025 | [`PILAR_1_ENTORNO_Y_DATOS.md`](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md) |
| **Pilar 2** | **Formulación de Hipótesis, Diálogo con la IA & Lógica Cuantitativa** | Q-026 a Q-050 | [`PILAR_2_HIPOTESIS_Y_LOGICA.md`](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md) |
| **Pilar 3** | **Código, Compilación, Paridad MQL5 / Pine Script & Despliegue** | Q-051 a Q-075 | [`PILAR_3_CODIGO_Y_PARIDAD.md`](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md) |
| **Pilar 4** | **Backtesting, Optimización & Auditoría Cuantitativa** | Q-076 a Q-100 | [`PILAR_4_BACKTESTING_Y_AUDITORIA.md`](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md) |

---

## 3. Índice General de Preguntas (Catálogo Completo de 1 a 100)

### 📌 Pilar 1: Entorno, Plataformas & Datos Históricos (Q-001 a Q-025)
- [**Q-001**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-001): Ubicación de la Carpeta de Datos de MT5 en Windows y Mac (Wine).
- [**Q-002**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-002): Por qué un robot recién copiado a `MQL5\Experts` no aparece en el Navegador de MT5 y cómo refrescarlo (`Ctrl+N`).
- [**Q-003**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-003): Diferencia fundamental entre un archivo `.mq5` (código fuente) y `.ex5` (binario ejecutable).
- [**Q-004**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-004): Compilación de un Asesor Experto en MetaEditor con la tecla `F7`.
- [**Q-005**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-005): Diagnóstico y erradicación del error `10018: Market closed` en símbolos personalizados.
- [**Q-006**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-006): Cómo desbloquea `Script_Unlock_Custom_Symbols_Sessions.mq5` las sesiones 24/7 de negociación y cotización.
- [**Q-007**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-007): Por qué los brokers limitan el historial intradiario M1 y cómo limita la significancia estadística.
- [**Q-008**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-008): Inyección masiva de 20 años de datos M1 mediante `Script_Universal_Rates_Injector.mq5`.
- [**Q-009**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-009): Comparativa de modelos de simulación de MT5: *Ticks reales*, *Cada tick matemático* y *1 minuto OHLC*.
- [**Q-010**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-010): Justificación del modelo *1 minuto OHLC* para sistemas con lógica al cierre de vela.
- [**Q-011**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-011): Configuración completa del Strategy Tester (`Ctrl+R`) en MT5.
- [**Q-012**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-012): Impacto del spread simulado y calibración con comisiones institucionales.
- [**Q-013**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-013): Activación e inspección del Modo Visual para auditoría de ejecuciones paso a paso.
- [**Q-014**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-014): Creación manual de símbolos personalizados desde la ventana de Símbolos (`Ctrl+U`).
- [**Q-015**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-015): Integridad estructural y tipos de datos requeridos para la inyección CSV.
- [**Q-016**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-016): Diagnóstico y resolución de gráficos bloqueados en "Esperando actualización".
- [**Q-017**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-017): Comparativa arquitectónica entre TradingView (análisis visual ágil) y MT5 (backtesting tick institucional).
- [**Q-018**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-018): Ventajas computacionales y tipos definidos por usuario (UDT) en Pine Script v6.
- [**Q-019**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-019): Uso estricto de `barmerge.lookahead_off` en `request.security()`.
- [**Q-020**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-020): Procedimiento para compilar y montar scripts desde el Editor Pine de TradingView.
- [**Q-021**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-021): Exportación de transacciones CSV desde el Probador de Estrategias de TradingView.
- [**Q-022**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-022): Configuración de comisiones y margen al 5% (`margin_long = 5.0`) para futuros e índices.
- [**Q-023**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-023): Aislamiento de dependencias y reproducibilidad mediante entornos `.venv`.
- [**Q-024**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-024): Ecosistema Python requerido: `pandas`, `numpy`, `scipy`, `matplotlib`, `yfinance`.
- [**Q-025**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-025): Conexión directa y extracción programática con la librería oficial `MetaTrader5`.

---

### 📌 Pilar 2: Formulación de Hipótesis & Lógica Cuantitativa (Q-026 a Q-050)
- [**Q-026**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-026): Principio Human-in-the-Loop (HITL) y prohibición de programar sin validación de hipótesis.
- [**Q-027**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-027): Estándar horizontal de 3 Variantes (A, B, C) para evaluación en menos de 5 segundos.
- [**Q-028**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-028): Erradicación de código LaTeX para evitar sobrecarga cognitiva en decisiones rápidas.
- [**Q-029**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-029): Invarianza de escala mediante normalización por ATR Diario frente a pips fijos.
- [**Q-030**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-030): Erradicación del sesgo de anticipación (*lookahead bias*) con `shift = 1`.
- [**Q-031**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-031): Hipótesis causales basadas en microestructura vs minería de datos espuria.
- [**Q-032**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-032): Filosofía de Triple Pantalla de Elder y alineación con la masa monetaria institucional.
- [**Q-033**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-033): Definición matemática formal del Triple Barrier Method: Take Profit, Stop Loss y Time-Stop.
- [**Q-034**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-034): Decaimiento temporal de la ventaja estadística (*Toby Crabel*).
- [**Q-035**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-035): Z-Score MTF Diario para detección de anomalías de volatilidad según López de Prado.
- [**Q-036**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-036): Convexidad positiva: tolerar bajas tasas de acierto con ganancias asimétricas.
- [**Q-037**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-037): Rol del operador humano en la fijación del perfil de riesgo institucional.
- [**Q-038**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-038): Trazabilidad e inmutabilidad con el Strategy UUID institucional.
- [**Q-039**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-039): Principio de Pureza de Investigación: aislar la ventaja antes de aplicar fricción.
- [**Q-040**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-040): Aplicación del criterio de falsabilidad popperiano al backtesting financiero.
- [**Q-041**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-041): Impacto de las empresas deslistadas o quebradas en la simulación cuantitativa.
- [**Q-042**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-042): Adaptación continua a las fases de expansión y contracción de mercado.
- [**Q-043**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-043): El plano bidimensional de rentabilidad: umbral de break-even.
- [**Q-044**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-044): Hipótesis del Mercado Adaptativo de Andrew Lo y regímenes de mercado.
- [**Q-045**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-045): Estabilidad del ATR Diario frente al ruido y estacionalidad intradiaria.
- [**Q-046**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-046): Concentración de liquidez y volumen institucional en ventanas horarias fijas.
- [**Q-047**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-047): Ventajas de la convexidad positiva frente a los riesgos de cola de la reversión.
- [**Q-048**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-048): Teorema del Límite Central y significancia estadística ($N \ge 100$ trades).
- [**Q-049**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-049): Transparencia y reproducibilidad matemática: prohibición de cajas negras.
- [**Q-050**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-050): Síntesis ejecutiva de la ventaja estadística en una sola línea clara.

---

### 📌 Pilar 3: Código, Compilación & Paridad Multiplataforma (Q-051 a Q-075)
- [**Q-051**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-051): Filosofía *Contract-First* y contrato JSON `StrategySpecification`.
- [**Q-052**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-052): Organización modular institucional en 7 bloques funcionales.
- [**Q-053**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-053): Paridad cruzada multiplataforma e invarianza de ejecución.
- [**Q-054**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-054): Encapsulamiento seguro de transacciones con la clase POO `CTrade`.
- [**Q-055**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-055): Control de apertura de barra mediante `IsNewBar()` para evitar sobreoperar intra-vela.
- [**Q-056**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-056): Guarda de seguridad `InPenableTrading = false` para prevenir ejecuciones accidentales.
- [**Q-057**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-057): Manejo del handle `iATR` en D1 y lectura con `CopyBuffer()` con `shift = 1`.
- [**Q-058**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-058): Cálculo determinista de barreras SL/TP a partir del precio de entrada y del ATR Diario.
- [**Q-059**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-059): Aislamiento y gestión de posiciones con `InpMagicNumber`.
- [**Q-060**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-060): Diagnóstico y resolución de advertencias y errores comunes en MetaEditor.
- [**Q-061**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-061): Reemplazo de funciones inexistentes por `ta.percentile_nearest_rank(source, length, 50)`.
- [**Q-062**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-062): Tipos de inputs, agrupamiento y metadatos limpios en Bloque 1 de Pine Script.
- [**Q-063**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-063): Trazado dinámico de niveles de SL, TP y Z-Score con buffers visuales basados en ATR.
- [**Q-064**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-064): Espaciado anti-solapamiento de textos y flechas en el gráfico.
- [**Q-065**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-065): Tolerancia cero a advertencias del compilador para evitar fallos de memoria en vivo.
- [**Q-066**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-066): Liberación de handles con `IndicatorRelease()` y borrado de objetos gráficos.
- [**Q-067**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-067): Conteo de barras intradiarias transcurridas y emisión de orden de cierre forzado.
- [**Q-068**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-068): Gestión dinámica de `ORDER_FILLING_FOK`, `IOC` y `RETURN` según el broker.
- [**Q-069**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-069): Función de guarda `PositionsTotal()` y filtrado por símbolo y Magic Number.
- [**Q-070**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-070): Estructuración modular de datos con `type` en Pine Script v6.
- [**Q-071**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-071): Cálculo del tamaño de posición a partir de la distancia monetaria al Stop Loss.
- [**Q-072**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-072): Validación de barras mínimas requeridas antes de ejecutar cálculos de indicadores.
- [**Q-073**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-073): Registro de eventos en el log de MT5 con información concisa y sin saturación.
- [**Q-074**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-074): Paleta de colores institucional para trazado sobrio y profesional.
- [**Q-075**](docs_educativos/PILAR_3_CODIGO_Y_PARIDAD.md#q-075): Flujo de trabajo para copiar, compilar y refrescar el EA sin reiniciar el terminal.

---

### 📌 Pilar 4: Backtesting, Optimización & Auditoría Cuantitativa (Q-076 a Q-100)
- [**Q-076**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-076): Los peligros del *curve-fitting* y la inflación del error Tipo I según Aronson y López de Prado.
- [**Q-077**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-077): Distorsión monetaria en USD frente a la ventaja estadística del retorno porcentual puro.
- [**Q-078**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-078): Cálculo matemático de retornos simples acumulados $\sum R_i$ y compuestos $\prod(1+R_i)-1$.
- [**Q-079**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-079): Optimización con la función de evento personalizada `OnTester()` en Bloque 7.
- [**Q-080**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-080): Configuración del *Custom Criterion* en el Strategy Tester de MT5.
- [**Q-081**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-081): Por qué sistemas con Win Rate del 35%-40% son matemáticamente más robustos que los del 90%.
- [**Q-082**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-082): Interacción entre el Ratio Payoff y la Tasa de Acierto para generar Profit Factor positivo.
- [**Q-083**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-083): Ecuación canónica de la Esperanza Matemática ($E$) por trade en porcentaje de precio.
- [**Q-084**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-084): Desglose direccional mandatorio Compras vs Ventas (Módulo 2 QRT).
- [**Q-085**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-085): Diagnóstico de asimetrías y efecto apalancamiento en la volatilidad.
- [**Q-086**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-086): Consistencia Temporal Mensual y umbral mínimo institucional del 55% de meses positivos.
- [**Q-087**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-087): Máxima Excursión Adversa (MAE) según John Sweeney para calibración de paradas.
- [**Q-088**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-088): Anclaje formal del Stop Loss en el percentil 90 del MAE de las operaciones ganadoras.
- [**Q-089**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-089): Máxima Excursión Favorable (MFE) para determinación de objetivos de beneficio alcanzables.
- [**Q-090**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-090): Concentración en la masa modal o mediana de MFE frente a la cola del 99%.
- [**Q-091**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-091): Tiempo de Permanencia y calibración empírica del límite de barras intradiarias.
- [**Q-092**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-092): Mecanismo de parada automática (*Circuit Breaker*) tras 3 pérdidas consecutivas en el mes.
- [**Q-093**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-093): Prohibición estricta de selección por picos aislados (*"Anti-Spikes Manifesto"*).
- [**Q-094**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-094): Concepto topológico y matemático de la Meseta de Robustez (*Robert Pardo & Perry Kaufman*).
- [**Q-095**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-095): Cálculo del Baricentro geométrico de la meseta continua de estabilidad ($S \ge 0.80 \times S_{\max}$).
- [**Q-096**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-096): Validación temporal cruzada In-Sample vs Out-of-Sample con ventana ciega del 20%.
- [**Q-097**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-097): El Semáforo de Degradación Paramétrica de López de Prado (Zona Verde $\le 30\%$).
- [**Q-098**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-098): Los 4 criterios formales para declarar nula una optimización.
- [**Q-099**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-099): Blindaje dinámico mediante Breakeven Elástico gatillado a $1.0x$ ATR Diario.
- [**Q-100**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-100): Integración del Pool Completo de 3 Módulos en el flujo diario de investigación del trader sistemático.

---

## 4. Guía Rápida de Consulta para el Alumno

Si estás experimentando una dificultad o duda específica en tu terminal o al dialogar con la IA, consulta de inmediato los siguientes bloques recomendados:

1. **"Copié el bot a MT5 pero no aparece en la lista de asesores expertos":**  
   $\rightarrow$ Consulta [**Q-002**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-002) y [**Q-004**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-004).
2. **"Al hacer backtest me sale el error 10018: Market closed":**  
   $\rightarrow$ Consulta [**Q-005**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-005) y [**Q-006**](docs_educativos/PILAR_1_ENTORNO_Y_DATOS.md#q-006).
3. **"La IA me da código de inmediato sin darme a elegir opciones":**  
   $\rightarrow$ Consulta [**Q-026**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-026) y [**Q-027**](docs_educativos/PILAR_2_HIPOTESIS_Y_LOGICA.md#q-027). (Asegúrate de haber instalado el archivo `AGENTS.md` o el `.cursorrules` del Pack v2.0).
4. **"¿Por qué mi bot gana en compras pero pierde todo en ventas?":**  
   $\rightarrow$ Consulta [**Q-084**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-084) y [**Q-085**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-085).
5. **"¿Cómo elijo el mejor Stop Loss y Take Profit sin sobreajustar?":**  
   $\rightarrow$ Consulta [**Q-087**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-087) a [**Q-090**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-090) (Análisis MAE/MFE) y [**Q-094**](docs_educativos/PILAR_4_BACKTESTING_Y_AUDITORIA.md#q-094) (Mesetas de Robustez).

---
