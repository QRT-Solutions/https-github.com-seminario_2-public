# LLM Knowledge Map & Agentic Router: Trading Books Corpus

> **Mantenimiento del índice:** QRT Solutions.
> **PROMPT DE INSTRUCCIÓN PARA AGENTES / LLMs:**
> Este archivo es el **Índice Maestro de Enrutamiento Semántico y Optimización de Tokens** para el corpus de 50 documentos de trading en Markdown. 
> **Regla de consumo para el Agente:** 
> 1. **NUNCA cargues libros enteros** a tu ventana de contexto si superan los 50 KB. El corpus completo contiene ~8,2 millones de tokens.
> 2. Consulta primero la **Matriz de Enrutamiento Semántico** (Sección 1) para identificar el archivo autoritativo Tier 1.
> 3. Utiliza herramientas de lectura granular (`grep_search` con los patrones recomendados o `view_file` con rangos de líneas/capítulos) para extraer únicamente los pasajes necesarios.
> 4. Si el concepto es bilingüe (ej. *Gap / Hueco / Desequilibrio*), revisa la columna de términos bilingües antes de buscar.

---

## Estadísticas Globales del Corpus

- **Documentos totales:** 50 documentos en formato Markdown (`.md`).
- **Palabras totales:** ~5.950.000 palabras (~8.200.000 tokens).
- **Idiomas:** Inglés (38 libros), Español (13 libros).
- **Imágenes:** esta copia no contiene `assets/`; las referencias históricas se conservan en los textos.

---

## 1. Matriz de Enrutamiento Semántico (Fast Concept Lookup)

Usa esta tabla para ir directamente al libro correcto según el tema de consulta:

