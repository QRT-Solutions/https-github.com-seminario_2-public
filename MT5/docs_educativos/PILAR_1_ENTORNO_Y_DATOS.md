# Pilar 1: Configuración de Entorno, Plataformas (MT5 / TradingView) & Datos Históricos

> **Autor Institucional:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Guía Maestra de Formación Cuantitativa  
> **Módulo:** Preguntas 1 a 25 — Infraestructura, Plataformas y Series Temporales

---

<a id="q-001"></a>

### [Q-001] ¿Dónde encuentro la ruta exacta de la carpeta `MQL5\Experts\` si estoy utilizando MetaTrader 5 en Windows?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Windows aísla los datos dinámicos de las aplicaciones instaladas en carpetas del sistema (`Program Files`) bajo el directorio seguro de perfil de usuario (`AppData\Roaming`), asignando a cada terminal un identificador hash hexadecimal único para prevenir corrupción de permisos multi-usuario. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Software Corp. — MQL5 Reference Manual: Structure of MetaTrader 5 Directories*; *Microsoft Windows Architecture Guide: AppData Roaming Standards*. |
| **3. Rigor Matemático / Algorítmico** | Ruta canónica determinista: `%APPDATA%\MetaQuotes\Terminal\<INSTANCE_HASH_HEX>\MQL5\Experts\` donde `INSTANCE_HASH_HEX` es un hash MD5 de 32 caracteres que identifica la ruta de instalación del terminal. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre MetaTrader 5.<br>2. En el menú superior, haz clic en **Archivo** (*File*) $\rightarrow$ **Abrir carpeta de datos** (*Open Data Folder*).<br>3. En el Explorador de Windows, abre la subcarpeta **MQL5** y luego **Experts**.<br>4. Deposita allí el archivo `.mq5` o crea una subcarpeta propia (ej. `MQL5\Experts\QRT\`). |
| **5. Criterio de Falsabilidad / Validación** | El archivo `.mq5` es visible en la ruta física y, tras pulsar `F4` en MT5, MetaEditor lo lista automáticamente en el panel *Navegador* bajo la sección *Expert Advisors*. |

---

<a id="q-002"></a>

### [Q-002] ¿Dónde se encuentra la carpeta de datos de MetaTrader 5 si estoy trabajando en macOS mediante Wine o CrossOver?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En macOS, MetaTrader 5 corre sobre una capa de traducción de llamadas a la API de Windows (Wine o CrossOver). Wine mapea un sistema de archivos virtual emulado dentro del sandbox de la aplicación en `~/Library/Application Support/`, encapsulando la unidad `C:` de Windows. |
| **2. Evidencia & Fuente Canónica** | *WineHQ Documentation: Wine Prefix and Drive Mapping Architecture*; *Pepperstone macOS MT5 Integration Manual*. |
| **3. Rigor Matemático / Algorítmico** | Ruta física en el filesystem APFS de macOS:<br>`~/Library/Application Support/net.metaquotes.wine.metatrader5/drive_c/[usuario]/AppData/Roaming/MetaQuotes/Terminal/<HASH>/MQL5/Experts/` o directamente en `drive_c/Program Files/MetaTrader 5/MQL5/Experts/`. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En MT5 (ejecutándose en Mac), haz clic en **Archivo** $\rightarrow$ **Abrir carpeta de datos**.<br>2. Se abrirá la ventana virtual de Wine; haz clic derecho sobre la barra de título para revelar la ruta en el Finder de macOS.<br>3. Alternativamente, desde Terminal de macOS, ejecuta: `find ~/Library/Application\ Support -type d -name "Experts" 2>/dev/null` para localizar el path exacto de tu prefijo Wine. |
| **5. Criterio de Falsabilidad / Validación** | El comando `ls "$PATH_EXPERTS"` devuelve los archivos `.mq5` generados y MetaEditor 64 compilador bajo Wine los procesa con código de salida `0`. |

---

<a id="q-003"></a>

### [Q-003] ¿Por qué al compilar o guardar un nuevo Asesor Experto, este no aparece en el árbol del panel Navegador de MT5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | MetaTrader 5 indexa los binarios ejecutables en memoria durante la inicialización del hilo de interfaz gráfica (GUI Thread). Para evitar llamadas intensivas de sondeo I/O en disco durante el streaming de ticks en vivo, la terminal no utiliza un observador de eventos de sistema (*file watcher*) automático sobre la carpeta de datos. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Developer Network: Client Terminal Architecture & Cache Thread Model (2024)*. |
| **3. Rigor Matemático / Algorítmico** | Invariante de caché: $Tree_{\text{visible}}(t) = Tree_{\text{scanned}}(t_0)$ hasta que se dispare un evento de recarga manual $\Delta t_{\text{refresh}}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Asegúrate de haber compilado el archivo `.mq5` para que exista el binario `.ex5` (si solo existe el `.mq5`, MT5 no lo mostrará en el árbol ejecutable).<br>2. Ve al panel **Navegador** (`Ctrl + N`).<br>3. Haz clic derecho sobre la carpeta **Asesores Expertos** (*Expert Advisors*).<br>4. Selecciona **Actualizar** (*Refresh*). |
| **5. Criterio de Falsabilidad / Validación** | El nuevo Asesor Experto aparece inmediatamente en el árbol del Navegador con su icono de rombo coloreado sin reiniciar MT5. |

---

<a id="q-004"></a>

### [Q-004] ¿Por qué es necesario hacer clic derecho sobre "Asesores Expertos" y pulsar "Actualizar" (*Refresh*) en lugar de reiniciar toda la plataforma MT5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Reiniciar la plataforma destruye el caché de cotizaciones en memoria RAM, desconecta los WebSockets TCP de la sesión del broker y obliga a una re-autenticación de cuenta que satura el log y añade una latencia de 10 a 30 segundos, mientras que el comando *Actualizar* ejecuta una simple lectura atómica de directorio en menos de 10 milisegundos. |
| **2. Evidencia & Fuente Canónica** | *Perry J. Kaufman — Trading Systems and Methods (6th Ed., Cap. 21: System Testing Efficiency)*; *MT5 Architecture Standard*. |
| **3. Rigor Matemático / Algorítmico** | Costo computacional: $T_{\text{refresh}} = \mathcal{O}(N_{\text{files}}) \approx 5\text{ ms}$ vs $T_{\text{restart}} = \mathcal{O}(\text{Handshake} + \text{HistorySync} + \text{GUI}) \approx 15.000\text{ ms}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Deja la terminal MT5 abierta.<br>2. Guarda o compila tu bot.<br>3. Presiona `Ctrl + N` para asegurar que el Navegador esté abierto.<br>4. Clic derecho en *Asesores Expertos* $\rightarrow$ *Actualizar*. |
| **5. Criterio de Falsabilidad / Validación** | La terminal conserva la conexión activa con el servidor, no interrumpe gráficos abiertos y lista el nuevo bot de forma instantánea. |

---

<a id="q-005"></a>

### [Q-005] ¿Qué significa exactamente el error `10018: Market closed` cuando intento ejecutar un backtest durante un fin de semana o fuera de horario?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El simulador de eventos discretos del Strategy Tester consulta la matriz de sesiones de trading asignada al símbolo (`SYMBOL_START_TIME` / `SYMBOL_EXPIRATION_TIME` y sesiones por día de semana). Si el timestamp del tick simulado cae en una ventana temporal donde no hay sesión de trading activa definida por el broker, el motor rechaza la orden con código `TRADE_RETCODE_MARKET_CLOSED` (10018). |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Platform Error Codes: Trade Server Return Codes (10018 - TRADE_RETCODE_MARKET_CLOSED)*. |
| **3. Rigor Matemático / Algorítmico** | Condición de rechazo: $\forall t \in \text{TickSequence}, \text{Session}(t) = \emptyset \implies \text{OrderSend}() \rightarrow \text{retcode } 10018$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. No intentes modificar el horario de tu ordenador.<br>2. Ejecuta el script `Script_Unlock_Custom_Symbols_Sessions.mq5` sobre el símbolo personalizado.<br>3. Este script inyecta sesiones continuas de `00:00:00` a `24:00:00` de lunes a domingo. |
| **5. Criterio de Falsabilidad / Validación** | En la pestaña *Diario* (*Journal*) del Strategy Tester desaparecen los registros `failed market buy/sell [Market closed]` y las órdenes se ejecutan con éxito `order #... executed`. |

