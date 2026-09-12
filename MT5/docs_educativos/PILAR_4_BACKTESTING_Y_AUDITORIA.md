# Pilar 4: Backtesting, Optimización & Auditoría Cuantitativa

> **Autor Institucional:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Guía Maestra de Formación Cuantitativa  
> **Módulo:** Preguntas 76 a 100 — Evaluación Dual, Métricas Porcentuales Puras, MAE/MFE y Mesetas de Robustez

---

<a id="q-076"></a>

### [Q-076] ¿Por qué el sobreajuste (*curve-fitting* o *data mining bias*) es la principal causa de ruina en traders sistemáticos novatos?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El sobreajuste ocurre cuando un modelo algorítmico memoriza el ruido aleatorio histórico en lugar de capturar una anomalía o comportamiento causal subyacente. Un sistema sobreoptimizado muestra curvas de capital perfectas en simulación pasada, pero colapsa de inmediato al exponerse al flujo de órdenes en tiempo real porque el ruido nunca se repite. |
| **2. Evidencia & Fuente Canónica** | *David Aronson — Evidence-Based Technical Analysis: Applying the Scientific Method to Sunk-Cost Data Mining (2006)*; *Marcos López de Prado — Advances in Financial Machine Learning (2018), Cap. 11: "The Dangers of Backtesting"*. |
| **3. Rigor Matemático / Algorítmico** | Probabilidad de falso descubrimiento: ante $N$ pruebas estadísticas independientes sobre la misma serie, la tasa de error Tipo I inflada es $\alpha^* = 1 - (1 - \alpha)^N$. Si se prueban $N = 1000$ combinaciones con $\alpha = 0.05$, la probabilidad de hallar un falso edge "rentable" es del $99.99\%$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Nunca optimizar parámetros sin una hipótesis causal previa documentada en Fase 1.<br>2. Restringir la optimización a un máximo de 2 variables interconectadas (ej. multiplicadores de SL y TP en ATR).<br>3. Descartar cualquier configuración que no mantenga estabilidad en ventanas *Out-of-Sample*. |
| **5. Criterio de Falsabilidad / Validación** | Si la degradación del Ratio de Sharpe entre la muestra de prueba (*In-Sample*) y la muestra ciega (*Out-of-Sample*) supera el $30\%$, el sistema se califica automáticamente como espurio. |

---

<a id="q-077"></a>