| Concepto / Dominio Operativo | Archivo Autoritativo (Tier 1) | Archivo Secundario (Tier 2) | Patrón Regex / Términos de Búsqueda de Alto Valor |
|---|---|---|---|
| **Estructura de Mercado & Price Action** | `The art and science of technical analysis _ market structure, price action, and trading strategies-J. Wiley  &  Sons  (2012).md` | `3-Reading Price Charts Technical Analysis for Traders.md` | `\b(market structure\|price action\|trend definition\|reversal)\b` |
| **Gaps: Estadística, Fill Rates & Cuantificación** | `7-Trading Systems and Methods Technical Analysis & Strategies.md` | `CMT2016.md` | `\b(gap fill\|opening gap\|exhaustion gap\|breakaway gap)\b` (Kaufman Cap. 15) |
| **Gaps: Sistema Intradía Fade & Reglas ES/YM** | `Dr CS_Mastering the trade_Carter.md` | `10-Building_Winning_Trading_Systems.md` | `\b(Gap Play\|fade the gap\|GapBackFiller\|Pruitt)\b` |
| **Fair Value Gaps (FVG) & Smart Money / ICT** | `9-Smart Money Concept.md` | `Wyckoff 2 ESP PDF.md` | `\b(desequilibrio\|FVG\|área de interés\|AOI\|liquidez)\b` (Español) |
| **Método Wyckoff: Fases A-E, Acumulación/Distribución** | `Wyckoff 2 ESP PDF.md` | `Wyckoff-Method_Wyckoff-Analytics_Spanish-V2.md` | `\b(Spring\|Upthrust\|UTAD\|LPS\|Sign of Strength\|SOS\|Climax)\b` |
| **Volume Profile & Order Flow** | `Wyckoff 2 ESP PDF.md` | `Robert A. Schwartz, John Aidan Byrne, Antoinette Colaninno - Coping With Institutional Order Flow...md` | `\b(Volume Profile\|POC\|VAH\|VAL\|Footprint\|Delta\|Delta acumulado)\b` |
| **VWAP & Anchored VWAP (MIDAS)** | `Bloomberg Financial) Andrew Coles, David Hawkins - MIDAS Technical Analysis...md` | `The art and science of technical analysis...md` | `\b(MIDAS\|VWAP\|Anchored VWAP\|displacement channel\|Rg curve)\b` |
| **Sistemas Cuantitativos, Backtesting & Código** | `10-Building_Winning_Trading_Systems.md` | `15-Richard L. Weissman - Mechanical Trading Systems.md` | `\b(EasyLanguage\|inputs:\|vars:\|System Test\|overfitting\|walk-forward)\b` |
| **Evidence-Based Trading & Minería de Datos** | `11-Algorithmic Trading Systems Data Mining to Live Trading.md` | `Springer Texts in Statistics) René Carmona...md` | `\b(data mining bias\|bootstrap\|hypothesis testing\|Sharpe ratio\|p-value)\b` |
| **Estrategias Cuantitativas Short-Term & Edges Overnight** | `4-Short_Term_Trading_Strategies_That_Work_Larry_Connors,_Cesar_Alvarez.md` | `14-High Probability Trading Steps to Become a Successful Trader.md` | `\b(overnight edge\|TPS strategy\|RSI\(2\)\|2-period RSI\|cumulative RSI)\b` |
| **Análisis Técnico Clásico (Patrones, S/R, Tendencias)** | `technica analysisos stocks trends.md` | `New York Institute of Finance) John J. Murphy - Technical Analysis...md` | `\b(Head and Shoulders\|Support and Resistance\|Trendline\|Triangle)\b` |
| **CMT Curriculum (Certificación Oficial)** | `_ CMT Level I 2020 – An Introduction to Technical Analysis...md` | `CMT2016.md` | `\b(Dow Theory\|Moving Averages\|Momentum Indicators\|Point and Figure)\b` |
| **CANSLIM, Momentum & Rupturas de Bases** | `How to make Money Stocks.md` | `How to Make Money in Stocks Spanish.md` | `\b(CANSLIM\|Cup with Handle\|Pivot Point\|Base count\|RS Line)\b` |
| **VCP (Volatility Contraction) & Superperformance** | `Mark Minervini - Think & Trade Like a Champion...md` | `Momentum Masters.md` | `\b(VCP\|Volatility Contraction Pattern\|Cheat entry\|Trend Template)\b` |
| **Venta en Corto (Short Selling)** | `Kacher, Chris_Morales, Gil_O'Neil, William J - Short selling with the O'Neil disciples...md` | `William J.  O'Neil, Gil Morales - How to Make Money Selling Stocks Short...md` | `\b(Short selling\|BGU\|SGD\|Punchbowl of death\|late-stage base)\b` |
| **Psicología del Trading & Disciplina** | `8-Mark Douglas - Trading en la Zona.md` | `13-Trade Mindfully Psychology for Trading Performance.md` | `\b(probabilidades\|disciplina\|autoengaño\|aceptar el riesgo\|flow)\b` |
| **Gestión Monetaria, Position Sizing & Riesgo** | `Alexander Elder - El Nuevo Vivir del Trading.md` | `The art and science of technical analysis...md` | `\b(Regla del 2%\|Regla del 6%\|Risk of Ruin\|Position Sizing\|R-multiples)\b` |
| **Derivados, Opciones & Griegas** | `Bloomberg Financial) R. Stafford Johnson - Derivatives Markets and Analysis...md` | `Sincere]Understanding Options(rasabourse.com).md` | `\b(Black-Scholes\|Implied Volatility\|Delta\|Gamma\|Vega\|Theta\|Covered Call)\b` |
| **Renta Fija, Bonos & Curvas de Tipos** | `Bloomberg - Fixed Income Securities And Derivatives Handbook...md` | `How_to_Listen_When_Markets_Speak...md` | `\b(Yield curve\|Duration\|Convexity\|Maturity gap\|Bond valuation)\b` |
| **Fibonacci & Geometría de Mercado** | `Bloomberg Financial) Constance Brown - Fibonacci Analysis...md` | `12-Robert Fischer - Candlesticks Fibonacci and Chart Pattern...md` | `\b(Golden Ratio\|Fibonacci Expansion\|Retracement 61.8%\|Fibonacci Cluster)\b` |
| **Estacionalidad, Ciclos & Almanaque** | `Jeffrey A. Hirsch - Stock Trader's Almanac 2024...md` | `Trader Almanc.md` | `\b(Santa Claus Rally\|January Effect\|Best Six Months\|Election Cycle)\b` |
| **Entrevistas a Traders Legendarios (Market Wizards)** | `Jack D. Schwager - Stock Market Wizards...md` | `Jack D. Schwager, Ed Seykota - Hedge Fund Market Wizards...md` | `\b(Interview\|risk management\|trading philosophy\|edge)\b` |

---

## 2. Dossier Detallado de los 51 Libros

### Bloque A: Análisis Técnico, Price Action & Microestructura