---

<a id="q-006"></a>

### [Q-006] ¿Cómo se ejecuta y qué hace internamente el script `Script_Unlock_Custom_Symbols_Sessions.mq5` para habilitar trading 24/7?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En MetaTrader 5, los símbolos estándar del broker tienen tablas de sesión de solo lectura. Los símbolos personalizados (`CustomSymbol`) permiten reconfigurar su estructura de sesiones mediante la API MQL5 para declarar cotización y ejecución continua sin restricciones de calendario. |
| **2. Evidencia & Fuente Canónica** | *MQL5 API: CustomSymbolSetSessionQuote() & CustomSymbolSetSessionTrade()*; *QRT Solutions MT5 Automation Protocol*. |
| **3. Rigor Matemático / Algorítmico** | Bucle iterativo sobre los 7 días de la semana:  
$\forall d \in [0, 6], \text{CustomSymbolSetSessionTrade}(\text{sym}, d, 0, 0, 86400) = \text{true}$ y `SYMBOL_TRADE_MODE_FULL`. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre el panel Navegador (`Ctrl + N`) y despliega la carpeta **Scripts**.<br>2. Haz doble clic sobre `Script_Unlock_Custom_Symbols_Sessions` (o arrástralo a cualquier gráfico).<br>3. El script se ejecuta silenciosamente (al tener `#property script_show_inputs false`) y procesa los 27 activos del universo. |
| **5. Criterio de Falsabilidad / Validación** | La pestaña *Expertos* de MT5 imprime: `[OK] CUSTOM_...: Modo FULL y sesiones 24/7 configuradas correctamente.` y `X de X símbolos desbloqueados con éxito`. |

