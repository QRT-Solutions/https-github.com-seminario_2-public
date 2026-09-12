# Pilar 3: Código, Compilación, Paridad MQL5 / Pine Script & Despliegue

> **Autor Institucional:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Guía Maestra de Formación Cuantitativa  
> **Módulo:** Preguntas 51 a 75 — Estándar de 7 Bloques, Arquitectura POO y Cero Repainting

---

<a id="q-051"></a>

### [Q-051] ¿Qué es el contrato JSON `StrategySpecification` y por qué la IA lo genera antes de escribir el código fuente?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El desarrollo de software cuantitativo institucional sigue el principio *Contract-First*. Un contrato JSON formal define la única fuente de verdad (*Single Source of Truth*), garantizando que las reglas de entrada, salida, filtros y cálculo de volatilidad queden selladas matemáticamente antes de escribir el código de las plataformas. |
| **2. Evidencia & Fuente Canónica** | *OpenAPI & JSON Schema Consortium: Contract-First Software Engineering Standards*; *QRT Swarm Architecture Documentation (`quant_agentic_swarm/docs/ARCHITECTURE.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Validación formal contra esquema: $\text{Validate}(\text{Spec}, \text{Schema}) == \text{True}$. Si el contrato no cumple el esquema formal, el pipeline de compilación se interrumpe. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. La IA redacta el archivo `STRAT-..._specification.json`.<br>2. Se declaran las hipótesis, las 3 barreras de salida y el régimen de volatilidad.<br>3. Los desarrolladores de Pine Script y MQL5 leen este archivo para codificar sin interpretaciones subjetivas. |
| **5. Criterio de Falsabilidad / Validación** | El script `validate_registry.py` verifica la validez sintáctica del archivo JSON y confirma que todos los parámetros numéricos existen en el código fuente. |

---

<a id="q-052"></a>

### [Q-052] ¿Qué es el estándar de 7 bloques de arquitectura que deben cumplir los scripts de Pine Script y MQL5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El código espagueti desestructurado es la principal causa de fallos en producción. El estándar institucional de 7 bloques organiza el flujo del bot en compartimentos estancos secuenciales, facilitando la auditoría, depuración y mantenimiento a largo plazo. |
| **2. Evidencia & Fuente Canónica** | *Robert C. Martin — Clean Code: A Handbook of Agile Software Craftsmanship*; *QRT Code Skeleton Standard (`quant_agentic_swarm/docs/CODE_SKELETON_STANDARD.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Flujo determinista: $\text{Bloque 1 (Cabecera/Inputs)} \rightarrow \text{Bloque 2 (Métricas/Volatilidad)} \rightarrow \text{Bloque 3 (Filtro Macro)} \rightarrow \text{Bloque 4 (Señal)} \rightarrow \text{Bloque 5 (Gestión de Posición)} \rightarrow \text{Bloque 6 (HUD/Visualización)} \rightarrow \text{Bloque 7 (OnTester/Telemetría)}$. |
| **4. Protocolo Operativo (Paso a Paso)** | Todo script generado en el repositorio sigue esta estructura de comentarios numerados:  
`// === BLOQUE 1: PARÁMETROS E INPUTS ===`  
`// === BLOQUE 2: NORMALIZACIÓN DE VOLATILIDAD (ATR D1) ===`  
hasta el Bloque 7. |
| **5. Criterio de Falsabilidad / Validación** | Cualquier programador puede abrir el archivo `.mq5` o `.pine` y localizar cualquier lógica en menos de 3 segundos guiándose por la numeración de bloques. |

---

<a id="q-053"></a>

### [Q-053] ¿Cómo garantiza el sistema que la versión de TradingView (Pine Script v6) y la versión de MT5 (MQL5) hagan exactamente lo mismo?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | La paridad cruzada multiplataforma se logra sincronizando la base de datos de parámetros desde el contrato JSON y homologando las funciones matemáticas: ambas leen los precios al cierre de vela (`shift = 1`), calculan el ATR Diario con el método clásico de Wilder y aplican idénticas barreras de salida en múltiplos de volatilidad. |
| **2. Evidencia & Fuente Canónica** | *IEEE Software Engineering Standards: Cross-Platform Algorithmic Parity*; *QRT Swarm QA Protocol*. |
| **3. Rigor Matemático / Algorítmico** | Invarianza algorítmica: $\forall t, \text{Signal}_{\text{Pine}}(t) \equiv \text{Signal}_{\text{MQL5}}(t)$ y $|\text{SL}_{\text{Pine}} - \text{SL}_{\text{MQL5}}| < \epsilon$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Ambos códigos comparten el mismo `Strategy UUID`.<br>2. Se comparan las fechas y precios de entrada y salida de las primeras 20 operaciones en ambas plataformas para certificar paridad. |
| **5. Criterio de Falsabilidad / Validación** | La desviación entre el número de operaciones generadas en Pine Script y en MQL5 sobre el mismo conjunto de datos es del $0\%$ en barras confirmadas. |

---

<a id="q-054"></a>

### [Q-054] ¿Por qué en MQL5 se utiliza la librería estándar orientada a objetos `#include <Trade\Trade.mqh>` en lugar de funciones nativas antiguas?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Las funciones nativas de bajo nivel (`OrderSend` directo) requieren estructurar manualmente structs complejas (`MqlTradeRequest`, `MqlTradeResult`), comprobar decenas de códigos de error y manejar la memoria. La clase `CTrade` de la librería estándar encapsula estas operaciones, verifica automáticamente las políticas de llenado (*filling modes*) del broker y previene bloqueos por órdenes mal formateadas. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Software Corp. — MQL5 Standard Library: CTrade Class Reference (2024)*. |
| **3. Rigor Matemático / Algorítmico** | Patrón de diseño Facade: `CTrade::Buy()` y `CTrade::Sell()` gestionan la máquina de estados de la transacción reduciendo la probabilidad de error humano de $\mathcal{O}(N)$ a $\mathcal{O}(1)$. |
| **4. Protocolo Operativo (Paso a Paso)** | Al inicio de todo Asesor Experto se incluye:  
`#include <Trade\Trade.mqh>`  
`CTrade trade;`  
y se envían las órdenes mediante métodos limpios: `trade.Buy(...)` o `trade.Sell(...)`. |
| **5. Criterio de Falsabilidad / Validación** | El compilador no arroja advertencias de tipos de ejecución incompatibles y la orden se despacha con la política de relleno adecuada para cada broker. |

---

<a id="q-055"></a>

### [Q-055] ¿Qué función cumple `IsNewBar()` en el evento `OnTick()` de MQL5 y qué pasaría si no se incluye?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El evento `OnTick()` se dispara cada vez que llega una nueva cotización al terminal (pudiendo ocurrir cientos de veces por segundo en alta volatilidad). La función `IsNewBar()` compara el timestamp de la barra actual con el de la anterior; si no es una barra nueva, detiene la ejecución. Sin ella, el bot evaluaría la estrategia en cada tick, pudiendo abrir decenas de órdenes por error en una misma vela. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes MQL5 Algorithmic Development: Event Handling & Bar-Synchronization Patterns*. |
| **3. Rigor Matemático / Algorítmico** | Filtro temporal discreto:  
`datetime current = iTime(_Symbol, _Period, 0);`  
`if(current == last_time) return false; last_time = current; return true;` |
| **4. Protocolo Operativo (Paso a Paso)** | En la primera línea de `OnTick()`, se coloca siempre la guarda de ejecución:  
`if(!IsNewBar()) return;` |
| **5. Criterio de Falsabilidad / Validación** | El bot realiza exactamente una comprobación de señales al inicio de cada barra y su registro en el log de MT5 permanece completamente limpio de spam de ticks. |

---

<a id="q-056"></a>

### [Q-056] ¿Por qué el Asesor Experto incluye por defecto `input bool InPenableTrading = false;`?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Es un mecanismo de seguridad contra accidentes (*Fail-Safe Switch*). Si un alumno o trader compila un EA y por error lo arrastra a un gráfico conectado a una cuenta real con fondos, el bot jamás abrirá operaciones con dinero real a menos que el usuario active conscientemente el parámetro. |
| **2. Evidencia & Fuente Canónica** | *NIST Cybersecurity Framework: Fail-Safe Defaults Standard (SP 800-53)*; *QRT Risk Management Architecture*. |
| **3. Rigor Matemático / Algorítmico** | Guarda de seguridad lógica:  
`if(!MQLInfoInteger(MQL_TESTER) && !InPenableTrading) { return; }` |
| **4. Protocolo Operativo (Paso a Paso)** | - En el **Strategy Tester**: opera automáticamente sin tocar nada.<br>- En **gráficos en vivo**: si deseas operar, debes abrir los Inputs del bot y cambiar `InPenableTrading` a `true`. |
| **5. Criterio de Falsabilidad / Validación** | Al colocar el bot en un gráfico en vivo con el parámetro en `false`, la pestaña *Expertos* imprime: `[SEGURIDAD] Trading desactivado por defecto para cuentas reales.` y no arriesga capital. |

---

<a id="q-057"></a>

### [Q-057] Si arrastro el bot a un gráfico real de MT5 con `InPenableTrading = false`, ¿por qué me muestra una alerta y no abre operaciones?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Para evitar confusiones, el bot emite una alerta pedagógica inmediata explicando que se encuentra en modo protegido de solo lectura, impidiendo que el alumno piense que el código está roto o que el compilador falló. |
| **2. Evidencia & Fuente Canónica** | *ISO 9241-110: Ergonomics of Human-System Interaction — Principles of Feedback and Error Prevention*. |
| **3. Rigor Matemático / Algorítmico** | Detección de entorno: `MQLInfoInteger(MQL_TESTER) == 0` activa la notificación informativa. |
| **4. Protocolo Operativo (Paso a Paso)** | Lee el mensaje en pantalla. Si estás seguro de querer operar con dinero real o demo, presiona `F7` sobre el gráfico, ve a la pestaña *Parámetros de entrada* (*Inputs*), cambia `InPenableTrading` a `true` y pulsa Aceptar. |
| **5. Criterio de Falsabilidad / Validación** | La alerta desaparece y el icono del Asesor Experto en la esquina superior derecha del gráfico sonríe indicando que el trading automatizado está activo. |

---

<a id="q-058"></a>

### [Q-058] ¿Cómo activo el trading real de forma segura una vez que terminé la fase de auditoría y validación?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El paso a producción real requiere una lista de verificación de tres pasos: habilitar permisos en la plataforma MT5, verificar la conexión del servidor y activar el switch de seguridad del propio Asesor Experto. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Client Terminal Help: Algorithmic Trading Enabling and Security Confirmation*. |
| **3. Rigor Matemático / Algorítmico** | Conjunción de permisos: $\text{CanTrade} = \text{TerminalAutoTrading} \land \text{ExpertAllowAlgo} \land \text{InPenableTrading} == \text{True}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En la barra de herramientas superior de MT5, pulsa el botón **Algo Trading** (debe quedar en verde).<br>2. Al arrastrar el EA al gráfico, en la pestaña *Común* marca la casilla **"Permitir el trading algorítmico"**.<br>3. En la pestaña *Parámetros*, establece `InPenableTrading = true`. |
| **5. Criterio de Falsabilidad / Validación** | El icono del bot en la esquina superior derecha del gráfico muestra un sombrero azul o cara alegre y no aparecen errores de permiso en el diario. |

---

<a id="q-059"></a>

### [Q-059] ¿Por qué en Pine Script v6 se debe usar siempre `lookahead = barmerge.lookahead_off` en las llamadas a `request.security()`?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Al consultar un marco temporal superior (ej. diario desde un gráfico intradiario de 5 minutos), si no se deshabilita el lookahead, TradingView devuelve el precio de cierre de todo el día antes de que el día haya terminado, permitiendo al bot "conocer el futuro" en el backtest. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script Reference: request.security() Lookahead Parameter Rules & Anti-Repainting*. |
| **3. Rigor Matemático / Algorítmico** | Restricción temporal: $\text{Time}(D1) \le \text{Time}(M5_{\text{open}})$. Con `lookahead_off`, solo se devuelven los datos de la vela diaria completada ayer ($D1_{t-1}$). |
| **4. Protocolo Operativo (Paso a Paso)** | Cada llamada de marco temporal superior se escribe de esta forma canónica:  
`daily_atr = request.security(syminfo.tickerid, "D", ta.atr(14)[1], lookahead = barmerge.lookahead_off)` |
| **5. Criterio de Falsabilidad / Validación** | Los resultados del backtest en TradingView no sufren degradación de rendimiento cuando se replican exactamente en MetaTrader 5 barra a barra. |

---

<a id="q-060"></a>

### [Q-060] ¿Qué significa el error de Pine Script "The study references too many bars back" y cómo se previene con la guarda de calentamiento?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El motor de ejecución de TradingView asigna un búfer circular de memoria dinámico. Si un indicador recursivo o una condición retrocede más barras en el pasado que el tamaño del búfer asignado en las primeras barras del gráfico, el compilador aborta la ejecución para prevenir desbordamiento de memoria. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script User Manual: Historical Buffer Allocation and Warm-up Bars*. |
| **3. Rigor Matemático / Algorítmico** | Guarda de calentamiento: $\text{TradeAllowed} = \mathbb{I}(\text{bar\_index} \ge N_{\text{warmup}})$, donde $N_{\text{warmup}} \ge \max(\text{Periodos Indicator})$. |
| **4. Protocolo Operativo (Paso a Paso)** | Al inicio de la lógica de decisión en Pine Script v6, se coloca la guarda:  
`if bar_index < 200`  
`    return` |
| **5. Criterio de Falsabilidad / Validación** | El script compila y corre de forma fluida sobre gráficos de miles de barras sin arrojar errores de referencia histórica fuera de búfer. |

---

<a id="q-061"></a>

### [Q-061] ¿Por qué usamos `ta.percentile_nearest_rank(source, length, 50)` en Pine Script en lugar de una función inexistente como `ta.median()`?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En versiones modernas de Pine Script (v5 y v6), la biblioteca estándar `ta` no incluye una función nativa llamada `ta.median()`. El cálculo matemáticamente riguroso de la mediana sobre una ventana rodante se define como el percentil 50 de la distribución empírica. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script v6 Standard Library: Math and Technical Analysis Namespaces*. |
| **3. Rigor Matemático / Algorítmico** | Definición estadística: $\text{Mediana}(X) = P_{50}(X) = \text{ta.percentile\_nearest\_rank}(X, N, 50)$. |
| **4. Protocolo Operativo (Paso a Paso)** | Si deseas calcular la mediana del ATR o del volumen rodante en Pine Script, escribe:  
`median_atr = ta.percentile_nearest_rank(atr_source, 20, 50)`. |
| **5. Criterio de Falsabilidad / Validación** | El compilador de Pine Script v6 acepta la expresión sin emitir el error `Undeclared identifier 'ta.median'`. |

---

<a id="q-062"></a>

### [Q-062] ¿Qué es el HUD (Heads-Up Display) visual que dibuja la estrategia en el gráfico de TradingView o MT5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El HUD es una tabla visual en la esquina del gráfico que proyecta en tiempo real los metadatos de telemetría operativa del algoritmo (Strategy UUID, régimen de volatilidad, ATR diario actual, estado del filtro macro y niveles de SL/TP), facilitando la supervisión humana sin necesidad de abrir menús. |
| **2. Evidencia & Fuente Canónica** | *Human-Computer Interaction (HCI) in Financial Market Monitoring: Real-time Telemetry Dashboards*. |
| **3. Rigor Matemático / Algorítmico** | Tabla gráfica anclada a coordenadas relativas del viewport: `table.new(position.top_right, ...)`. |
| **4. Protocolo Operativo (Paso a Paso)** | Tanto en Pine Script como en MQL5, el Bloque 6 del código contiene la función de dibujo del HUD que actualiza las celdas de texto en cada cierre de barra. |
| **5. Criterio de Falsabilidad / Validación** | Al cargar la estrategia en el gráfico, aparece una caja elegante con diseño institucional sobrio que muestra los datos cuantitativos del activo en tiempo real. |

---

<a id="q-063"></a>

### [Q-063] Si modifico un parámetro en los Inputs de MT5, ¿por qué los niveles de SL y TP cambian dinámicamente según el ATR Diario?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Porque el código del bot no contiene precios rígidos. Los inputs son factores multiplicadores de escala ($k_1, k_2$). En cada trade, el algoritmo evalúa el ATR Diario cerrado y recalcula los precios absolutos de salida en el momento exacto de la ejecución. |
| **2. Evidencia & Fuente Canónica** | *Perry J. Kaufman — Trading Systems and Methods (Cap. 14: Dynamic Parameter Multipliers)*. |
| **3. Rigor Matemático / Algorítmico** | $P_{\text{SL}} = P_{\text{entry}} \mp (\text{InpStopFactor} \times \text{ATR}_D)$. Si cambias `InpStopFactor` de `0.75` a `1.00`, la distancia se amplía proporcionalmente. |
| **4. Protocolo Operativo (Paso a Paso)** | Modifica los parámetros en la ventana de Inputs; el bot ajustará automáticamente la distancia en dólares o pips sin requerir re-programación. |
| **5. Criterio de Falsabilidad / Validación** | Al auditar las órdenes ejecutadas, la distancia entre el precio de apertura y el Stop Loss coincide exactamente con el valor del ATR Diario de ese día multiplicado por el factor. |

---

<a id="q-064"></a>

### [Q-064] ¿Cómo maneja el código de MQL5 el cálculo del ATR Diario si la estrategia se está ejecutando en un gráfico de 5 minutos (M5)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | MQL5 permite solicitar indicadores técnicos sobre cualquier símbolo y cualquier marco temporal independientemente de la periodicidad del gráfico activo, creando un handle específico vinculado al timeframe `PERIOD_D1`. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes MQL5 Reference: iATR() Multi-Timeframe Indicator Handle Creation*. |
| **3. Rigor Matemático / Algorítmico** | Handle específico: `handle_atr_d1 = iATR(_Symbol, PERIOD_D1, 14);` seguido de `CopyBuffer(handle_atr_d1, 0, 1, 1, buffer)`. |
| **4. Protocolo Operativo (Paso a Paso)** | El bot inicializa el handle en `OnInit()`. En cada nueva vela de M5, consulta el búfer del handle diario en el índice 1 (día cerrado ayer). |
| **5. Criterio de Falsabilidad / Validación** | El valor de ATR devuelto es idéntico al que se observa al abrir un gráfico diario del mismo activo con un indicador ATR(14). |

---

<a id="q-065"></a>

### [Q-065] ¿Qué ocurre si la terminal de MT5 no tiene suficiente historial diario (D1) descargado para calcular el ATR de 14 días?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Si la base de datos local de MT5 carece de barras diarias suficientes, la función `CopyBuffer()` falla y devuelve un código de error de datos no sincronizados (`ERR_HISTORY_NOT_FOUND`). Sin una guarda defensiva, el bot intentaría operar con un valor de ATR igual a 0, calculando Stops erróneos. |
| **2. Evidencia & Fuente Canónica** | *MQL5 Defensive Programming: Indicator Synchronization and Error 4806 (ERR_INDICATOR_DATA_NOT_FOUND)*. |
| **3. Rigor Matemático / Algorítmico** | Guarda defensiva: `if(atr_value <= 0.0) { Print("[ALERTA] Historial D1 insuficiente"); return; }`. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre el gráfico en temporalidad Diaria (D1).<br>2. Presiona `Inicio` (*Home*) varias veces para forzar la descarga de barras diarias del servidor.<br>3. El bot se sincronizará automáticamente en la siguiente vela. |
| **5. Criterio de Falsabilidad / Validación** | El Asesor Experto lee un valor de ATR estrictamente positivo ($> 0$) y despacha las órdenes con sus barreras de protección intactas. |

---

<a id="q-066"></a>

### [Q-066] ¿Por qué el código MQL5 utiliza un `magic number` único para identificar las operaciones de cada estrategia?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El Magic Number es una etiqueta numérica de metadatos asociada a cada orden y posición en el servidor de MT5. Permite que el Asesor Experto reconozca y gestione exclusivamente sus propias operaciones, sin interferir con operaciones manuales del trader ni con otros robots que operen en la misma cuenta. |
| **2. Evidencia & Fuente Canónica** | *MQL5 Trading Architecture: Position Identification & Magic Numbers Standards*. |
| **3. Rigor Matemático / Algorítmico** | Función discriminadora: $\text{ManagePosition}(P) \iff \text{PositionGetInteger}(\text{POSITION\_MAGIC}) == \text{InpMagicNumber}$. |
| **4. Protocolo Operativo (Paso a Paso)** | Todo bot de QRT define:  
`input ulong InpMagicNumber = 2026090901;`  
y se asigna a la clase CTrade: `trade.SetExpertMagicNumber(InpMagicNumber);`. |
| **5. Criterio de Falsabilidad / Validación** | Si abres manualmente una operación en el mismo activo desde el móvil o gráfico, el bot la ignora por completo y no modifica su Stop Loss. |

---

<a id="q-067"></a>

### [Q-067] Si tengo dos bots diferentes operando en la misma cuenta de MT5, ¿pueden interferir entre sí si no configuro números mágicos distintos?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Sí. Si dos Asesores Expertos comparten el mismo Magic Number, el Bot A podría interpretar que la posición abierta por el Bot B le pertenece, y cerrarla prematuramente o alterar su Stop Loss, generando colisiones operativas y pérdidas de capital. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Multi-EA Portfolio Operations: Collision Avoidance through Unique Magic Key Identifiers*. |
| **3. Rigor Matemático / Algorítmico** | Condición de aislamiento: $\text{Magic}(\text{Bot}_A) \cap \text{Magic}(\text{Bot}_B) = \emptyset$. |
| **4. Protocolo Operativo (Paso a Paso)** | Asigna siempre un número mágico diferente a cada bot (por ejemplo, codificando la fecha y la estrategia: `260901` para el bot 1 y `260902` para el bot 2). |
| **5. Criterio de Falsabilidad / Validación** | Ambos bots corren en paralelo en la misma cuenta gestionando cada uno su propio trailing stop de forma independiente sin interferencias. |

---

<a id="q-068"></a>

### [Q-068] ¿Cómo gestiona el código el tamaño de lote: es fijo (ej. 0.01 / 0.10) o se calcula en función del porcentaje de riesgo de la cuenta?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Durante la fase inicial de backtesting e investigación de hipótesis, se utiliza lotaje fijo para evaluar la ventaja estadística pura sin distorsión de interés compuesto. Para la operativa en vivo, el código incluye un selector paramétrico para alternar entre lote fijo y dimensionamiento por riesgo porcentual de capital (*Fixed Fractional*). |
| **2. Evidencia & Fuente Canónica** | *Ralph Vince — Portfolio Management Formulas: Mathematical Models for Position Sizing*; *Mark Minervini (Risk Percentage Standard)*. |
| **3. Rigor Matemático / Algorítmico** | Dimensionamiento por riesgo: $\text{Lots} = \frac{\text{Equity} \times \text{RiskPct}}{\text{DistanceStop} \times \text{TickValue} / \text{TickSize}}$. |
| **4. Protocolo Operativo (Paso a Paso)** | En los inputs del EA:  
- Si deseas evaluar pureza matemática: usa `InpLotSize = 0.01` (lote fijo).  
- Si deseas interés compuesto: activa `InpDynamicLot = true` y fija `InpRiskPercent = 1.0` (arriesgar el 1% por trade). |
| **5. Criterio de Falsabilidad / Validación** | Si la cuenta crece, el tamaño de lote aumenta proporcionalmente; si la cuenta sufre una racha de pérdidas, el tamaño de lote se reduce automáticamente para proteger el capital. |

---

<a id="q-069"></a>

### [Q-069] ¿Por qué en la ficha técnica inicial a veces aparece "Compilación nativa: No verificada"?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El sistema de gobernanza de QRT distingue estrictamente entre la verificación de validez léxica y contractual (que hace la IA en modo diseño) y la verificación de compilación binaria nativa (que requiere invocar el compilador oficial de MetaQuotes `metaeditor64.exe`). Declarar *"No verificada"* es un acto de honestidad y rigor científico. |
| **2. Evidencia & Fuente Canónica** | *QRT Governance Standard: Continuous Verification & Traceability Guidelines*. |
| **3. Rigor Matemático / Algorítmico** | Estado de auditoría: $\text{Status}(\text{Compiler}) \in \{\text{Verified}, \text{Unverified}\}$. Solo cambia a *Verified* tras retorno `exit code 0` del compilador de MetaQuotes. |
| **4. Protocolo Operativo (Paso a Paso)** | Al abrir el archivo `.mq5` en MetaEditor y pulsar `F7`, se comprueba el código. Si no hay errores, el ejecutable `.ex5` queda generado y listo para operar. |
| **5. Criterio de Falsabilidad / Validación** | El código fuente compila limpiamente a la primera ejecución en MetaEditor con `0 errors, 0 warnings`. |

---

<a id="q-070"></a>

### [Q-070] ¿Cómo compilo el código fuente `.mq5` desde la línea de comandos o terminal sin abrir MetaEditor si uso Mac o Linux?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | MetaEditor 64 admite modificadores de línea de comandos en modo headless. En macOS o Linux, se invoca el binario de MetaEditor a través de Wine pasando los flags `/compile` y `/log`, permitiendo la automatización de builds en scripts sin intervención de la interfaz gráfica. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes MetaEditor Command Line Arguments Reference: Headless Batch Compilation*. |
| **3. Rigor Matemático / Algorítmico** | Comando de ejecución:  
`wine metaeditor64.exe /compile:"ruta/archivo.mq5" /log:"ruta/build.log"` |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre tu terminal de macOS/Linux.<br>2. Ejecuta el comando de compilación apuntando al ejecutable de MetaEditor en el sandbox de Wine.<br>3. Lee el archivo `build.log` para confirmar `0 errors, 0 warnings`. |
| **5. Criterio de Falsabilidad / Validación** | Aparece el archivo `.ex5` en la misma carpeta del `.mq5` con timestamp actualizado. |

---

<a id="q-071"></a>

### [Q-071] Si MetaEditor me muestra advertencias (*warnings*) pero 0 errores, ¿es seguro utilizar el archivo `.ex5` resultante?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El compilador genera el binario `.ex5` si no hay errores fatales de sintaxis. Sin embargo, en desarrollo cuantitativo institucional rige la regla de **tolerancia cero a las advertencias** (*Zero-Warnings Policy*): una advertencia común (como pérdida de precisión en conversión de tipo o variable declarada y no usada) suele ser el síntoma de un bug silencioso en tiempo de ejecución. |
| **2. Evidencia & Fuente Canónica** | *MISRA C/C++ Coding Standards for High-Reliability Software: Strict Zero-Warning Compilation*; *QRT Code Quality Rule 3.3*. |
| **3. Rigor Matemático / Algorítmico** | Compilación válida institucional: $\text{BuildStatus} \iff (\text{Errors} == 0) \land (\text{Warnings} == 0)$. |
| **4. Protocolo Operativo (Paso a Paso)** | Todos los EAs entregados en el repositorio de QRT han sido depurados para compilar estrictamente con `0 errors, 0 warnings`. Si ves una advertencia tras editar el código, corrígela antes de hacer backtesting. |
| **5. Criterio de Falsabilidad / Validación** | La consola de MetaEditor imprime en verde: `Result: 0 errors, 0 warnings`. |

---

<a id="q-072"></a>

### [Q-072] ¿Qué significa el error de MQL5 *"Array out of range"* y en qué parte del código de indicadores suele producirse?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Este error crítico de memoria ocurre cuando el programa intenta acceder a un índice de array que es menor a 0 o mayor o igual al tamaño total asignado al array (`index >= ArraySize(arr)`). En código de trading, suele ocurrir cuando se leen buffers de indicadores antes de que el indicador haya calculado sus valores iniciales. |
| **2. Evidencia & Fuente Canónica** | *MQL5 Runtime Errors: Error 4002 (ERR_ARRAY_OUT_OF_RANGE)*. |
| **3. Rigor Matemático / Algorítmico** | Condición de violación: $\text{Access}(A[i]) \implies i \in [0, \text{Size}(A)-1]$. Si $i \notin \text{Domain} \implies \text{Crash}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Siempre verifica la cantidad de elementos copiados:  
`int copied = CopyBuffer(handle, 0, 1, 1, buffer);`  
`if(copied <= 0) return;`<br>2. Nunca accedas a `buffer[0]` sin validar previamente que `copied > 0`. |
| **5. Criterio de Falsabilidad / Validación** | El Asesor Experto corre semanas completas en la terminal sin detenerse ni imprimir alertas de *array out of range* en la pestaña de errores. |

---

<a id="q-073"></a>

### [Q-073] ¿Cómo implementa el código un Trailing Stop dinámico en MQL5 sin violar la distancia mínima de congelamiento (*freeze level*) o stop level del broker?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los brokers imponen una distancia mínima en puntos (`SYMBOL_TRADE_STOPS_LEVEL`) por debajo de la cual el servidor rechaza cualquier modificación de Stop Loss. El código cuantitativo de QRT consulta esta distancia y solo envía la modificación si el nuevo Stop propuesto se encuentra más allá de esa frontera, evitando rechazos continuos de órdenes. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Order Execution Guide: Stops Level and Freeze Level Constraints*. |
| **3. Rigor Matemático / Algorítmico** | Restricción de modificación: $|P_{\text{bid}} - P_{\text{newSL}}| \ge \text{StopsLevel} \times \text{Point}$. |
| **4. Protocolo Operativo (Paso a Paso)** | El método de trailing del bot calcula:  
`double min_dist = SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL) * _Point;`  
y solo ajusta el Stop si la distancia supera ese margen de seguridad del broker. |
| **5. Criterio de Falsabilidad / Validación** | El trailing stop acompaña al precio sin que el diario de MT5 muestre errores de modificación de orden rechazada (`retcode 10016: Invalid stops`). |

---

<a id="q-074"></a>

### [Q-074] ¿Cómo garantiza el código que una orden pendiente o de mercado no se envíe dos veces en la misma vela intradiaria?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En momentos de alta volatilidad y latencia de red, un algoritmo sin control de estado podría re-evaluar la condición antes de que el servidor confirme la ejecución de la primera orden, despachando órdenes duplicadas. QRT combina el control de vela cerrada `IsNewBar()` con un centinela de estado de posición activa. |
| **2. Evidencia & Fuente Canónica** | *Financial Information eXchange (FIX) Protocol: Duplicate Order Prevention & Idempotency Rules*. |
| **3. Rigor Matemático / Algorítmico** | Condición idempotente: $\text{ExecuteOrder} \iff \text{IsNewBar}() \land (\text{PositionsTotal}(\text{Magic}) == 0)$. |
| **4. Protocolo Operativo (Paso a Paso)** | Antes de disparar cualquier orden de compra o venta, el código verifica si ya existe una posición abierta con el Magic Number de la estrategia; si existe, aborta cualquier nuevo intento de entrada. |
| **5. Criterio de Falsabilidad / Validación** | La lista de operaciones del backtest muestra exactamente una sola apertura por señal sin duplicaciones accidentales de lotaje. |

---

<a id="q-075"></a>

### [Q-075] ¿En qué ubicación específica se almacenan los archivos de registro o logs de MT5 (`Experts` y `Journal`) para revisar si el bot arrojó algún error en ejecución?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los logs son la caja negra de la plataforma. MT5 separa los eventos del sistema general (conexión, cotizaciones, servidor) en los logs de *Journal*, y los eventos generados por código MQL5 (`Print`, alertas, errores de órdenes) en los logs de *Experts*, almacenándolos en archivos `.log` indexados por fecha. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Client Terminal Help: Logs Structure and Forensic Auditing*. |
| **3. Rigor Matemático / Algorítmico** | Rutas en disco:  
`%APPDATA%\...\MQL5\Logs\YYYYMMDD.log` (Logs de EAs y Scripts)  
`%APPDATA%\...\Logs\YYYYMMDD.log` (Logs generales de la terminal). |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En la parte inferior de MT5, haz clic en la pestaña **Diario** (*Journal*) o **Expertos** (*Experts*).<br>2. Haz clic derecho sobre cualquier línea de texto y selecciona **Abrir** (*Open*).<br>3. Se abrirá la carpeta de Windows con los archivos de texto completos de cada día. |
| **5. Criterio de Falsabilidad / Validación** | Puedes abrir el archivo de texto en cualquier editor para inspeccionar la traza de ejecución milisegundo a milisegundo ante cualquier anomalía. |