#### 1. [`The art and science of technical analysis _ market structure, price action, and trading strategies-J. Wiley  &  Sons  (2012).md`](./The%20art%20and%20science%20of%20technical%20analysis%20_%20market%20structure%2C%20price%20action%2C%20and%20trading%20strategies-J.%20Wiley%20%20%26%20%20Sons%20%20%282012%29.md)
- **Autor:** Adam Grimes (2012) | **Idioma:** EN | **Tamaño:** 1.151 KB (179.738 palabras).
- **Core Edge:** La obra más rigurosa sobre estructura de mercado, ventaja estadística (trading edge), ciclos de volatilidad (expansión/contracción) y psicología probabilística.
- **Capítulos Clave:** Part I (Trader's Edge, Market Structure), Part II (Market Trends, Range Trading), Part III (Short-Term Setups, Managing Gaps Beyond Stops).
- **Términos de búsqueda:** `The Trader's Edge`, `Expectancy`, `Pullback entry`, `Failure test`, `Range Breakout`.

#### 2. [`3-Reading Price Charts Technical Analysis for Traders.md`](./3-Reading%20Price%20Charts%20Technical%20Analysis%20for%20Traders.md)
- **Autor:** Al Brooks (2009) | **Idioma:** EN | **Tamaño:** 821 KB (156.737 palabras).
- **Core Edge:** Price action barra a barra pura en temporalidades intradía (5 min @ES). Señales de entrada barra señal vs barra de entrada, reversiones de apertura y EMA gap bars.
- **Términos de búsqueda:** `High 2`, `Low 2`, `Bar by Bar`, `Opening Reversal`, `Trend from the open`, `Signal bar`.

#### 3. [`technica analysisos stocks trends.md`](./technica%20analysisos%20stocks%20trends.md)
- **Autor:** Robert D. Edwards & John Magee (11ª Edición) | **Idioma:** EN | **Tamaño:** 1.754 KB (264.703 palabras).
- **Core Edge:** La biblia canónica del chartismo clásico. Definición matemática y estructural de tendencias, soporte/resistencia, taxonomía de gaps y volumen.
- **Términos de búsqueda:** `Gaps in the Averages`, `Runaway gap`, `Reversal patterns`, `Consolidation formations`.

#### 4-6. [`Analysis Stock Trends - Tomo I`](./Analysis%20Stock%20Trends%20-%20Robert%20D.%20Edwards%20%26%20John%20Magee%20Tomo%20I.md), [`Tomo II`](./Analysis%20Stock%20Trends%20-%20Robert%20D.%20Edwards%20%26%20John%20Magee%20Tomo%20II.md), [`Tomo III.md`](./Analysis%20Stock%20Trends%20-%20Robert%20D.%20Edwards%20%26%20John%20Magee%20Tomo%20III.md)
- **Autor:** Edwards & Magee (Traducción al Español) | **Tamaño:** 285 KB, 266 KB, 417 KB.
- **Nota LLM:** Usar el término bilingüe `"hueco"` para gaps (ej. Tomo II usa "hueco" 208 veces). Para análisis técnico puro, la versión en inglés (`technica analysisos stocks trends.md`) es más precisa.

#### 7. [`New York Institute of Finance) John J. Murphy - Technical Analysis of the Financial Markets...md`](./New%20York%20Institute%20of%20Finance%29%20John%20J.%20Murphy%20-%20Technical%20Analysis%20of%20the%20Financial%20Markets_%20A%20Comprehensive%20Guide%20to%20Trading%20Methods%20and%20Applications%20%28New%20York%20Institute%20of%20Finance%29-New%20York%20Institu.md)
- **Autor:** John J. Murphy (NYIF) | **Idioma:** EN | **Tamaño:** 950 KB (125.866 palabras).
- **Core Edge:** Manual estándar de análisis técnico, osciladores, medias móviles, gráficos de velas y análisis intermercado.

#### 8-10. [`CMT2016.md`](./CMT2016.md) y [`_ CMT Level I 2020...md`](./_%20CMT%20Level%20I%202020%20%E2%80%93%20An%20Introduction%20to%20Technical%20Analysis_Wiley%20%282020%29%20%281%29_compressed.md)
- **Autor:** Wiley / CMT Association | **Idioma:** EN | **Tamaño:** 1.909 KB (276.394 pal.) y 1.675 KB (239.083 pal.).
- **Core Edge:** Texto oficial del Chartered Market Technician. Contiene capítulos de Thomas Bulkowski (estadística de patrones), Crabel opening range (NR4/NR7) y Mark Fisher ACD.

#### 11-12. [`Wyckoff 2 ESP PDF.md`](./Wyckoff%202%20ESP%20PDF.md) y [`Wyckoff-Method_Wyckoff-Analytics_Spanish-V2.md`](./Wyckoff-Method_Wyckoff-Analytics_Spanish-V2.md)
- **Autor:** Rubén Villahermosa / Wyckoff Analytics | **Idioma:** ES | **Tamaño:** 372 KB y 51 KB.
- **Core Edge:** Explicación moderna del Método Wyckoff fusionado con **Volume Profile**, **Order Flow**, Delta acumulado y desequilibrios. Guía paso a paso de esquemáticas de acumulación y distribución.

#### 13. [`9-Smart Money Concept.md`](./9-Smart%20Money%20Concept.md)
- **Autor:** Anónimo / Escuela ICT-SMC | **Idioma:** ES | **Tamaño:** 85 KB (12.287 palabras).
- **Core Edge:** Único texto del corpus enfocado en Fair Value Gaps (FVG), liquidez institucional, Order Blocks y mitigación de desequilibrios en temporalidades de 1 hora o superiores.

---

### Bloque B: Sistemas Cuantitativos, Algoritmos & Código

#### 14. [`7-Trading Systems and Methods Technical Analysis & Strategies.md`](./7-Trading%20Systems%20and%20Methods%20Technical%20Analysis%20%26%20Strategies.md)
- **Autor:** Perry J. Kaufman (5ª Edición) | **Idioma:** EN | **Tamaño:** 2.193 KB (400.357 palabras).
- **Core Edge:** La enciclopedia cuantitativa más completa del mercado. Filtros de ruido, medias adaptativas (KAMA), testing riguroso, fill rates de gaps (Cap. 15), estacionalidad y optimización de carteras.

#### 15. [`10-Building_Winning_Trading_Systems.md`](./10-Building_Winning_Trading_Systems.md)
- **Autor:** George Pruitt & John R. Hill | **Idioma:** EN | **Tamaño:** 755 KB (126.727 palabras).
- **Core Edge:** Código fuente ejecutable en **EasyLanguage** para TradeStation/MultiCharts. Incluye sistemas de seguimiento de tendencia, reversión a la media y el sistema `GapBackFiller`.

#### 16. [`11-Algorithmic Trading Systems Data Mining to Live Trading.md`](./11-Algorithmic%20Trading%20Systems%20Data%20Mining%20to%20Live%20Trading.md)
- **Autor:** David Aronson | **Idioma:** EN | **Tamaño:** 479 KB (81.042 palabras).
- **Core Edge:** Metodología científica para evitar el sobreajuste (overfitting) y el sesgo de minería de datos mediante remuestreo bootstrap y pruebas estadísticas de significancia.

#### 17. [`15-Richard L. Weissman - Mechanical Trading Systems.md`](./15-Richard%20L.%20Weissman%20-%20Mechanical%20Trading%20Systems.md)
- **Autor:** Richard L. Weissman | **Idioma:** EN | **Tamaño:** 426 KB (72.315 palabras).
- **Core Edge:** Diseño de sistemas mecánicos, métricas de drawdown, volatilidad de retornos y ajuste psicológico a las pérdidas sistemáticas.

#### 18. [`16-EasyLanguage Essentials.md`](./16-EasyLanguage%20Essentials.md)
- **Autor:** George Pruitt | **Idioma:** EN | **Tamaño:** 243 KB (38.910 palabras).
- **Core Edge:** Manual práctico de sintaxis EasyLanguage: variables, estructuras de control, órdenes de mercado, stop/limit y funciones personalizadas.

#### 19. [`4-Short_Term_Trading_Strategies_That_Work_Larry_Connors,_Cesar_Alvarez.md`](./4-Short_Term_Trading_Strategies_That_Work_Larry_Connors%2C_Cesar_Alvarez.md)
- **Autor:** Larry Connors & Cesar Alvarez | **Idioma:** EN | **Tamaño:** 144 KB (25.992 palabras).
- **Core Edge:** Estrategias cuantitativas cuantificadas sobre SPY/QQQ: TPS strategy, RSI de 2 periodos, compras por debajo del soporte de 5 días y efecto overnight.

#### 20. [`Bloomberg Financial) Andrew Coles, David Hawkins - MIDAS Technical Analysis...md`](./Bloomberg%20Financial%29%20Andrew%20Coles%2C%20David%20Hawkins%20-%20MIDAS%20Technical%20Analysis_%20A%20VWAP%20Approach%20to%20Trading%20and%20Investing%20in%20Today%27s%20Markets-Bloomberg%20Press%20%282012%29.md)
- **Autor:** Andrew Coles & David Hawkins (Bloomberg Press) | **Idioma:** EN | **Tamaño:** 915 KB (140.049 palabras).
- **Core Edge:** Tratado exhaustivo de la metodología MIDAS (Market Interpretation/Data Analysis System) y VWAP Anclado (Anchored VWAP) desde eventos clave.

#### 21. [`Springer Texts in Statistics) René Carmona (auth.) - Statistical Analysis of Financial Data in R...md`](./Springer%20Texts%20in%20Statistics%29%20Rene%CC%81%20Carmona%20%28auth.%29%20-%20Statistical%20Analysis%20of%20Financial%20Data%20in%20R-Springer-Verlag%20New%20York%20%282014%29.md)
- **Autor:** René Carmona (Springer) | **Idioma:** EN | **Tamaño:** 1.484 KB (218.684 palabras).
- **Core Edge:** Modelado econométrico y estadístico en R: series temporales GARCH, cópulas, colas pesadas (fat tails), análisis de componentes principales (PCA) y optimización de portafolios.

---

### Bloque C: Operativa Intradía, Swing & Setups

#### 22. [`Dr CS_Mastering the trade_Carter.md`](./Dr%20CS_Mastering%20the%20trade_Carter.md)
- **Autor:** John F. Carter (3ª Edición) | **Idioma:** EN | **Tamaño:** 1.043 KB (186.976 palabras).
- **Core Edge:** Guía operativa de referencia en futuros (@ES, @YM) y opciones. Sistema Squeeze (Bollinger/Keltner), estrategias de Gap Fade completas, reglas de pre-market y VIX.

#### 23. [`14-High Probability Trading Steps to Become a Successful Trader.md`](./14-High%20Probability%20Trading%20Steps%20to%20Become%20a%20Successful%20Trader.md)
- **Autor:** Marcel Link | **Idioma:** EN | **Tamaño:** 777 KB (137.915 palabras).
- **Core Edge:** Gestión de riesgo para evitar pérdidas catastróficas, ratio riesgo/beneficio mínimo 2:1, filtros de tendencia y trading con noticias.

#### 24. [`5-Day Trading Beat the System & Make Money.md`](./5-Day%20Trading%20Beat%20the%20System%20%26%20Make%20Money.md)
- **Autor:** Martin J. Pring | **Idioma:** EN | **Tamaño:** 361 KB (61.189 palabras).
- **Core Edge:** Estrategias de day trading con osciladores, medias móviles y patrones intradía sencillos.

#### 25. [`1A_technical_tutorial_de (1).md`](./1A_technical_tutorial_de%20%281%29.md)
- **Autor:** Guía Técnica | **Idioma:** EN | **Tamaño:** 72 KB (12.441 palabras).
- **Core Edge:** Resumen conciso de indicadores técnicos estándar y reglas de gatillo.

---

### Bloque D: CANSLIM, Momentum & Short Selling

#### 26-27. [`How to make Money Stocks.md`](./How%20to%20make%20Money%20Stocks.md) y [`How to Make Money in Stocks Spanish.md`](./How%20to%20Make%20Money%20in%20Stocks%20Spanish.md)
- **Autor:** William J. O'Neil | **Idioma:** EN / ES | **Tamaño:** 957 KB / 973 KB (~155k palabras).
- **Core Edge:** Sistema **CANSLIM** completo para acciones líderes de alto crecimiento: beneficios trimestrales (C), anuales (A), nuevos productos/máximos (N), oferta/demanda (S), liderazgo de sector (L), respaldo institucional (I) y dirección del mercado (M). Patrón Cup-with-Handle y líneas de fuerza relativa (RS).

#### 28. [`Mark Minervini - Think & Trade Like a Champion...md`](./Mark%20Minervini%20-%20Think%20%26%20Trade%20Like%20a%20Champion-Access%20Publishing%20Group%20%282017%29.md)
- **Autor:** Mark Minervini (2017) | **Idioma:** EN | **Tamaño:** 414 KB (72.223 palabras).
- **Core Edge:** Modelo SEPA (Specific Entry Point Analysis), patrón **VCP (Volatility Contraction Pattern)**, gestión matemática de ratios de ganancia/pérdida y trailing stops progresivos.

#### 29. [`Momentum Masters.md`](./Momentum%20Masters.md)
- **Autor:** Mark Minervini, David Ryan, Dan Zanger, Mark Ritchie II | **Idioma:** EN | **Tamaño:** 275 KB (50.675 palabras).
- **Core Edge:** Formato Q&A directo con 4 campeones de trading de EEUU. Reglas de entrada ante gap-up (+5% Zanger), gestión de pérdidas y dimensionamiento de posición.

#### 30. [`Minervini Mindset Secrets.md`](./Minervini%20Mindset%20Secrets.md)
- **Autor:** Mark Minervini | **Idioma:** EN | **Tamaño:** 464 KB (80.142 palabras).
- **Core Edge:** Psicología de alto rendimiento, mentalidad ganadora, eliminación de creencias limitantes y preparación mental para drawdown.

#### 31. [`Kacher, Chris_Morales, Gil_O'Neil, William J - Short selling with the O'Neil disciples...md`](./Kacher%2C%20Chris_Morales%2C%20Gil_O%27Neil%2C%20William%20J%20-%20Short%20selling%20with%20the%20O%27Neil%20disciples_%20turn%20to%20the%20dark%20side%20of%20trading-Wiley%20%282015%29.md)
- **Autor:** Chris Kacher & Gil Morales | **Idioma:** EN | **Tamaño:** 595 KB (83.400 palabras).
- **Core Edge:** Guía definitiva de venta en corto (short selling) de acciones en mercado bajista: taxonomía BGU (Big Gap Up failure) y SGD (Stalled Gap Down), figuras punchbowl y reglas de cobertura.

#### 32. [`William J.  O'Neil, Gil Morales - How to Make Money Selling Stocks Short...md`](./William%20J.%20%20O%27Neil%2C%20Gil%20Morales%20-%20How%20to%20Make%20Money%20Selling%20Stocks%20Short-Wiley%20%282004%29.md)
- **Autor:** William J. O'Neil & Gil Morales | **Idioma:** EN | **Tamaño:** 181 KB (27.335 palabras).
- **Core Edge:** Modelos visuales de patrones de distribución para ventas cortas: rotura de soportes, bases tardías (3ª y 4ª etapa) y fallos de clímax.

---

### Bloque E: Psicología del Trading & Disciplina

#### 33-34. [`Alexander Elder - El Nuevo Vivir del Trading.md`](./Alexander%20Elder%20-%20El%20Nuevo%20Vivir%20del%20Trading.md)
- **Autor:** Dr. Alexander Elder | **Idioma:** ES | **Tamaño:** 798 KB (131.608 palabras).
- **Core Edge:** Las 3 M del trading (Mente, Método, Manejo del Dinero). El Sistema de Triple Pantalla (Triple Screen), el indicador Impulso (Elder Impulse System) y la regla del 2% y 6%.

#### 35. [`8-Mark Douglas - Trading en la Zona.md`](./8-Mark%20Douglas%20-%20Trading%20en%20la%20Zona.md)
- **Autor:** Mark Douglas | **Idioma:** ES | **Tamaño:** 467 KB (78.361 palabras).
- **Core Edge:** La obra maestra sobre el pensamiento probabilístico. Las 5 verdades fundamentales del mercado, eliminación del miedo y ejecución impecable sin sesgos emocionales.

#### 36. [`13-Trade Mindfully Psychology for Trading Performance.md`](./13-Trade%20Mindfully%20Psychology%20for%20Trading%20Performance.md)
- **Autor:** Dr. Gary Dayton | **Idioma:** EN | **Tamaño:** 800 KB (134.120 palabras).
- **Core Edge:** Aplicación de la Terapia de Aceptación y Compromiso (ACT) y Mindfulness al trading: control de impulsos emocionales y toma de decisiones bajo presión.

---

### Bloque F: Entrevistas & Market Wizards

#### 37. [`Jack D. Schwager - Stock Market Wizards...md`](./Jack%20D.%20Schwager%20-%20Stock%20Market%20Wizards_%20Interviews%20with%20America%27s%20Top%20Stock%20Traders-HarperBusiness%20%282001%29.md)
- **Autor:** Jack D. Schwager | **Idioma:** EN | **Tamaño:** 759 KB (126.985 palabras).
- **Core Edge:** Entrevistas a traders de acciones legendarios (Stuart Walton, Michael Lauer, Steve Cohen, etc.). Enfoque en flexibilidad mental y control estricto de riesgos.

#### 38. [`Jack D. Schwager, Ed Seykota - Hedge Fund Market Wizards...md`](./Jack%20D.%20Schwager%2C%20Ed%20Seykota%20-%20Hedge%20Fund%20Market%20Wizards-Wiley%20%282012%29.md)
- **Autor:** Jack D. Schwager | **Idioma:** EN | **Tamaño:** 1.036 KB (173.303 palabras).
- **Core Edge:** Entrevistas a gestores de macro hedge funds, trading sistemático, materias primas y renta variable (Ray Dalio, Colm O'Shea, Ed Thorp, etc.).

---

### Bloque G: Microestructura, Opciones & Derivados

#### 39. [`Robert A. Schwartz et al. - Coping With Institutional Order Flow...md`](./Robert%20A.%20Schwartz%2C%20John%20Aidan%20Byrne%2C%20Antoinette%20Colaninno%20-%20Coping%20With%20Institutional%20Order%20Flow%20%28Zicklin%20School%20of%20Business%20Financial%20Markets%20Series%29%20%282005%29.md)
- **Autor:** Robert A. Schwartz (Baruch College) | **Idioma:** EN | **Tamaño:** 465 KB (75.983 palabras).
- **Core Edge:** Actas académicas sobre impacto de mercado, costes de ejecución institucional, fragmentación de liquidez y libros de órdenes (mercados europeos).

#### 40. [`Bloomberg - Fixed Income Securities And Derivatives Handbook...md`](./Bloomberg%20-%20Fixed%20Income%20Securities%20And%20Derivatives%20Handbook%20Analysis%20And%20Valuation%20%28Choudry%2C%20Cfa%20Level%202%29-Bloomberg.md)
- **Autor:** Moorad Choudhry | **Idioma:** EN | **Tamaño:** 694 KB (102.390 palabras).
- **Core Edge:** Valoración de bonos, estructura temporal de tipos de interés, spreads de crédito, repo y derivados de renta fija.

#### 41. [`Bloomberg Financial) R. Stafford Johnson - Derivatives Markets and Analysis...md`](./Bloomberg%20Financial%29%20R.%20Stafford%20Johnson%20-%20Derivatives%20Markets%20and%20Analysis-Bloomberg%20Press%20%282017%29.md)
- **Autor:** R. Stafford Johnson | **Idioma:** EN | **Tamaño:** 2.202 KB (294.120 palabras).
- **Core Edge:** Tratado integral de futuros, forwards, swaps y opciones (Black-Scholes, árboles binomiales, griegas y estrategias de cobertura complejas).

#### 42. [`Sincere]Understanding Options(rasabourse.com).md`](./Sincere%5DUnderstanding%20Options%28rasabourse.com%29.md)
- **Autor:** Michael Sincere | **Idioma:** EN | **Tamaño:** 529 KB (88.082 palabras).
- **Core Edge:** Guía práctica para principiantes e intermedios: compra/venta de Calls y Puts, Covered Calls, spreads y gestión del decaimiento temporal (Theta).

#### 43. [`How_to_Listen_When_Markets_Speak_-_Lawrence_G_McDonald (1).md`](./How_to_Listen_When_Markets_Speak_-_Lawrence_G_McDonald%20%281%29.md)
- **Autor:** Lawrence G. McDonald | **Idioma:** EN | **Tamaño:** 533 KB (88.940 palabras).
- **Core Edge:** Análisis macroeconómico, riesgo de crédito, indicadores de liquidez interbancaria y detección de puntos de inflexión sistémicos.

#### 44-45. [`Jeffrey A. Hirsch - Stock Trader's Almanac 2024...md`](./Jeffrey%20A.%20Hirsch%20-%20Stock%20Trader%27s%20Almanac%202024%20%28Almanac%20Investor%20Series%29-Wiley%20%282023%29.md) y [`Trader Almanc.md`](./Trader%20Almanc.md)
- **Autor:** Jeffrey A. Hirsch (2024) | **Idioma:** EN | **Tamaño:** 1.204 KB (125.646 palabras).
- **Core Edge:** Datos estadísticos de estacionalidad en Wall Street: pautas por día de la semana, pautas mensuales, ciclo presidencial de 4 años y rallies estacionales.

---

### Bloque H: Fibonacci, Geometría & Matemáticas

#### 46. [`Bloomberg Financial) Constance Brown - Fibonacci Analysis...md`](./Bloomberg%20Financial%29%20Constance%20Brown%20-%20Fibonacci%20Analysis%20-Bloomberg%20Press%20%282008%29.md)
- **Autor:** Constance Brown (Bloomberg Press) | **Idioma:** EN | **Tamaño:** 239 KB (38.870 palabras).
- **Core Edge:** Aplicación profesional de ratios de Fibonacci en osciladores (RSI compuesto), clusters de tiempo/precio y ondas correctivas.

#### 47. [`12-Robert Fischer - Candlesticks Fibonacci and Chart Pattern Trading Tools.md`](./12-Robert%20Fischer%20-%20Candlesticks%20Fibonacci%20and%20Chart%20Pattern%20Trading%20Tools.md)
- **Autor:** Robert Fischer & Jens Fischer | **Idioma:** EN | **Tamaño:** 359 KB (51.240 palabras).
- **Core Edge:** Combinación de patrones de velas japonesas, proyecciones de Fibonacci en 3 puntos y reglas de confirmación geométrica.

#### 48. [`George MacLean - Fibonacci and Gann Applications in Financial Markets...md`](./George%20MacLean%20-%20Fibonacci%20and%20Gann%20Applications%20in%20Financial%20Markets_%20Practical%20Applications%20of%20Natural%20and%20Synthetic%20Ratios%20in%20Technical%20Analysis-Wiley%20%282005%29.md)
- **Autor:** George MacLean (Wiley) | **Idioma:** EN | **Tamaño:** 513 KB (78.320 palabras).
- **Core Edge:** Integración de abanicos y ángulos de W.D. Gann con extensiones y retrocesos de Fibonacci.

#### 49. [`Dr CS_The Golden Ratio_ The Divine Beauty of Mathematics-Race Point Publishing (2018).md`](./Dr%20CS_The%20Golden%20Ratio_%20The%20Divine%20Beauty%20of%20Mathematics-Race%20Point%20Publishing%20%282018%29.md)
- **Autor:** Rafael Araujo / Dr CS | **Idioma:** EN | **Tamaño:** 294 KB (45.120 palabras).
- **Core Edge:** Fundamentos geométricos y matemáticos del número áureo ($\Phi = 1.618$), espirales y proporciones naturales.

#### 50. [`Springer Texts in Education) Opher Liba, Bat-Sheva Ilany - From the Golden Rectangle to the Fibonacci Sequences...md`](./Springer%20Texts%20in%20Education%29%20Opher%20Liba%2C%20Bat-Sheva%20Ilany%20-%20From%20the%20Golden%20Rectangle%20to%20the%20Fibonacci%20Sequences-Springer%20%282023%29.md)
- **Autor:** Opher Liba & Bat-Sheva Ilany (Springer) | **Idioma:** EN | **Tamaño:** 284 KB (42.898 palabras).
- **Core Edge:** Texto formal sobre la derivación algebraica de las sucesiones de Fibonacci y rectángulos áureos.

---

## 3. Tabla de Resolución de Duplicados (Token Saver)

Si buscas alguno de estos títulos, **utiliza únicamente la versión preferida** para evitar redundancias de lectura:

| Título / Contenido | Versión Preferida (Usar esta) | Versión Duplicada (Ignorar) | Motivo |
|---|---|---|---|
| **CMT Level I 2016** | `CMT2016.md` | `Dr CS_Mkt Tech Assoc - CMT Level I 2016...md` | Idénticos (276.394 pal.). |
| **Mastering the Trade (Carter)** | `Dr CS_Mastering the trade_Carter.md` | `John F Carter - Mastering the Trade, Third Edition...md` | Idénticos (186.976 pal.). |
| **Stock Trader's Almanac 2024** | `Jeffrey A. Hirsch - Stock Trader's Almanac 2024...md` | `Trader Almanc.md` | Idénticos (125.646 pal.). |
| **El Nuevo Vivir del Trading** | `Alexander Elder - El Nuevo Vivir del Trading.md` | `6-Alexander Elder - El Nuevo Vivir del Trading.md` | La versión preferida tiene tablas estructuradas (78 tablas). |