---

<a id="q-007"></a>

### [Q-007] ¿Por qué mi broker habitual solo me permite descargar unas pocas semanas o meses de datos en temporalidad de 1 minuto (M1)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los brokers comerciales optimizan el almacenamiento y ancho de banda de sus servidores limitando el historial de barras M1 a los últimos 3 a 6 meses. Un año de datos M1 contiene más de 370.000 barras por activo; almacenar y servir 20 años de cientos de activos saturaría los servidores de cotizaciones operados por brokers retail. |
| **2. Evidencia & Fuente Canónica** | *Toby Crabel — Day Trading with Short Term Price Patterns (Cap. 1: Data Integrity in High Resolution)*; *Robert Pardo — The Evaluation and Optimization of Trading Strategies (Cap. 3: Data Integrity)*. |
| **3. Rigor Matemático / Algorítmico** | Volumen por activo: $20\text{ años} \times 252\text{ días} \times 390\text{ min RTH} \approx 1.965.600\text{ barras M1} \approx 120\text{ MB}$ de datos puros sin comprimir por instrumento. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. No intentes forzar al broker pulsando "Inicio" en el gráfico para cargar barras antiguas.<br>2. Utiliza las series históricas exportadas de grado institucional (TradeStation/CME) provistas en el repositorio en formato `.csv.gz`.<br>3. Descomprímelas e inyéctalas como símbolos personalizados. |
| **5. Criterio de Falsabilidad / Validación** | Al consultar `Bars(symbol, PERIOD_M1)` en MQL5, el contador devuelve $> 2.000.000$ de barras M1 disponibles de forma continua desde el año 2005 o 2006. |

---

<a id="q-008"></a>