### [Q-077] ¿Por qué la evaluación monetaria pura en USD de un backtest distorsiona la calidad estadística del sistema frente al retorno porcentual puro?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El beneficio neto monetario en USD depende fuertemente del tamaño de la cuenta, del lotaje fijo o compuesto aplicado, de la inflación del precio del activo y del momento en que ocurren las pérdidas (dependencia del camino o *path dependency*). El retorno porcentual puro sobre el precio del activo ($\Delta P / P_{\text{entry}}$) mide la auténtica ventaja estadística de la señal, aislada de la capitalización y del apalancamiento financiero. |
| **2. Evidencia & Fuente Canónica** | *Perry Kaufman — Trading Systems and Methods (6th Ed., 2020)*; *QRT Institutional Backtest Audit Manual (`MT5/BACKTEST_AUDIT_MANUAL.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Retorno porcentual puro de la operación $i$:  
$R_i = \text{Dirección} \times \frac{P_{\text{exit}} - P_{\text{entry}}}{P_{\text{entry}}}$, donde $\text{Dirección} = +1$ (Long) ó $-1$ (Short).  
El PnL en USD es $PnL_i = R_i \times \text{Nocional}_i - \text{Comisiones}$, lo que introduce distorsión volumétrica ajena a la calidad predictiva del algoritmo. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En el script de Python `generate_percentage_audit_report.py`, leer el reporte HTML/XML exportado de MT5.<br>2. Extraer los precios reales de entrada y salida para cada trade cerrado.<br>3. Calcular el retorno no apalancado $R_i$ de cada trade y evaluar la suma y media porcentual. |
| **5. Criterio de Falsabilidad / Validación** | La curva de retornos acumulados porcentuales $\sum R_i$ debe exhibir una pendiente positiva monótona independientemente del saldo inicial de la cuenta o del lotaje configurado. |

---

<a id="q-078"></a>

### [Q-078] ¿Cómo se define y calcula matemáticamente el Retorno Porcentual Puro acumulado ($\sum R_i$) y compuesto ($\prod(1+R_i)-1$)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El retorno acumulado simple ($\sum R_i$) refleja la suma aritmética lineal del edge porcentual capturado en cada operación, eliminando la distorsión del interés compuesto sobre la evaluación del modelo. El retorno geométrico compuesto ($\prod(1+R_i)-1$) cuantifica el crecimiento de una unidad de capital si cada trade reinvirtiera exactamente el $100\%$ del equity acumulado. Ambos permiten auditar la resistencia a rachas negativas. |
| **2. Evidencia & Fuente Canónica** | *Ralph Vince — The Mathematics of Money Management (1992)*; *Campbell, Lo & MacKinlay — The Econometrics of Financial Markets (1997)*. |
| **3. Rigor Matemático / Algorítmico** | Para $N$ operaciones cerradas con retornos unitarios $\{R_1, R_2, \dots, R_N\}$:  
Retorno Simple Acumulado: $R_{\text{acum}} = \sum_{i=1}^{N} R_i$  
Retorno Compuesto Geométrico: $R_{\text{geom}} = \left( \prod_{i=1}^{N} (1 + R_i) \right) - 1$ |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Ejecutar el backtest en MT5 o TradingView y exportar la lista de transacciones.<br>2. En Python:  
`df['pct_return'] = np.where(df['type']=='BUY', (df['close']-df['open'])/df['open'], (df['open']-df['close'])/df['open'])`  
`sum_return = df['pct_return'].sum()`  
`compound_return = np.prod(1 + df['pct_return']) - 1` |
| **5. Criterio de Falsabilidad / Validación** | Un sistema robusto requiere que $R_{\text{acum}} > 0$ y que el Drawdown porcentual máximo no apalancado sobre la serie de retornos no supere el $15\%$. |

---

<a id="q-079"></a>

### [Q-079] ¿Qué es la función de evento `OnTester()` en MQL5 y por qué es superior para optimización frente al Beneficio Neto en dólares?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El Probador de Estrategias de MT5 optimiza por defecto buscando maximizar el saldo final en USD, lo que premia sobreajustes con grandes pérdidas latentes o rachas afortunadas cerca del final del periodo. La función nativa `OnTester()` permite inyectar un algoritmo personalizado que penaliza el drawdown, premia el número de trades y calcula métricas porcentuales o el Ratio de Calmar antes de devolver un único valor escalar de aptitud (*fitness*). |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Software Corp. — MQL5 Reference: Event Handling Functions, OnTester (2024)*; *Robert Pardo — The Evaluation and Optimization of Trading Strategies (2008)*. |
| **3. Rigor Matemático / Algorítmico** | Función de Fitness institucional personalizada en Bloque 7:  
$\text{Fitness} = \text{CustomMetric} = \frac{\text{Profit Factor \%} \times \sqrt{N_{\text{trades}}}}{\text{MaxDD \%} + \epsilon}$  
Si $N_{\text{trades}} < 50$, `OnTester()` retorna $0.0$, invalidando de inmediato combinaciones sin significancia estadística. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Declarar al final del EA el Bloque 7:  
```mql5
double OnTester() {
   double ret = ...; // Cálculo de ratio institucional
   return(ret);
}
```  
2. En la pestaña de Optimización de MT5, seleccionar en "Optimización" la opción **"Custom Criterion"**. |
| **5. Criterio de Falsabilidad / Validación** | Los parámetros seleccionados como ganadores en el Optimizador de MT5 corresponden al pico de estabilidad de la métrica porcentual personalizada y no a un caso aislado de alto saldo monetario. |

---

<a id="q-080"></a>

### [Q-080] ¿Cómo configurar el Criterio Personalizado (*Custom Criterion*) en el Probador de Estrategias de MetaTrader 5?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los criterios estándar de optimización de MT5 (ej. *Balance max*, *Profit Factor max*) ignoran la estructura de retornos porcentuales puros y la consistencia en el tiempo. La opción *Custom Criterion* delega la función de pérdida y recompensa al código del EA en `OnTester()`, permitiendo al trader entrenar el algoritmo bajo sus propias reglas institucionales de gestión de riesgo. |
| **2. Evidencia & Fuente Canónica** | *MetaQuotes Documentation — Strategy Tester Optimization Criteria (2024)*. |
| **3. Rigor Matemático / Algorítmico** | Maximización condicionada: $\theta^* = \arg\max_{\theta \in \Theta} \text{OnTester}(\theta)$ donde $\theta$ es el vector de parámetros evaluados en el espacio continuo o discreto $\Theta$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Abrir el Strategy Tester en MT5 (`Ctrl+R`).<br>2. En el desplegable "Optimization", seleccionar **"Custom Criterion max"** (o "Criterio Máximo Personalizado").<br>3. Activar el algoritmo genético rápido o la cuadrícula completa (*Slow Complete Algorithm*).<br>4. Iniciar la optimización y ordenar los resultados por la columna **Result**. |
| **5. Criterio de Falsabilidad / Validación** | La columna `Result` del tester refleja exactamente el valor numérico devuelto por la función `OnTester()` de Bloque 7 en cada pasada del backtest. |

---

<a id="q-081"></a>

### [Q-081] ¿Por qué una estrategia con un Win Rate del 35% o 40% puede ser altamente rentable y estadísticamente superior a una del 90%?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Un Win Rate del 90% suele ser indicativo de estrategias tipo Martingala o Grid sin Stop Loss, donde se asumen pérdidas gigantescas e ilimitadas para capturar ganancias microscópicas. Las estrategias seguidoras de tendencia o de ruptura capturan asimetrías positivas convexas: cortan las pérdidas rápidamente cuando el mercado no responde y dejan correr los beneficios en grandes tendencias, logrando rentabilidades sostenibles a pesar de perder más de la mitad de las veces. |
| **2. Evidencia & Fuente Canónica** | *Mark Minervini — Trade Like a Stock Market Wizard (2013)*; *Nassim Nicholas Taleb — Fooled by Randomness: The Hidden Role of Chance in Life and in the Markets (2001)*. |
| **3. Rigor Matemático / Algorítmico** | Umbral de Rentabilidad (*Break-Even Win Rate*):  
$\text{WR}_{\text{BE}} = \frac{1}{1 + \text{Payoff}}$.  
Si el Ratio Payoff es $3.0$ a $1$, $\text{WR}_{\text{BE}} = \frac{1}{1 + 3.0} = 0.25$ ($25\%$).  
Un sistema con Win Rate del $40\%$ y Payoff de $3.0$ genera una ganancia neta superior a un sistema con Win Rate del $85\%$ y Payoff de $0.10$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Evaluar conjuntamente en el reporte de backtest el Win Rate y el Payoff Ratio.<br>2. Comprobar que el producto $(WR \times \text{Avg Win}) > (LR \times \text{Avg Loss})$.<br>3. Aceptar psicológicamente y operativamente rachas de pérdidas normales bajo control de Stop Loss estricto. |
| **5. Criterio de Falsabilidad / Validación** | El Profit Factor de la estrategia es superior a $1.50$ aun cuando el porcentaje de operaciones ganadoras reportado en el probador se sitúa entre el $35\%$ y el $45\%$. |

---

<a id="q-082"></a>

### [Q-082] ¿Qué es el Ratio Payoff (Ratio Beneficio/Riesgo realizado) y cómo interactúa matemáticamente con la Tasa de Acierto (*Win Rate*)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El Payoff Ratio es el cociente entre la ganancia media de las operaciones ganadoras y la pérdida media de las operaciones perdedoras. Mientras que la tasa de acierto mide la frecuencia de aciertos, el Payoff mide la magnitud del acierto frente al error. El edge real surge de la multiplicación de ambas dimensiones, no de una de ellas de forma aislada. |
| **2. Evidencia & Fuente Canónica** | *Van K. Tharp — Trade Your Way to Financial Freedom (2nd Ed., 2006)*; *Jack Schwager — Market Wizards: Interviews with Top Traders (1989)*. |
| **3. Rigor Matemático / Algorítmico** | Ratio Payoff formal:  
$\text{Payoff} = \frac{\overline{\text{Gain}}_{\text{wins}}}{\overline{\text{Loss}}_{\text{losses}}} = \frac{\frac{1}{N_w} \sum_{k \in \text{wins}} R_k}{\frac{1}{N_l} \sum_{j \in \text{losses}} |R_j|}$.  
El Profit Factor se deriva directamente de la relación entre ambos: $\text{PF} = \text{Payoff} \times \left( \frac{\text{WR}}{1 - \text{WR}} \right)$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En el script de auditoría o en el resumen de MT5, ubicar "Ganancia Media" y "Pérdida Media".<br>2. Dividir la Ganancia Media entre la Pérdida Media (en valor absoluto).<br>3. Si el Payoff es $< 1.0$, exigir obligatoriamente un Win Rate $> 55\%$ para que el sistema sea viable. |
| **5. Criterio de Falsabilidad / Validación** | Si una estrategia diseñada con TP a $2.0x$ ATR y SL a $1.0x$ ATR exhibe un Payoff real $< 1.20$, indica que existen deslizamientos (*slippage*) severos o salidas prematuras no modeladas. |

---

<a id="q-083"></a>

### [Q-083] ¿Cómo se formula y calcula la Esperanza Matemática ($E$) por trade en términos porcentuales de precio del activo?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | La Esperanza Matemática es el valor esperado del retorno porcentual neto de la próxima operación antes de abrirla. Representa el rendimiento medio por trade que el sistema extraerá del mercado tras un número grande de repeticiones estadísticas. Si la esperanza es cero o negativa, el sistema está condenado a la ruina por fricción de costes. |
| **2. Evidencia & Fuente Canónica** | *Mark Minervini — Think & Trade Like a Champion (2017)*; *Perry Kaufman — Smarter Trading (1995)*. |
| **3. Rigor Matemático / Algorítmico** | Ecuación canónica porcentual:  
$E = (\text{WR} \times \overline{R}_{\text{win}}) - (\text{LR} \times |\overline{R}_{\text{loss}}|)$  
donde $\text{WR}$ es la tasa de acierto, $\text{LR} = 1 - \text{WR}$ es la tasa de pérdida, y $\overline{R}_{\text{win}}, \overline{R}_{\text{loss}}$ son los retornos porcentuales puros medios de ganadores y perdedores. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Calcular $\text{WR} = N_{\text{wins}} / N_{\text{total}}$ y $\text{LR} = N_{\text{losses}} / N_{\text{total}}$.<br>2. Calcular la media porcentual de los trades positivos y de los negativos.<br>3. Evaluar $E$. Para considerar viable un bot institucional, se requiere $E \ge +0.20\%$ por trade en marcos intradiarios (M30/H1). |
| **5. Criterio de Falsabilidad / Validación** | Un valor de $E \le 0.0\%$ falsifica automáticamente la hipótesis de la estrategia y obliga a su rechazo inmediato antes de pasar a producción. |

---

<a id="q-084"></a>

### [Q-084] ¿Por qué es obligatorio exigir un desglose direccional mandatorio entre Compras (*Longs*) y Ventas (*Shorts*) en todo informe de backtesting?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | La mayoría de los activos financieros (especialmente índices bursátiles y acciones) poseen un sesgo alcista estructural a largo plazo impulsado por la inflación y el crecimiento económico. Si un reporte consolida ambos sentidos en una única métrica global, puede enmascarar que el $100\%$ de los beneficios proviene simplemente de comprar en una tendencia alcista secular, mientras que las operaciones cortas destruyen capital constantemente. |
| **2. Evidencia & Fuente Canónica** | *Alexander Elder — Trading for a Living (1993)*; *QRT Módulo 2 de Diagnóstico Cuantitativo (`MT5/BACKTEST_AUDIT_MANUAL.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Descomposición de la función de aptitud global:  
$PnL_{\text{Total}} = PnL_{\text{Long}} + PnL_{\text{Short}}$.  
Se exige formalmente que $\text{PF}_{\text{Long}} \ge 1.20$ y $\text{PF}_{\text{Short}} \ge 1.05$ (o neutralidad controlada) para certificar que la lógica de entrada posee simetría o adaptación adecuada al régimen. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En MT5, revisar la tabla del Probador de Estrategias en la sección "Operaciones Compras" y "Operaciones Ventas".<br>2. En el script de Python, generar la tabla comparativa de Módulo 2 con columnas: Métrica, Compras (Longs) y Ventas (Shorts).<br>3. Comparar Win Rate, Retorno Total, Profit Factor y Duración Media por sentido. |
| **5. Criterio de Falsabilidad / Validación** | Si el Profit Factor de una de las dos direcciones es inferior a $0.80$, la regla de entrada para ese sentido debe ser reconfigurada o la estrategia debe restringirse temporalmente a operar sólo a favor del sesgo macro dominante. |

---

<a id="q-085"></a>

### [Q-085] ¿Qué revela el diagnóstico de asimetría cuando una estrategia gana todo en compras y pierde consistentemente en ventas?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Revela que la estrategia no posee un edge técnico predictivo simétrico, sino que está actuando como un vehículo pasivo de exposición a la prima de riesgo de renta variable (*Equity Risk Premium*). Además, las caídas del mercado son dinámicamente distintas a las subidas: la volatilidad se expande bruscamente en ventas (pánico) y se comprime en subidas (acumulación), por lo que usar idénticos multiplicadores de ATR para ambos lados suele quebrar las posiciones cortas. |
| **2. Evidencia & Fuente Canónica** | *Benoit Mandelbrot — The (Mis)Behavior of Markets: A Fractal View of Risk, Ruin, and Reward (2004)*; *Perry Kaufman — Trading Systems and Methods (Cap. 22: Asymmetry in Price Changes)*. |
| **3. Rigor Matemático / Algorítmico** | Asimetría de Volatilidad (*Leverage Effect*): $\text{Corr}(\Delta P_t, \Delta \sigma_{t+1}) < 0$. Una caída en el precio incrementa la volatilidad futura, haciendo que un Stop Loss simétrico sea alcanzado mucho más rápido en ventas que en compras. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Diagnosticar si la causa es la asimetría del activo o el régimen del backtest.<br>2. Ajustar los múltiplos de Stop Loss para ventas (ej. $1.25x$ ATR en cortos frente a $1.0x$ ATR en largos).<br>3. O bien, incorporar un filtro de régimen estricto (ej. ventas solo permitidas si el precio está por debajo de la SMA 200 diaria). |
| **5. Criterio de Falsabilidad / Validación** | Tras la calibración, el PnL de las ventas debe aproximarse a un valor positivo o al menos de punto de equilibrio ($\text{PF}_{\text{Short}} \ge 1.0$), evitando el drenaje continuo de los beneficios generados por las compras. |

---

<a id="q-086"></a>

### [Q-086] ¿Qué es la Consistencia Temporal Mensual y por qué exigimos un umbral mínimo del 55% de meses positivos?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Una estrategia puede acumular un retorno anual deslumbrante concentrado exclusivamente en 2 o 3 eventos anómalos o *outliers* del mercado, pasando los restantes 9 meses en un declive constante de capital. La consistencia temporal mensual evalúa la distribución homogénea del edge a lo largo de los ciclos de mercado, garantizando que el sistema sea psicológicamente operable y resistente al desgaste del trader o del fondo. |
| **2. Evidencia & Fuente Canónica** | *David Aronson — Evidence-Based Technical Analysis (2006)*; *Standard Institutional Due Diligence Questionnaires (ILPA / Preqin Guidelines)*. |
| **3. Rigor Matemático / Algorítmico** | Ratio de Consistencia Temporal Mensual:  
$C_{\text{mensual}} = \frac{N_{\text{meses con } PnL > 0}}{N_{\text{meses totales}}} \times 100 \ge 55\%$.  
Un valor de $C_{\text{mensual}} \ge 65\%$ se clasifica como excelente en trading cuantitativo intradiario/swing. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Exportar la matriz de PnL agrupada por mes y año desde el script de auditoría de Python.<br>2. Contar el número de celdas verdes (positivas) sobre el total de meses operados.<br>3. Verificar que no existan más de 3 meses consecutivos en negativo sin activar revisiones de gobernanza. |
| **5. Criterio de Falsabilidad / Validación** | Si una estrategia presenta una rentabilidad global alta pero su consistencia mensual es $< 50\%$, se rechaza por depender excesivamente de la cola extrema de la distribución de retornos. |

---

<a id="q-087"></a>

### [Q-087] ¿Qué es la Máxima Excursión Adversa (MAE) y cómo permite calibrar empíricamente la ubicación óptima del Stop Loss?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El MAE (*Maximum Adverse Excursion*) mide el precio más desfavorable alcanzado por el mercado en contra de una posición mientras estuvo abierta, antes de cerrarse. Si un trade resultó finalmente ganador, su MAE revela cuánto "dolor" o pérdida flotante tuvo que tolerar antes de recuperarse. Esto permite ubicar el Stop Loss justo más allá de donde el dolor de los ganadores se detiene, evitando cerrar prematuramente operaciones rentables. |
| **2. Evidencia & Fuente Canónica** | *John Sweeney — Campaign Trading: Tactics and Strategies to Exploit the Markets (1992)*; *John Sweeney — Maximum Adverse Excursion: Analyzing the Price Approach to Successful Trading (1997)*. |
| **3. Rigor Matemático / Algorítmico** | Para una posición Long con entrada en $P_{\text{entry}}$ en el intervalo temporal $[t_0, t_1]$:  
$\text{MAE} = \max\left(0, \frac{P_{\text{entry}} - \min_{t \in [t_0, t_1]} \text{Low}_t}{\text{ATR}_D(14)}\right)$  
expresado como múltiplo normalizado de volatilidad diaria. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Extraer la serie histórica de precios tick o intradiarios de cada trade ganador.<br>2. Calcular el valor mínimo (en Longs) o máximo (en Shorts) alcanzado durante la vida del trade.<br>3. Representar el gráfico de dispersión de MAE vs PnL Final de todas las operaciones. |
| **5. Criterio de Falsabilidad / Validación** | Se confirma empíricamente si más del $90\%$ de las operaciones ganadoras nunca tuvieron un retroceso adverso mayor a $X$ veces el ATR Diario. Colocar el Stop Loss en $X$ es estadísticamente óptimo. |

---

<a id="q-088"></a>

### [Q-088] ¿Por qué el percentil 90 del MAE de operaciones ganadoras ($P_{90}(\text{MAE}_{\text{wins}})$) es el ancla institucional para el Stop Loss inicial?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Colocar un Stop Loss demasiado ajustado estrangula el trade ante el ruido normal del mercado, provocando pérdidas innecesarias en operaciones que iban a ser rentables. Colocarlo demasiado lejos destruye el Payoff Ratio. El percentil 90 del MAE de los ganadores establece un límite matemático riguroso: permite respirar al $90\%$ de los trades ganadores mientras corta inmediatamente cualquier pérdida que sobrepase el comportamiento normal de una operación con ventaja. |
| **2. Evidencia & Fuente Canónica** | *John Sweeney — Maximum Adverse Excursion (1997)*; *QRT Optimization Protocol (`quant_agentic_swarm/docs/OPTIMIZATION_PROTOCOL.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Determinación del umbral de Stop Loss óptimo $\text{SL}^*$:  
$\text{SL}^* = P_{90}(\{ \text{MAE}_i \mid \text{Trade}_i \in \text{Winners} \})$.  
Cualquier excursión negativa superior a este percentil tiene una probabilidad empírica de recuperación menor al $10\%$. Mantener la posición abierta más allá de ese punto es una esperanza matemática irracional. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Filtrar el dataset de trades únicamente para operaciones ganadoras ($R_i > 0$).<br>2. En Python, calcular `sl_anchor = np.percentile(df_wins['mae_atr'], 90)`.<br>3. Establecer el múltiplo de Stop Loss del EA en el valor `sl_anchor` redondeado al cuarto de ATR más cercano (ej. $0.75x$ o $1.0x$). |
| **5. Criterio de Falsabilidad / Validación** | La tasa de acierto del sistema optimizado no decae en más de un $3\%$ respecto a un sistema sin Stop Loss, pero el Drawdown Máximo se reduce en más del $40\%$. |

---

<a id="q-089"></a>

### [Q-089] ¿Qué es la Máxima Excursión Favorable (MFE) y cómo se utiliza para determinar el Take Profit sin caer en codicia o colas extremas?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El MFE (*Maximum Favorable Excursion*) mide el precio más favorable alcanzado a favor de una posición mientras estuvo viva. Muchos traders novatos colocan objetivos de beneficios en picos inalcanzables que el precio toca sólo en el $1\%$ de los casos, viendo cómo grandes ganancias latentes se evaporan y se convierten en pérdidas. El análisis de MFE revela la capacidad real de recorrido del activo para capturar el beneficio antes de que el impulso se agote. |
| **2. Evidencia & Fuente Canónica** | *John Sweeney — Campaign Trading (1992)*; *Perry Kaufman — Trading Systems and Methods (2020)*. |
| **3. Rigor Matemático / Algorítmico** | Para una posición Long:  
$\text{MFE} = \frac{\max_{t \in [t_0, t_1]} \text{High}_t - P_{\text{entry}}}{\text{ATR}_D(14)}$.  
La función de densidad de probabilidad empírica $f(\text{MFE})$ muestra la distribución del potencial de avance de la señal cuantitativa. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Calcular el MFE para cada trade ejecutado en el backtest.<br>2. Graficar el histograma de densidad de MFE normalizado por ATR Diario.<br>3. Identificar la región donde la curva de densidad comienza a decaer exponencialmente. |
| **5. Criterio de Falsabilidad / Validación** | El porcentaje de trades que alcanzan el Take Profit configurado debe situarse entre el $60\%$ y el $80\%$ de los trades con MFE positivo, evitando que el TP sea una barrera meramente teórica. |

---

<a id="q-090"></a>

### [Q-090] ¿Por qué la masa modal o mediana de la densidad empírica de MFE es superior a buscar la cola del 99% de recorrido?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Los mercados presentan distribuciones leptocúrticas con colas pesadas. Intentar capturar la cola del $99\%$ del MFE exige permanecer en el mercado durante periodos prolongados expuesto a reversiones bruscas de tendencia, reduciendo el número de trades cerrados con éxito y aumentando el coste de oportunidad. La masa modal o mediana concentra la mayor densidad de probabilidad de retorno acumulable de forma predecible y consistente. |
| **2. Evidencia & Fuente Canónica** | *Toby Crabel — Day Trading with Short Term Price Patterns (1990)*; *Benoit Mandelbrot — Fractals and Scaling in Finance (1997)*. |
| **3. Rigor Matemático / Algorítmico** | Calibración de $\text{TP}^*$:  
$\text{TP}^* = \text{Mediana}(\text{MFE}) = Q_2(\text{MFE})$.  
El área bajo la curva de densidad entre $0$ y $\text{TP}^*$ es exactamente $0.50$, lo que garantiza que la mitad de los movimientos favorables completarán la meta de beneficio sin esperar eventos fortuitos. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. En el script de Python: `tp_anchor = np.median(df_all['mfe_atr'])`.<br>2. Contrastar el valor con la masa modal (el pico del histograma KDE).<br>3. Fijar el multiplicador de Take Profit en dicho valor (ej. $1.50x$ ATR Diario). |
| **5. Criterio de Falsabilidad / Validación** | El tiempo medio para alcanzar el Take Profit se reduce drásticamente y la tasa de conversión de operaciones positivas flotantes a ganancias efectivas cerradas aumenta por encima del $70\%$. |

---

<a id="q-091"></a>

### [Q-091] ¿Cómo se analiza el Tiempo de Permanencia (*Time-Stop*) comparando la duración media en barras de trades ganadores vs perdedores?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | La ventaja estadística de una señal cuantitativa tiene una vida media finita: si el mercado no se mueve a favor de la hipótesis rápidamente, el paso del tiempo disuelve la ventaja inicial e incrementa la probabilidad de ser sacado por un shock aleatorio adverso. Los ganadores institucionales suelen alcanzar su objetivo rápidamente, mientras que las posiciones que se quedan estancadas durante decenas de barras tienden a cerrar en pérdida. |
| **2. Evidencia & Fuente Canónica** | *Toby Crabel — Day Trading with Short Term Price Patterns (1990)*; *Arthur Merrill — Filtered Waves: Basic Theory (1977)*. |
| **3. Rigor Matemático / Algorítmico** | Decaimiento temporal del edge: si $\overline{\Delta t}_{\text{wins}} \ll \overline{\Delta t}_{\text{losses}}$, el sistema sufre del síndrome de retención de perdedores.  
El *Time-Stop* se calibra como:  
$T_{\text{max}} = \mu_{\text{wins}} + 1.5 \times \sigma_{\text{wins}}$ barras intradiarias. Si $t - t_0 > T_{\text{max}}$, se emite cierre forzado al mercado. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Medir en barras M30 la duración de cada trade.<br>2. Comparar la duración media de ganadores ($\overline{\text{Bars}}_{\text{wins}}$) contra la de perdedores ($\overline{\text{Bars}}_{\text{losses}}$).<br>3. Programar en Bloque 5 de MQL5 y Pine Script la salida por límite de barras (`InpMaxBarsInTrade`). |
| **5. Criterio de Falsabilidad / Validación** | La introducción del *Time-Stop* libera margen de capital más rápido, reduce la duración máxima de los drawdowns y mejora el Ratio de Sharpe global del sistema. |

---

<a id="q-092"></a>

### [Q-092] ¿Qué es el Circuit Breaker de Racha de Pérdidas y cómo previene el colapso de la cuenta ante un cambio abrupto de régimen de mercado?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Cuando un banco central cambia su política monetaria, estalla un conflicto geopolítico o la volatilidad estructural se desplaza, los supuestos del algoritmo pueden invalidarse temporalmente. En lugar de seguir operando y acumulando pérdidas en serie, un *Circuit Breaker* automático congela temporalmente la operativa del bot tras un umbral fijo de pérdidas continuas (ej. 3 consecutivas en el mes), forzando una pausa hasta el próximo ciclo. |
| **2. Evidencia & Fuente Canónica** | *Alexander Elder — The New Trading for a Living (2014, Regla del 6% y freno de racha)*; *Perry Kaufman — Trading Systems and Methods (2020)*. |
| **3. Rigor Matemático / Algorítmico** | Mecanismo de parada determinista en Bloque 5:  
$\text{Si } N_{\text{consecutive\_losses\_in\_month}} \ge 3 \implies \text{PermitirOperativa} = \text{False hasta el primer día del mes siguiente}$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Implementar en el EA una función que audite el historial reciente de trades del mes en curso mediante `HistorySelect()`.<br>2. Si se detectan 3 cierres consecutivos en SL, cambiar una bandera global interna a inactiva.<br>3. Imprimir alerta institucional en el log de MT5: `CIRCUIT BREAKER ACTIVADO: 3 pérdidas consecutivas. Operativa pausada hasta nuevo mes.` |
| **5. Criterio de Falsabilidad / Validación** | En simulaciones con periodos de crisis severa (ej. marzo de 2020), el *Circuit Breaker* recorta el Drawdown Máximo continuo a menos de la mitad del drawdown del sistema sin control de racha. |

---

<a id="q-093"></a>

### [Q-093] ¿Por qué está terminantemente prohibido elegir parámetros basándose en picos aislados de rendimiento (*"Anti-Spikes Manifesto"* conclusions)?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Un pico aislado en un mapa de calor tridimensional de optimización (donde una combinación específica da un Sharpe de 3.5 pero todas las combinaciones vecinas adyacentes dan pérdidas) representa una coincidencia espuria que ajustó el algoritmo exactamente a una secuencia irrepetible de ticks. En operativa real, el mercado experimentará un ligero desplazamiento en su volatilidad y caerá en la fosa de pérdidas contigua. |
| **2. Evidencia & Fuente Canónica** | *Robert Pardo — The Evaluation and Optimization of Trading Strategies (2008)*; *Perry Kaufman — Smarter Trading (1995)*. |
| **3. Rigor Matemático / Algorítmico** | Gradiente de Inestabilidad Paramétrica:  
$\nabla S(\theta) = \left[ \frac{\partial S}{\partial \theta_1}, \frac{\partial S}{\partial \theta_2}, \dots \right]$.  
Si $\|\nabla S(\theta^*)\| \gg 0$, el punto óptimo $\theta^*$ es ultrasensible y frágil. Se exige estabilidad de Lipschitz: $|S(\theta_1) - S(\theta_2)| \le L \|\theta_1 - \theta_2\|$ con $L$ pequeño. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Generar la matriz 2D o 3D de resultados de optimización (ej. SL en filas, TP en columnas).<br>2. Descartar automáticamente cualquier celda con alto rendimiento que esté rodeada de celdas rojas o deficitarias.<br>3. Buscar regiones contiguas de color verde uniforme. |
| **5. Criterio de Falsabilidad / Validación** | Cualquier combinación paramétrica clasificada como "pico aislado" fracasará en más del $80\%$ de las ocasiones al ser sometida a un test ciego *Out-of-Sample*. |

---

<a id="q-094"></a>

### [Q-094] ¿Qué es una Meseta de Robustez paramétrica (*Parametric Plateau*) según Robert Pardo y Perry Kaufman?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Una meseta de robustez es una región amplia, plana y continua en el espacio de parámetros donde el rendimiento de la estrategia se mantiene consistentemente alto y positivo ante pequeñas variaciones en los inputs. La existencia de una meseta demuestra que el algoritmo descubrió una propiedad fundamental y persistente de la dinámica del mercado, tolerando deslizamientos y cambios menores en el comportamiento de los precios. |
| **2. Evidencia & Fuente Canónica** | *Robert Pardo — The Evaluation and Optimization of Trading Strategies (2008), Cap. 8: "Evaluating the Optimization Display"*; *Perry Kaufman — Trading Systems and Methods (2020)*. |
| **3. Rigor Matemático / Algorítmico** | Definición formal del conjunto de meseta $\mathcal{M}$:  
$\mathcal{M} = \{ \theta \in \Theta \mid S(\theta) \ge 0.80 \times S_{\max} \}$,  
donde $S(\theta)$ es la métrica de fitness (ej. Sharpe o Profit Factor) y $\mathcal{M}$ debe ser un conjunto topológicamente conexo en $\mathbb{R}^k$. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Configurar la optimización de MT5 con pasos discretos regulares (ej. ATR SL de $0.5$ a $2.0$ con paso $0.25$; ATR TP de $1.0$ a $3.0$ con paso $0.25$).<br>2. Filtrar todas las combinaciones que superen el $80\%$ del mejor resultado.<br>3. Verificar visual o algorítmicamente que los puntos formen un bloque geométrico cohesionado. |
| **5. Criterio de Falsabilidad / Validación** | El área de la meseta $\mathcal{M}$ debe abarcar al menos 4 a 6 combinaciones paramétricas continuas adyacentes en la cuadrícula de prueba. |

---

<a id="q-095"></a>

### [Q-095] ¿Cómo se calcula el Baricentro (centro geométrico) de una meseta de estabilidad donde el Sharpe $\ge 0.80 \times \text{Sharpe}_{\max}$?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En lugar de seleccionar los bordes de la meseta (que podrían estar cerca de zonas de degradación) o el punto máximo exacto, el estándar cuantitativo institucional dicta seleccionar el baricentro o centro de gravedad de la meseta. Este punto maximiza la distancia euclidiana hacia los acantilados de pérdidas adyacentes, otorgando al bot el máximo margen de seguridad operativo frente a la deriva del mercado. |
| **2. Evidencia & Fuente Canónica** | *QRT Optimization Protocol (`quant_agentic_swarm/docs/OPTIMIZATION_PROTOCOL.md`)*; *Pardo (2008)*. |
| **3. Rigor Matemático / Algorítmico** | Cálculo del Baricentro Ponderado $\theta_{\text{bari}}$ sobre los $K$ puntos del conjunto $\mathcal{M}$:  
$\theta_{\text{bari}} = \frac{\sum_{i=1}^{K} w_i \cdot \theta_i}{\sum_{i=1}^{K} w_i}$ donde la ponderación es uniforme $w_i = 1$ o proporcional al fitness $w_i = S(\theta_i)$.  
El resultado se redondea a los valores discretos permitidos más cercanos. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Identificar la lista de coordenadas paramétricas $\{\theta_1, \theta_2, \dots, \theta_K\}$ que pertenecen a la meseta verde.<br>2. Calcular la media de los valores de SL y la media de los valores de TP.<br>3. Seleccionar la combinación real del EA más próxima al baricentro calculado como la configuración oficial para producción. |
| **5. Criterio de Falsabilidad / Validación** | La configuración del baricentro exhibe la menor variabilidad de resultados y la menor tasa de degradación cuando se prueba en diferentes periodos o activos correlacionados. |

---

<a id="q-096"></a>

### [Q-096] ¿Qué es la partición *In-Sample* (IS) vs *Out-of-Sample* (OOS) ciega y por qué debe reservarse al menos el 20% más reciente de datos?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | Probar y optimizar un sistema sobre la totalidad de los datos históricos disponibles corrompe la validez del experimento, ya que el algoritmo se ajusta consciente o inconscientemente a la muestra. Reservar una ventana ciega *Out-of-Sample* (mínimo el $20\%$ cronológico más reciente) simula con total pureza cómo se comportará el bot ante datos que nunca conoció durante su diseño y calibración. |
| **2. Evidencia & Fuente Canónica** | *Marcos López de Prado — Advances in Financial Machine Learning (2018)*; *Perry Kaufman — Trading Systems and Methods (2020)*. |
| **3. Rigor Matemático / Algorítmico** | Partición temporal disjunta:  
$T = [t_{\text{start}}, t_{\text{end}}]$  
$\text{IS} = [t_{\text{start}}, t_{\text{split}}]$ con longitud $\ge 80\% \times |T|$  
$\text{OOS} = (t_{\text{split}}, t_{\text{end}}]$ con longitud $\le 20\% \times |T|$ tal que $\text{IS} \cap \text{OOS} = \emptyset$.  
Queda terminantemente prohibido modificar los parámetros tras observar los resultados del OOS. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Si se dispone de datos de 2004 a 2024 (20 años):<br>2. Entrenar y optimizar en el periodo 2004-2020 (16 años = $80\%$).<br>3. Bloquear los parámetros definitivos y ejecutar una única simulación corrida en el periodo 2021-2024 ($20\%$ ciego). |
| **5. Criterio de Falsabilidad / Validación** | Si la curva de capital en el periodo OOS continúa ascendiendo con métricas coherentes con la muestra IS, se valida la existencia de un edge genuino no sobreajustado. |

---

<a id="q-097"></a>

### [Q-097] ¿Qué es el Semáforo de Degradación Paramétrica de Marcos López de Prado y cómo se interpreta matemáticamente?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El rendimiento de un modelo algorítmico en datos reales o fuera de muestra casi siempre decae respecto a su entrenamiento debido a la presencia de fricción y variación de régimen. El Semáforo de Degradación cuantifica formalmente este deterioro porcentual para dictaminar de manera objetiva si la caída de rendimiento es una contracción estadística normal o el colapso total de un modelo ficticio. |
| **2. Evidencia & Fuente Canónica** | *Marcos López de Prado — Advances in Financial Machine Learning (2018)*; *QRT Mandato 4 de Optimización (`quant_agentic_swarm/docs/OPTIMIZATION_PROTOCOL.md`)*. |
| **3. Rigor Matemático / Algorítmico** | Ecuación de Degradación Relativa:  
$\text{Degradación} = \frac{|\text{Sharpe}_{\text{IS}} - \text{Sharpe}_{\text{OOS}}|}{\text{Sharpe}_{\text{IS}}} \times 100\%$.  
**Semáforo Institucional QRT:**  
- $\text{Degradación} \le 30\%$: **Zona Verde (Robusto / Aprobado)**  
- $30\% < \text{Degradación} \le 50\%$: **Zona Amarilla (Alerta / Revisar parámetros)**  
- $\text{Degradación} > 50\%$ o $\text{Sharpe}_{\text{OOS}} < 0.50$: **Zona Roja (Sobreajustado / Descartar)** |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Registrar el Ratio de Sharpe obtenido en la meseta de optimización IS.<br>2. Registrar el Ratio de Sharpe obtenido en el test ciego OOS.<br>3. Aplicar la fórmula del semáforo e incluir el resultado en el `STRATEGY_FACTSHEET.md`. |
| **5. Criterio de Falsabilidad / Validación** | La estrategia se autoriza para paso a cuentas demo/reales únicamente si el resultado cae inequívocamente en la **Zona Verde**. |

---

<a id="q-098"></a>

### [Q-098] ¿Cuándo se debe declarar formalmente nula o sobreajustada una optimización según el estándar institucional QRT?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | En la investigación cuantitativa seria, el $95\%$ de las ideas e hipótesis fracasan. Aceptar el fallo temprano evita el autoengaño y la pérdida de capital real. Declarar una optimización nula es un acto de rigor científico que protege al trader de forzar una estrategia que carece de ventaja estadística en el mercado. |
| **2. Evidencia & Fuente Canónica** | *David Aronson — Evidence-Based Technical Analysis (2006)*; *Robert Pardo (2008)*; *QRT Protocolo Canónico de Optimización*. |
| **3. Rigor Matemático / Algorítmico** | Criterio de Nulidad Ineludible: Una optimización se declara nula si se cumple al menos una de las siguientes condiciones:  
1. $\text{Degradación} > 50\%$.  
2. $\text{Sharpe}_{\text{OOS}} < 0.50$.  
3. El número de trades en OOS es $< 30$.  
4. El Drawdown Máximo en OOS duplica al de la muestra IS. |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Evaluar el checklist de los 4 criterios de nulidad.<br>2. Si se viola alguno, archivar el experimento en la bitácora con etiqueta `ESTRATEGIA DESCARTADA: Sobreajuste detectado`.<br>3. Retornar a la Fase 1 para formular una nueva hipótesis causal desde la base de conocimientos. |
| **5. Criterio de Falsabilidad / Validación** | El investigador no modifica reglas ad-hoc para "salvar" el backtest; se respeta la decisión binaria del protocolo sin excepciones. |

---

<a id="q-099"></a>

### [Q-099] ¿Qué es el Breakeven Elástico y por qué debe gatillarse fuera del área de ruido de apertura del trade?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El Breakeven convencional desplaza prematuramente el Stop Loss al precio de entrada apenas la posición gana unos pocos ticks. Esto interrumpe la formación normal del movimiento, provocando que el ruido aleatorio del mercado cierre el trade a cero justo antes de que se desarrolle la gran tendencia esperada. Un Breakeven *elástico* institucional sólo se activa tras haber recorrido una distancia holgada basada en la volatilidad diaria (ej. $1.0x$ ATR Diario), blindando la posición únicamente cuando el avance ya es maduro. |
| **2. Evidencia & Fuente Canónica** | *Alexander Elder — The New Trading for a Living (2014)*; *Perry Kaufman — Trading Systems and Methods (2020)*. |
| **3. Rigor Matemático / Algorítmico** | Disparador de Breakeven en Bloque 5:  
$\text{Gatillo} = P_{\text{entry}} \pm k_{\text{be}} \times \text{ATR}_D(14)$ con $k_{\text{be}} \ge 0.75$.  
Si el precio de cierre de barra supera el Gatillo:  
$\text{Nuevo SL} = P_{\text{entry}} \pm \text{Buffer}_{\text{fricción}}$ (cubriendo comisiones y spread). |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Declarar los parámetros `InpUseBreakeven = true` y `InpBreakevenTriggerATR = 1.0`.<br>2. En `OnTick()` o en control de nueva barra, verificar si el precio actual ha sobrepasado la barrera de activación.<br>3. Modificar el Stop Loss a través del método `trade.PositionModify()` de MQL5. |
| **5. Criterio de Falsabilidad / Validación** | La tasa de trades ganadores cerrados con beneficio neto positivo aumenta sin perjudicar el Ratio Payoff medio del sistema. |

---

<a id="q-100"></a>

### [Q-100] ¿Cómo se integra el Pool Completo de 3 Módulos de Diagnóstico Cuantitativo en el flujo diario de investigación del trader sistemático?

| Dimensión Científica | Contenido Desarrollado |
| :--- | :--- |
| **1. Tesis / Principio Causal** | El éxito sostenible en el trading cuantitativo no es el resultado de un "bot milagroso", sino de un proceso riguroso y reproducible de auditoría científica continua. La integración del Pool de 3 Módulos (Evaluación Dual Porcentual, Diagnóstico de Asimetrías y Calibración MAE/MFE de Salidas) transforma la toma de decisiones basada en corazonadas en una disciplina institucional respaldada por métricas probabilísticas sólidas. |
| **2. Evidencia & Fuente Canónica** | *QRT Institutional Backtest Audit Manual (`MT5/BACKTEST_AUDIT_MANUAL.md`)*; *David Aronson (2006)*; *Marcos López de Prado (2018)*. |
| **3. Rigor Matemático / Algorítmico** | Flujo de Auditoría Cuantitativa Permanente:  
$$\text{Estrategia} \longrightarrow \underbrace{\text{Módulo 1 (Evaluación Dual \%)}}_{\text{Separar edge real de volumen}} \longrightarrow \underbrace{\text{Módulo 2 (Asimetrías \& Long/Short)}}_{\text{Localizar fuente del edge y consistencia}} \longrightarrow \underbrace{\text{Módulo 3 (MAE/MFE \& Salidas)}}_{\text{Optimizar Stops y robustez}}$$ |
| **4. Protocolo Operativo (Paso a Paso)** | 1. Cada vez que se genere un backtest en MT5 o TradingView, ejecutar el script `generate_percentage_audit_report.py`.<br>2. Analizar sistemáticamente las 3 tablas generadas en el reporte Markdown/HTML.<br>3. Registrar los resultados en `BITACORA.md` y en el `STRATEGY_REGISTRY.json` antes de autorizar cualquier despliegue operativo. |
| **5. Criterio de Falsabilidad / Validación** | El trader dispone de un expediente documental completo, reproducible e inmutable para cada estrategia en cartera, eliminando cualquier sesgo emocional o juicio subjetivo en la asignación de capital. |

---