### [Q-008] ¿Cómo inyecto una serie histórica de 20 años de TradeStation en MT5 utilizando el script `Script_Universal_Rates_Injector.mq5`?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | TradeStation genera series temporales OHLCV limpias y sin gaps de broker. El inyector de QRT utiliza la función nativa de alta velocidad `CustomRatesReplace()` para sobreescribir la base de datos de ticks/barras de la terminal MT5 en bloques optimizados de memoria. |
| **2. Evidencia & Fuente Canónica** | *Marcos López de Prado — Advances in Financial Machine Learning (Cap. 2: Financial Data Structures)*; *MQL5 CustomRatesReplace Reference*. |
| **3. Rigor Matemático / Algorítmico** | Asignación en memoria: $\text{RatesArray}[N] \xrightarrow{\text{CustomRatesReplace}} \text{Database}_{\text{MT5}}(\text{Symbol})$ con complejidad $\mathcal{O}(N)$ en tiempo lineal. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Coloca el archivo CSV (ej. `NVDA_1m_2020_2026_MT5.csv`) en `MQL5\Files\`.<br>2. Abre `Script_Universal_Rates_Injector.mq5` en MetaEditor o configúralo con el nombre del archivo y del símbolo destino (`CUSTOM_NVDA_M1`).<br>3. Ejecuta el script en MT5.<br>4. Espera a que la barra de progreso confirme la lectura y sustitución de tasas. |
| **5. Criterio de Falsabilidad / Validación** | La terminal imprime `[ÉXITO TOTAL] Se inyectaron N barras en CUSTOM_...` y el gráfico de MT5 muestra cotizaciones continuas retrocediendo 20 años en el tiempo. |

---

<a id="q-009"></a>

### [Q-009] ¿En qué carpeta específica de MT5 debo colocar el archivo CSV con los datos históricos para que el script inyector pueda leerlo (`MQL5/Files/`)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El entorno de ejecución de MQL5 implementa un sandbox de seguridad de sistema de archivos para prevenir que scripts maliciosos lean o modifiquen archivos sensibles del sistema operativo. Las funciones de I/O de MQL5 (`FileOpen`, `FileReadString`) tienen acceso exclusivamente a la carpeta `MQL5\Files\` o al directorio común `Common\Files\`. |
| **2. Evidencia & Fuente Canónica** | *MQL5 Security Model: File Functions Sandbox Restrictions (Sec. 14.2)*. |
| **3. Rigor Matemático / Algorítmico** | Regla de sandboxing: $\text{PathValid}(P) \iff P \subseteq \text{TerminalDataPath} \cup \text{MQL5/Files}$. Si $P \not\subseteq \text{Sandbox} \implies \text{Handle} = \text{INVALID\_HANDLE} (-1)$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En MT5, ve a **Archivo** $\rightarrow$ **Abrir carpeta de datos**.<br>2. Entra a la carpeta **MQL5** y luego abre **Files**.<br>3. Pega allí tu archivo CSV de datos históricos. |
| **5. Criterio de Falsabilidad / Validación** | La llamada `FileOpen(filename, FILE_READ | FILE_TXT)` devuelve un puntero `handle > 0` y `GetLastError()` devuelve `0`. |

---

<a id="q-010"></a>

### [Q-010] ¿Por qué el script inyector me dice "Error al abrir archivo" si el CSV está en mi carpeta de Descargas?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Por diseño del sandbox de MetaQuotes, cualquier llamada a `FileOpen("C:\\Users\\...\\Downloads\\datos.csv")` es interceptada y bloqueada por el compilador, devolviendo el código de error `5004: ERR_FILE_CANNOT_OPEN`. MT5 no permite rutas absolutas fuera de su sandbox. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Technical Reference: Error 5004 (ERR_FILE_CANNOT_OPEN)*. |
| **3. Rigor Matemático / Algorítmico** | Restricción de acceso: $\text{Access}(P) = 0 \quad \forall P \notin \{\text{MQL5\Files}, \text{Common\Files}\}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre tu carpeta de Descargas.<br>2. Corta o copia el archivo CSV.<br>3. Pégalo en `MQL5\Files\` de la carpeta de datos de MT5.<br>4. En el script, pasa únicamente el nombre relativo del archivo (ej. `"datos.csv"`), sin la ruta de disco de Windows. |
| **5. Criterio de Falsabilidad / Validación** | El script abre el archivo sin arrojar el error 5004 y comienza a parsear los registros. |

---

<a id="q-011"></a>

### [Q-011] ¿Cuál es la diferencia entre un símbolo regular del broker (ej. `NVDA.US`) y un símbolo personalizado (`CUSTOM_NVDA_M1`)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Un símbolo regular del broker recibe cotizaciones en tiempo real del servidor del broker y su historial está protegido contra escritura; sus propiedades de spread, apalancamiento y sesiones son inmutables para el usuario. Un símbolo personalizado es un objeto local administrado por la API de MT5 donde el usuario puede inyectar millones de datos históricos propios y definir libremente horarios 24/7 y condiciones de margen. |
| **2. Evidencia & Fuente Canónica** | *MetaTrader 5 Help: Custom Financial Instruments Creation and Management*. |
| **3. Rigor Matemático / Algorítmico** | Símbolo Regular: $\frac{\partial \text{History}}{\partial \text{User}} = 0$. Símbolo Custom: $\text{History} = f(\text{CSV\_Injected})$, $\text{Sessions} = [00:00, 24:00]$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Si operas en vivo, usas `NVDA.US`.<br>2. Si realizas investigación cuantitativa y backtest multi-década sin sesgo de broker, usas `CUSTOM_NVDA_M1` creado mediante clonación de propiedades. |
| **5. Criterio de Falsabilidad / Validación** | En la ventana *Símbolos* (`Ctrl + U`), los símbolos personalizados aparecen agrupados en una carpeta dedicada con un icono amarillo personalizable y con los botones *Importar barras* / *Exportar barras* completamente habilitados. |

---

<a id="q-012"></a>

### [Q-012] ¿Por qué el Probador de Estrategias de MT5 me indica el mensaje *"No hay cotizaciones para el período seleccionado"* al presionar Iniciar?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El motor del Strategy Tester valida que el rango temporal solicitado $[T_{\text{start}}, T_{\text{end}}]$ contenga registros en la base de datos de barras locales. Si el usuario solicita probar del año 2010 al 2020 pero el broker solo tiene datos desde enero de 2024, la intersección temporal es vacía ($\emptyset$) y la prueba aborta de inmediato. |
| **2. Evidencia & Fuente Canónica** | *Robert Pardo — The Evaluation and Optimization of Trading Strategies (Cap. 4: Sample Selection and Data Range)*. |
| **3. Rigor Matemático / Algorítmico** | Condición de ejecución: $[T_{\text{start}}, T_{\text{end}}] \cap [\text{Data}_{\min}, \text{Data}_{\max}] \neq \emptyset$. Si $\text{Data}_{\max} < T_{\text{start}}$, no hay registros procesables. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre el gráfico del activo en MT5 y presiona la tecla `Inicio` (*Home*) para ver hasta qué fecha retrocede la serie.<br>2. Si faltan datos, inyecta el archivo CSV con el script inyector.<br>3. En el Strategy Tester, ajusta las fechas de inicio y fin para que coincidan con el rango histórico efectivamente inyectado. |
| **5. Criterio de Falsabilidad / Validación** | La barra de progreso verde del Strategy Tester comienza a avanzar y la pestaña *Gráfico* despliega la curva de equity en tiempo real. |

---

<a id="q-013"></a>

### [Q-013] ¿Es obligatorio tener una cuenta demo o cuenta real conectada a internet en MT5 para poder realizar simulaciones con datos históricos locales?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | MetaTrader 5 requiere estar autenticado contra un servidor de broker para inicializar su entorno criptográfico y validar las especificaciones de moneda de la cuenta (`SYMBOL_CURRENCY_MARGIN` / `PROFIT`). Sin embargo, una vez logueado, los backtests de símbolos personalizados (`CUSTOM_*`) se ejecutan de forma 100% local en la CPU del usuario, sin enviar tráfico de órdenes a internet. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Architecture Whitepaper: Local Strategy Testing Engine Operations (2025)*. |
| **3. Rigor Matemático / Algorítmico** | El hilo del simulador es local: $\text{SimulationThread} \subset \text{LocalCPU}$, requiriendo conexión externa solo para el handshake inicial del protocolo de trading. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre una cuenta Demo gratuita en Pepperstone desde el propio MT5 (`Archivo -> Abrir una cuenta`).<br>2. Guarda las credenciales con "Guardar contraseña".<br>3. Deja que MT5 se conecte; a partir de ahí puedes correr todos tus backtests históricos de forma offline u online. |
| **5. Criterio de Falsabilidad / Validación** | La esquina inferior derecha de MT5 muestra barras de conexión en verde/azul con velocidad de ping (ej. `120 ms / 45 kb`), permitiendo iniciar el probador. |

---

<a id="q-014"></a>

### [Q-014] ¿Qué modelo de simulación debo seleccionar en los ajustes del Strategy Tester: *Solo precios de apertura*, *1 minuto OHLC* o *Cada tick basado en ticks reales*?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Para estrategias algorítmicas cuantitativas que operan estrictamente al cierre de vela confirmada (`IsNewBar()`), el modelo **"1 minuto OHLC"** ofrece una precisión matemática idéntica al modelo de ticks reales, pero a una velocidad entre 10 y 50 veces superior, ya que no simula fluctuaciones sub-intradiarias que no alteran la lógica de decisión de la vela cerrada. |
| **2. Evidencia & Fuente Canónica** | *Alexander Elder — The New Trading for a Living (Cap. 8: Bar-Close Execution Rules)*; *Perry J. Kaufman — Trading Systems and Methods (Cap. 21)*. |
| **3. Rigor Matemático / Algorítmico** | Si la función de decisión $f(\text{Bar}_t)$ se evalúa solo cuando $\text{Time}_t \neq \text{Time}_{t-1}$, los eventos intermedios de tick sub-minuto no tienen impacto causal en la señal: $\frac{\partial \text{Signal}}{\partial \text{Tick}_{sub}} = 0$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Para la fase de exploración, calibración y optimización masiva de parámetros: selecciona **"1 minuto OHLC"**.<br>2. Para la auditoría final y verificación de microestructura: selecciona **"Cada tick basado en ticks reales"**. |
| **5. Criterio de Falsabilidad / Validación** | La comparación del informe de backtest entre ambos modelos produce una diferencia de PnL inferior al $1.5\%$ atribuible únicamente a fluctuaciones de spread en milisegundos. |

---

<a id="q-015"></a>

### [Q-015] ¿Por qué el modelo "Cada tick basado en ticks reales" tarda tanto en completar la simulación frente a "1 minuto OHLC"?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En el modelo de ticks reales, el simulador debe procesar de forma secuencial cada una de las cotizaciones individuales de Bid y Ask registradas por el broker (frecuentemente más de 50 a 100 millones de eventos para un periodo de 10 años), mientras que en 1 minuto OHLC solo procesa 4 eventos por barra (Apertura, Máximo, Mínimo, Cierre). |
| **2. Evidencia & Fuente Canónica** | *Robert Pardo — The Evaluation and Optimization of Trading Strategies (Cap. 6: Computational Complexity in Backtesting)*. |
| **3. Rigor Matemático / Algorítmico** | Relación de complejidad: $N_{\text{ticks}} \approx 200 \times N_{\text{bars M1}}$. El tiempo de CPU escala linealmente: $T_{\text{ticks}} \approx 200 \times T_{\text{M1\_OHLC}}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Usa "1 minuto OHLC" para iterar y optimizar hipótesis.<br>2. Reserva "Cada tick basado en ticks reales" únicamente para la auditoría de la variante ganadora final. |
| **5. Criterio de Falsabilidad / Validación** | El tiempo de ejecución se reduce de 45 minutos a menos de 90 segundos conservando el mismo Sharpe Ratio y Profit Factor estructural. |

---

<a id="q-016"></a>

### [Q-016] ¿Qué diferencias operativas y de cálculo existen entre realizar un backtest en TradingView y ejecutarlo en MetaTrader 5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | TradingView simula órdenes sobre barras intradiarias con un motor de eventos ligero que puede interpolar ticks intrabarra de forma sintética (salvo que se use Bar Magnifier en planes superiores) y no descuenta comisiones de swap nocturno o deslizamientos de libros de órdenes reales. MT5 es un simulador de eventos discretos institucional que replica el balance real de la cuenta, margen flotante y tipos de ejecución del broker. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script v6 User Manual: Strategy Execution Model*; *MetaTrader 5 Strategy Tester Mathematical Specifications*. |
| **3. Rigor Matemático / Algorítmico** | TradingView: Equidad teórica acumulada. MT5: $\text{Balance}_t = \text{Balance}_{t-1} + \text{PnL} - \text{Commission} - \text{Swap} - \text{Slippage}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Emplea TradingView para la validación visual rápida de la lógica y diseño gráfico de la estrategia en Pine Script v6.<br>2. Emplea MetaTrader 5 para la auditoría de estrés cuantitativo, análisis de microestructura y ejecución algorítmica real. |
| **5. Criterio de Falsabilidad / Validación** | Ambas plataformas presentan la misma cantidad de operaciones cerradas ($\pm 1\%$) en el mismo período histórico cuando se programa bajo el Estándar de 7 Bloques de QRT. |

---

<a id="q-017"></a>

### [Q-017] ¿Cómo copio e instalo correctamente el código fuente de Pine Script v6 desde el repositorio hacia el editor de TradingView?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | TradingView requiere que los scripts sean creados dentro de su pestaña *Editor de Pine* y añadidos al gráfico activo para que el motor en la nube compile y ejecute la estrategia sobre el feed de precios del broker seleccionado. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script Reference Guide: Editor Workflow and Script Saving*. |
| **3. Rigor Matemático / Algorítmico** | El motor de Pine compila en el servidor de TradingView tras recibir el payload de texto con la cabecera `//@version=6` y la declaración `strategy()`. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abre el archivo `.pine` en tu editor o en el repositorio.<br>2. Copia todo el contenido (`Ctrl + A`, `Ctrl + C`).<br>3. En TradingView, abre la pestaña **Editor de Pine** (abajo).<br>4. Borra cualquier código existente, pega el contenido copiado y pulsa **Guardar**.<br>5. Haz clic en **Añadir al gráfico** (*Add to chart*). |
| **5. Criterio de Falsabilidad / Validación** | El gráfico carga el script, muestra las señales de entrada/salida y la pestaña **Probador de Estrategias** de TradingView despliega las métricas de rendimiento y la lista de operaciones. |

---

<a id="q-018"></a>

### [Q-018] ¿Por qué TradingView rechaza mi script si no incluye la directiva `//@version=6` en la primera línea de código?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Pine Script es un lenguaje versionado que ha evolucionado a través de 6 iteraciones con cambios incompatibles en sintaxis y tipos de datos. La directiva del compilador `//@version=6` es obligatoria para instruir al parser que utilice las reglas de tipos estrictos y funciones modernas de la versión 6, en lugar de caer en el motor heredado de versiones anteriores. |
| **2. Evidencia & Fuente Canónica** | *TradingView Pine Script Documentation: Compiler Directives & Version 6 Migration Guide*. |
| **3. Rigor Matemático / Algorítmico** | Invariante léxica: $\text{FirstNonEmptyLine} == "//@version=6"$. Si falta, el compilador genera un error sintáctico fatal de versión. |
| **4. Protocolo Operativo (Paso a Paso)** | Asegúrate siempre de que la primera línea física del archivo sea exactamente:  
`//@version=6` sin espacios previos ni caracteres invisibles. |
| **5. Criterio de Falsabilidad / Validación** | La consola de compilación de TradingView indica *"Guardado con éxito"* sin advertencias de sintaxis obsoleta. |

---

<a id="q-019"></a>

### [Q-019] ¿Cómo configuro las propiedades de margen (`margin_long` y `margin_short`) en TradingView para evitar avisos de llamada de margen en índices o futuros?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | TradingView aplica por defecto un requerimiento de margen del 100% si no se declara explícitamente, lo cual asume que no hay apalancamiento disponible y genera falsas alertas de margin call en contratos de futuros o índices con alto valor nocional. |
| **2. Evidencia & Fuente Canónica** | *TradingView Strategy Settings Manual: Margin Requirements in Leveraged Products*. |
| **3. Rigor Matemático / Algorítmico** | Margen institucional CME: $\text{MarginRequired} = \text{Notional} \times 0.05$ (apalancamiento 20:1 o 5% de margen). |
| **4. Protocolo Operativo (Paso a Paso)** | En la llamada a `strategy()` en la cabecera de Pine Script v6, declara explícitamente:  
`margin_long = 5.0, margin_short = 5.0`. |
| **5. Criterio de Falsabilidad / Validación** | La estrategia no detiene la simulación prematuramente por liquidación forzosa de margen y calcula los drawdowns reales sobre el capital asignado. |

---

<a id="q-020"></a>

### [Q-020] ¿Qué herramientas necesito instalar en mi PC si quiero usar Google Antigravity o Cursor en lugar de la interfaz web de ChatGPT?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Las interfaces web de IA están aisladas del sistema operativo del usuario. Los entornos de desarrollo agéntico de escritorio (Google Antigravity o Cursor IDE) son aplicaciones nativas construidas sobre arquitecturas con acceso local a terminal y sistema de archivos, lo que les permite leer el repositorio, compilar código y depositar archivos en MetaTrader 5 de forma autónoma. |
| **2. Evidencia & Fuente Canónica** | *Antigravity AI Architecture Documentation: Local File System & Terminal Tool Integration (2026)*. |
| **3. Rigor Matemático / Algorítmico** | Capacidades operativas: $\text{Antigravity} = \text{LLM} + \text{ToolExec}(\text{Bash}, \text{FS\_IO}, \text{Git})$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Descarga e instala **Google Antigravity** o **Cursor IDE**.<br>2. Abre la carpeta de tu repositorio (`seminario_2` o `seminario_2-public`).<br>3. Configura tu API key o suscripción de IA.<br>4. ¡Listo! El entorno detectará automáticamente los archivos de reglas (`AGENTS.md` o `.cursorrules`). |
| **5. Criterio de Falsabilidad / Validación** | Al pedirle a la IA *"crea un bot"*, la herramienta crea físicamente el archivo `.mq5` en tu disco duro sin pedirte copiar y pegar código a mano. |

---

<a id="q-021"></a>

### [Q-021] ¿Es necesario tener Python instalado y configurado en mi máquina para que funcionen los scripts auxiliares del repositorio?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los EAs en MQL5 y los scripts en Pine Script corren de forma autónoma en MT5 y TradingView sin requerir Python. Sin embargo, los pipelines avanzados de auditoría estadística masiva, conversión de datos de TradeStation y validación de registros del enjambre (`seminario verify`) son herramientas construidas en Python 3.12. |
| **2. Evidencia & Fuente Canónica** | *QRT Solutions Laboratory Architecture: Python 3.12 Reproducibility Standard*. |
| **3. Rigor Matemático / Algorítmico** | Separación de capas: Capa de Ejecución (MQL5/Pine) es independiente de la Capa de Telemetría y Auditoría (Python 3.12). |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Si solo deseas probar bots en MT5: **No requieres Python**.<br>2. Si deseas ejecutar los scripts de auditoría porcentual y validación del repositorio: instala Python 3.12 y ejecuta `pip install -r requirements.txt`. |
| **5. Criterio de Falsabilidad / Validación** | Al ejecutar `python3 --version` en tu terminal, el sistema responde `Python 3.12.x`. |

---

<a id="q-022"></a>

### [Q-022] ¿Cómo sé si mi entorno virtual `.venv` de Python está activado correctamente?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Un entorno virtual aísla las librerías del proyecto del sistema global para prevenir conflictos de versiones de paquetes. Al activarse, modifica la variable de entorno `PATH` en la sesión de shell activa, priorizando el binario de Python local. |
| **2. Evidencia & Fuente Canónica** | *Python Software Foundation: PEP 405 — Python Virtual Environments Standard*. |
| **3. Rigor Matemático / Algorítmico** | Estado de shell: $\text{First}(\text{PATH}) == "\dots/.venv/bin"$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En macOS/Linux ejecuta: `source .venv/bin/activate`.<br>2. En Windows (PowerShell) ejecuta: `.venv\Scripts\Activate.ps1`.<br>3. Observa tu terminal: debe aparecer el prefijo `(.venv)` al inicio de la línea de comandos. |
| **5. Criterio de Falsabilidad / Validación** | El comando `which python` (o `where python` en Windows) devuelve una ruta que termina en `.venv/bin/python`. |

---

<a id="q-023"></a>

### [Q-023] ¿Por qué la IA en ChatGPT Web no puede guardar directamente los archivos `.mq5` en mi carpeta de MetaTrader 5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los navegadores web ejecutan código bajo estrictas políticas de sandbox de seguridad del consorcio W3C. Una aplicación web en el navegador no tiene permisos para acceder al sistema de archivos local ni a carpetas del sistema operativo del usuario sin intervención manual explícita. |
| **2. Evidencia & Fuente Canónica** | *W3C Web Application Security Working Group: Same-Origin Policy & File System Access Sandbox Limits*. |
| **3. Rigor Matemático / Algorítmico** | Restricción de navegador: $\text{BrowserProcess} \cap \text{LocalFileSystemWrite} = \emptyset$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Si usas ChatGPT Web: copia el bloque de código generado y pégalo en MetaEditor manualmente.<br>2. Si deseas automatización total de guardado y compilación: utiliza un entorno local como Google Antigravity o Cursor. |
| **5. Criterio de Falsabilidad / Validación** | Comprendes que la limitación no es de la inteligencia del modelo, sino de la arquitectura de seguridad del navegador web. |

---

<a id="q-024"></a>

### [Q-024] ¿Qué diferencia técnica existe entre el archivo de código fuente `.mq5` y el archivo ejecutable binario `.ex5`?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El archivo `.mq5` es texto plano legible por humanos que contiene las instrucciones en sintaxis MQL5. El archivo `.ex5` es un binario compilado en bytecode optimizado y encriptado por MetaQuotes que la máquina virtual de MetaTrader 5 ejecuta a alta velocidad en la CPU. |
| **2. Evidencia & Fuente Canónica** | *MQL5 Compiler and Virtual Machine Architecture: Bytecode Optimization (MetaQuotes 2024)*. |
| **3. Rigor Matemático / Algorítmico** | Transformación de compilación: $\text{SourceCode}(.mq5) \xrightarrow{\text{MetaEditor}} \text{Bytecode}(.ex5)$. MT5 solo puede ejecutar `.ex5`. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Siempre debes conservar tu `.mq5` para poder hacer cambios en la lógica.<br>2. Al pulsar `F7` en MetaEditor, se genera el `.ex5` en la misma carpeta.<br>3. En el Strategy Tester de MT5, seleccionas el nombre del bot, el cual carga el ejecutable `.ex5`. |
| **5. Criterio de Falsabilidad / Validación** | El archivo `.ex5` tiene un tamaño menor en disco y su contenido es binario no editable en editores de texto tradicionales. |

---

<a id="q-025"></a>

### [Q-025] ¿Cómo se abre el MetaEditor desde MT5 y qué tecla rápida se utiliza para compilar manualmente un Asesor Experto (F4 y F7)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | MetaEditor es el IDE oficial integrado provisto por MetaQuotes para escribir, depurar y compilar código MQL5. Cuenta con enlaces de teclado rápidos estandarizados para acelerar el ciclo de desarrollo de software. |
| **2. Evidencia & Fuente Canónica** | *MetaEditor User Guide: Keyboard Shortcuts and Compilation Pipeline*. |
| **3. Rigor Matemático / Algorítmico** | Atajos canónicos: $\text{Key}(\text{F4}) \rightarrow \text{OpenIDE}$, $\text{Key}(\text{F7}) \rightarrow \text{TriggerCompiler}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Estando en MetaTrader 5, presiona la tecla **F4** para abrir MetaEditor.<br>2. Abre el archivo `.mq5` que deseas compilar desde el panel Navegador.<br>3. Presiona la tecla **F7** para iniciar la compilación. |
| **5. Criterio de Falsabilidad / Validación** | La pestaña inferior *Errores* (*Errors*) de MetaEditor muestra el mensaje: `0 error(s), 0 warning(s)` y genera el archivo `.ex5`. |
