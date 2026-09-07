# Guion Maestro: Masterclass de Diseño y Creación de Estrategias Cuantitativas

**Duración estimada:** 45 - 60 minutos  
**Atajos de teclado:** ` / ` o `Espacio` (navegar), `N` (abrir guion integrado), `O` (índice general), `F` (pantalla completa).

---

## ESTRUCTURA GENERAL DE LA SESIÓN

| # | Slide | Bloque Temático | Tiempo Sugerido |
|---|---|---|---|
| 01 | Portada: Diseño de Estrategias | Bienvenida & Visión Sistémica | 3 min |
| 02 | Anatomía de una Estrategia | Los 5 Componentes Interconectados | 4 min |
| 03 | 1.1 Entradas: Test de la Frase Única | Hipótesis Causal ($X \rightarrow Y \text{ porque } Z$) | 5 min |
| 04 | Tipos de Entrada: Ejemplos Visuales | Medias Móviles, Breakouts y Velas | 5 min |
| 05 | Entrada por Calendario: Lunes | Peligro de Minería & $p$-hacking | 4 min |
| 06 | 1.1 Costo de Cada Condición | Reducción de Muestra y Grados de Libertad | 4 min |
| 07 | 1.2 Salidas: Redistribución del Edge | Expectancy, Win Rate y 3 Curvas de Equity | 6 min |
| 08 | Las 4 Salidas: Didáctica | Tiempo, Stop/Target, Reversa e Invalidación | 7 min |
| 09 | Excursiones: MAE y MFE por Trade | Calibración Empírica de Stops y Targets | 5 min |
| 10 | Optimización: Meseta vs Pico Aislado | Robustez Paramétrica en Vecindarios | 5 min |
| 11 | Gestión del Riesgo: Sizing | Fixed vs Reinversión vs Apalancamiento | 5 min |
| 12 | Validación: In-Sample vs Out-of-Sample | Detección de Sobreajuste vs Edge Real | 5 min |
| 13 | Cierre & Regla Final | Los 3 Mandamientos del Trader Cuantitativo | 3 min |

---

## SLIDE 01 — PORTADA: DISEÑO Y CREACIÓN DE ESTRATEGIAS
**Tag:** `PROCESO ITERATIVO`  
**Título:** Diseño y Creación de Estrategias  
**Subtítulo:** *De la hipótesis económica a la ejecución robusta: entendiendo el origen del edge, la distribución de salidas y la validación libre de sesgos.*

### Lo que dices al arrancar (Frame de Apertura):
> "Buenas tardes a todos y bienvenidos. Hoy no venimos a hablar de 'fórmulas mágicas' ni del último indicador que encontraron en YouTube. 
> 
> Venimos a desarmar la ingeniería real detrás de una estrategia algorítmica robusta. Vivimos en una era donde la inteligencia artificial y los optimizadores automáticos pueden generar 10.000 curvas de equity perfectas en diez minutos. El problema es que el 99% de esas curvas explotan apenas tocan dinero real.
> 
> En esta sesión vamos a aprender a construir sistemas cuantitativos que sobrevivan al mercado real, entendiendo que una estrategia no es una simple señal de compra o venta, sino un ciclo de 5 componentes interdependientes."

### Lo que muestras en pantalla:
- Anillo orbital animado con los 5 nodos del ciclo cuantitativo: **1. Hipótesis $\rightarrow$ 2. Entrada $\rightarrow$ 3. Salida $\rightarrow$ 4. Sizing $\rightarrow$ 5. Validación**.
- Resalta el concepto de **proceso iterativo**: no es un camino lineal donde termina la validación y te olvidas, sino un laboratorio de investigación continua.

---

## SLIDE 02 — ANATOMÍA DE UNA ESTRATEGIA ALGORÍTMICA
**Tag:** `ANTES DE EMPEZAR — EL MAPA COMPLETO`  
**Título:** Anatomía de una Estrategia Algorítmica  
**Subtítulo:** *Una estrategia no es "una señal que funciona". Es un sistema de 5 componentes que interactúan. Si diseñas uno sin pensar en los otros, el sistema falla.*

### Lo que dices:
> "Antes de hablar de cómo entrar al mercado, necesitamos el mapa completo. Un error amateur clásico es creer que una estrategia es 'cuando el RSI cruza 30 compro'. Eso es apenas una regla de entrada aislada.
> 
> Un sistema profesional consta de cinco bloques que deben encajar a la perfección:"

### Los 5 Componentes:
1. **Hipótesis:** La razón económica o estructural de por qué existe una ineficiencia explotable. Sin esto, solo haces minería de ruido.
2. **Entrada:** La condición técnica o matemática que traduce la hipótesis en una orden ejecutable.
3. **Salida:** Cuándo y cómo sales (por tiempo, precio o invalidación). Define la distribución completa de tus retornos.
4. **Sizing (Dimensionamiento):** Cuánto capital arriesgas por trade. Es el puente entre tener un edge y no quebrar la cuenta.
5. **Validación:** El filtro de fuego (Walk-Forward, Out-of-Sample, robustez paramétrica) que demuestra si el sistema tiene edge real o fue casualidad histórica.

### Preguntas para interactuar con la audiencia:
- **¿Es un proceso lineal?**  
  *"En la fase de diseño es secuencial: no puedes definir un stop sin saber dónde entraste. Pero en la práctica está lleno de bucles de retroalimentación: si la validación falla, el feedback te obliga a reformular la hipótesis o simplificar la entrada."*
- **¿Hay una etapa más crítica que las demás?**  
  *"Absolutamente: **la Hipótesis**. Si la hipótesis es falsa, no existe optimizador, ni trailing stop, ni fórmula de Kelly que salve la cuenta."*

---

## SLIDE 03 — 1.1 ENTRADAS: EL TEST DE LA FRASE ÚNICA
**Tag:** `BLOQUE 1.1 — TIPOS DE ENTRADA (5 MIN)`  
**Título:** ¿Por qué crees que el precio se va a mover?

### Lo que dices:
> "Una entrada es una hipótesis sobre el comportamiento humano o institucional, no un botón mágico. Si no puedes explicar en una sola frase por qué el mercado se moverá a tu favor y qué demostraría que estás equivocado, no tienes una estrategia: tienes una creencia."

### La Fórmula del Test de la Frase Única:
$$\mathbf{\text{“Cuando pasa } X\text{, espero que el precio haga } Y\text{, porque } Z\text{.”}}$$

### Demostración interactiva en vivo (Haz clic en los 3 casos):
1. **Caso 1: Salto de Precio (Gap):**  
   - $X$: Apertura con salto fuerte respecto al cierre anterior.  
   - $Y$: El precio regresa a rellenar el gap.  
   - $Z$: Los market makers y operadores institucionales reequilibran inventarios tras la sesión overnight.  
   - *Veredicto:* ** Hipótesis Válida y Estructural.**
2. **Caso 2: Fin de Mes (Fondos):**  
   - $X$: Últimos dos días del mes bursátil al cierre.  
   - $Y$: Presión compradora en acciones líderes.  
   - $Z$: Rebalanceo pasivo mandated de fondos de pensiones y ETFs que reciben flujos obligatorios de nóminas.  
   - *Veredicto:* ** Flujo Real e Inelástico.**
3. **Caso 3: Indicador Mágico (RSI / Cruce sin causa):**  
   - $X$: El oscilador cae debajo de 20.  
   - $Y$: El precio sube de inmediato.  
   - $Z$: *[VACÍO / NO EXISTE]*  
   - *Veredicto:* ** Sin Razón Estructural.** *"Un oscilador no pone órdenes de compra en el libro. Si buscas combinaciones mágicas sin un $Z$ económico, el mercado te cobrará caro en vivo."*

---

## SLIDE 04 — TIPOS DE ENTRADA: EJEMPLOS VISUALES
**Tag:** `TIPOS DE ENTRADA — EJEMPLOS`  
**Título:** ¿Cómo se ve cada tipo de entrada?

### Lo que dices al alternar las pestañas (a, b, c):
> "Veamos cómo se traducen las entradas en gráficos y qué riesgos ocultos trae cada enfoque."

### Recorrido por pestañas:
- **Pestaña A — Cruce de Medias Móviles (MA 20 vs MA 50):**  
  - *Hipótesis:* La aceleración del precio de corto plazo supera el promedio de mediano plazo (cambio de régimen / momentum).  
  - * El peligro del sobreajuste:* ¿Por qué 20 y 50? ¿Por qué no 21 y 55 o 9 y 26? Cada parámetro libre es una puerta abierta a la sobreoptimización. Además, en mercados en rango genera pérdidas por 'whipsaw' constante.
- **Pestaña B — Nivel y Breakout (High previo / Resistencia):**  
  - *Hipótesis:* Detrás de los máximos previos descansan clusters masivos de órdenes stop-loss y breakout traders. Al perforar el nivel, la liquidez forzada desata una aceleración direccional.  
  - * La gran ventaja:* **Cero parámetros libres arbitrarios.** El High de ayer o el precio de apertura de Nueva York son niveles objetivos del mercado que todos ven por igual.  
  - * Riesgo:* Trampas de liquidez (fakeouts) si no hay volumen ni catalizador macro.
- **Pestaña C — Three White Soldiers (Patrón de Velas):**  
  - *Hipótesis:* Tres velas alcistas consecutivas cerrando en máximos reflejan absorción total de la oferta.  
  - * La trampa del Timeframe:* En velas de 5 minutos ves tres soldados blancos; en gráfico de 15 minutos es solo una vela común. El patrón es un artefacto de la discretización temporal que tú elegiste arbitrariamente.  
  - * Riesgo de sobreextensión:* Al entrar al cierre de la tercera vela, compras en máximos locales y el stop técnico queda lejísimos.

---

## SLIDE 05 — ENTRADA POR CALENDARIO: COMPRAR LOS LUNES
**Tag:** `ENTRADA POR CALENDARIO — PELIGRO: P-HACKING`  
**Título:** Estrategia: Comprar los Lunes

### Lo que dices:
> "Las anomalías de calendario son famosas: 'comprar los lunes', 'el rally de Santa Claus', 'el efecto fin de mes'. Pero también son la trampa predilecta del $p$-hacking.
> 
> Si tomas una base de datos de un activo financiero y combinas 5 días de la semana $\times$ 12 meses $\times$ 24 horas del día, tienes miles de combinaciones posibles. Por pura probabilidad estadística, **puedes encontrar por azar una combinación con beneficios pasados**. Eso no es un edge: es minería de datos."

### La Regla de Oro para Estacionalidad:
- Si el patrón surge de un mandato institucional real (ej. rebalanceo regulatorio de carteras, liquidación de futuros el tercer viernes de mes), es un edge sólido.
- **La explicación estructural debe existir antes de mirar los datos**, jamás inventada a posteriori para justificar un gráfico bonito.

---

## SLIDE 06 — 1.1 COSTO DE CADA CONDICIÓN
**Tag:** `SOBREAJUSTE & SIGNIFICANCIA ESTADÍSTICA`  
**Título:** El Costo de Cada Condición

### Lo que dices:
> "Cada filtro adicional que le agregas a tu estrategia para 'evitar trades malos' tiene un precio oculto brutal: **te destruye el tamaño de la muestra**."

### Demostración interactiva con los filtros en pantalla:
- **Base sin filtros:** 400 trades $\rightarrow$ *Muestra estadísticamente robusta*.
- **+ Filtro 1 (Solo los lunes):** Quedan 100 trades ($-75\%$).
- **+ Filtro 2 (ATR cuartil bajo):** Quedan 40 trades ($-60\%$).
- **+ Filtro 3 (RSI sobrevendido):** Quedan 20 trades ($-50\%$).
- **+ Filtro 4 (SPY premarket positivo):** Quedan 12 trades.

> *"Con 12 o 30 trades no tienes significancia estadística de nada. Tienes una anécdota histórica con una equity curve sobreajustada. Si tu estrategia necesita 5 filtros para no perder dinero en el backtest, la estrategia no sirve."*

### Regla Operativa:
$$\text{Ratio de Confianza} = \frac{\text{Número total de trades}}{\text{Número de condiciones/parámetros libres}}$$
*Si el ratio cae por debajo de 50-100 trades por parámetro libre, desconfía de inmediato.*

---

## SLIDE 07 — 1.2 SALIDAS: REDISTRIBUCIÓN DEL EDGE
**Tag:** `BLOQUE 1.2 — LA SALIDA (6 MIN)`  
**Título:** La Salida Define el Resultado

### Lo que dices:
> "La gran mayoría de los traders retail vive obsesionada con perfeccionar la entrada. Creen que ganar dinero depende de tener una tasa de acierto del 70% u 80%. 
> 
> La realidad cuantitativa es contundente: **la entrada solo decide cuántas veces aciertas; la salida decide cuánto ganas cuando aciertas y cuánto devuelves cuando fallas.**"

### La Ecuación de Expectancy (Esperanza Matemática):
$$\mathbf{\text{Expectancy} = (\text{Win Rate} \times \text{Ganancia Media}) - (\text{Loss Rate} \times \text{Pérdida Media})}$$

### Comparativa de las 3 Curvas de Equity (Misma Entrada, 3 Salidas):

| Configuración de Salida | Win Rate | Ganancia Media | Pérdida Media | Expectancy por Trade | Resultado a 100 Trades |
|---|:---:|:---:|:---:|:---:|:---:|
| **Target 1R / Stop 1R** | **55%** | 1.0R | 1.0R | **+0.10R** | $+10\text{R}$ (Lenta y truncada) |
| **Target 3R / Stop 1R** | **32%** | 3.0R | 1.0R | **+0.28R** | **$+28\text{R}$ (Máxima rentabilidad)** |
| **Trailing Stop Dinámico** | **38%** | 2.2R | 1.0R | **+0.22R** | $+22\text{R}$ (Equilibrada) |

### Conclusión psicológica clave:
> "Observen la paradoja: **la estrategia con mayor tasa de acierto (55%) es la que menos dinero produce (+10R)**. La estrategia con mejor expectancy (+28R) falla 2 de cada 3 trades. 
> 
> La salida redistribuye tu edge: si no tienes la disciplina psicológica para tolerar un 32% de win rate, no podrás operar la distribución más rentable."

---

## SLIDE 08 — LAS 4 SALIDAS: VISUALIZACIÓN DIDÁCTICA
**Tag:** `BLOQUE 1.2 — LAS 4 SALIDAS`  
**Título:** Las 4 Salidas: Cada Una con su Lógica

### Lo que dices al recorrer los 4 cuadrantes didácticos:

#### a) Salida por Tiempo (Holding Period):
- *"Toda hipótesis tiene fecha de caducidad. Si entraste por un gap de apertura, el efecto dura 15 a 45 minutos, no tres días."*
- **Curva empírica:** Si graficamos el retorno acumulado barra por barra, vemos que **el rendimiento toca su pico en la Barra 6** y luego se aplana. Quedarse más tiempo es asumir riesgo sin edge adicional.
- **Ventaja:** Solo tiene un parámetro, lo que la hace casi inmune al sobreajuste.

#### b) Stop y Target Fijos (Normalizados por ATR):
- *"Una distancia fija puede representar riesgos distintos cuando cambia la volatilidad. Explicita las unidades y compara ese supuesto con una normalización por volatilidad."*
- Usar múltiplos de ATR permite que el modelo respire de acuerdo a la volatilidad del régimen de mercado.

#### c) Salida por Reversa (Stop & Reverse / Flip):
- *"Cierras el Long e inmediatamente abres Short al cambiar la señal del oscilador o media."*
- **4 Costos Ocultos que arruinan el backtest:**  
  1. No hay stop duro de protección ante cisnes negros.  
  2. Doble costo de comisiones por cada giro.  
  3. Slippage acumulativo severo en ejecución real.  
  4. Alta dependencia de trayectoria (*path dependence*).

#### d) Salida por Invalidación:
- *"Sales del trade porque la causa estructural $Z$ que justificó la entrada dejó de existir, no porque tocó una línea arbitraria."*
- Es conceptualmente la más honesta y profesional, aunque requiere monitorear variables de mercado en tiempo real.

---

## SLIDE 09 — EXCURSIONES: MAE Y MFE POR TRADE
**Tag:** `CALIBRACIÓN EMPÍRICA`  
**Título:** Excursiones: El Mapa Empírico de tu Estrategia  
**Subtítulo:** *Cada barra es un trade. Arriba: lo máximo que fue a favor (MFE). Abajo: lo máximo que fue en contra (MAE).*

### Lo que dices:
> "En lugar de probar números aleatorios en un optimizador hasta que el Sharpe ratio suba artificialmente, dejemos que la propia distribución de los datos nos diga dónde colocar el stop y el target."

### Conceptos de MAE y MFE:
- **MAE (*Maximum Adverse Excursion*):** La peor excursión negativa en contra que sufrió la posición antes de cerrarse.
- **MFE (*Maximum Favorable Excursion*):** La máxima excursión positiva a favor que alcanzó la posición durante su vida.

### Lectura del gráfico de 20 trades en pantalla:
1. **Stop Empírico:** Si analizamos solo los trades que terminaron siendo ganadores y descubrimos que **el 95% de ellos nunca estuvo a más de 1.4 ATR en contra**, fijar un stop de 3.0 ATR es regalar dinero al mercado, y fijarlo en 0.8 ATR es cortar ganadores por ruido. El stop óptimo emerge de la data: **1.4 ATR**.
2. **Target Empírico:** Si el promedio de MFE de los ganadores se agota en **2.1 ATR**, colocar un objetivo en 5.0 ATR convertirá trades ganadores en pérdidas innecesarias.
3. **Ratio Implícito:** La relación empírica resultante es $1 : 1.5$ de riesgo/beneficio natural.

---

## SLIDE 10 — OPTIMIZACIÓN: MESETA VS PICO AISLADO
**Tag:** `VALIDACIÓN DE PARÁMETROS`  
**Título:** La Regla de Oro: Prefiere la Meseta al Pico

### Lo que dices:
> "Cuando ejecutan un barrido de optimización, el mayor peligro es enamorarse del número más alto de la tabla. Hay que mirar el vecindario completo, jamás el punto aislado."

### Comparativa en pantalla:
- **Caso A: Pico Aislado (Sobreajuste Puro):**  
  - Target en $1.8\text{ ATR} \rightarrow \text{Sharpe } 1.40$.  
  - Pero con $1.7\text{ ATR} \rightarrow \text{Sharpe } 0.30$ y con $1.9\text{ ATR} \rightarrow \text{Sharpe } 0.20$.  
  - *Diagnóstico:* Un pico solitario rodeado de valores mediocres es **ruido estadístico**. Si la volatilidad del mercado cambia una fracción de milímetro en el futuro, el sistema colapsará.
- **Caso B: Meseta Ancha (Robustez Real):**  
  - Con $1.5\text{ ATR}$, $1.8\text{ ATR}$ y $2.1\text{ ATR} \rightarrow$ todos mantienen un Sharpe sólido alrededor de $0.90$.  
  - *Diagnóstico:* Estabilidad paramétrica. Has encontrado una propiedad estructural del mercado que no depende de valores hiper-específicos.

### Sentencia para recordar:
> **"Si tu equity curve depende del valor exacto del parámetro, no tienes un edge: tienes un ajuste."**

---

## SLIDE 11 — GESTIÓN DEL RIESGO: FIXED VS REINVERSIÓN VS APALANCAMIENTO
**Tag:** `GESTIÓN DEL RIESGO`  
**Título:** Tres Formas de Crecer: Fixed, Reinversión y Apalancamiento  
**Subtítulo:** *Misma estrategia, mismo edge. La diferencia: cómo dimensionas la posición.*

### Lo que dices:
> "El dimensionamiento de posición (sizing) determina si tu edge te hace rico, te mantiene estable o te lleva a la bancarrota. Miren lo que sucede con tres cuentas que operan exactamente los mismos trades:"

### Comparativa de las 3 Curvas de Crecimiento (125 Trades):

```
Equity ($)
$50K  (Pico Apalancado)
$40K                                
$30K                       Crash -82%  $22K (Apalancamiento)
$28K                                           $28K (Reinversión)
$20K              
$15K  $15K (Fixed Sizing)
$10K 
     
     0            25            50            75            100  (Trades)
```

1. **Fixed Sizing ($X fijos por trade):**  
   - Crecimiento lineal y predecible (\$10K $\rightarrow$ \$15K).  
   - Drawdowns en dólares constantes. Excelente tolerancia psicológica.
2. **Reinversión (% fijo del capital):**  
   - Crecimiento geométrico compuesto (\$10K $\rightarrow$ \$28K).  
   - Los drawdowns se amplifican proporcionalmente, pero el riesgo de ruina matemática es bajo si la fracción es conservadora (ej. 1-2%).
3. **Apalancamiento Agresivo (Reinversión $\times$ Leverage):**  
   - Crecimiento explosivo inicial (\$10K $\rightarrow$ \$50K en 80 trades).  
   - **La trampa:** Cuando llega la racha perdedora inevitable, el apalancamiento genera un **Crash del -82%**, destruyendo la cuenta y dejando al trader con secuelas psicológicas irreparables.

---

## SLIDE 12 — VALIDACIÓN: IN-SAMPLE VS OUT-OF-SAMPLE
**Tag:** `VALIDACIÓN`  
**Título:** La Prueba de Fuego: In-Sample vs Out-of-Sample  
**Subtítulo:** *Si tus métricas colapsan fuera de la muestra, no tienes un edge: tienes un ajuste.*

### Lo que dices:
> "Llegamos a la prueba de fuego de todo investigador cuantitativo: dividir la data histórica en **In-Sample (entrenamiento/diseño)** y **Out-of-Sample (prueba ciega)**."

### Tabla Comparativa de Validación:

| Métrica Cuantitativa | Caso A: Sobreajustado (In $\rightarrow$ Out) | Caso B: Robusto (In $\rightarrow$ Out) | Criterio de Aceptación |
|---|:---:|:---:|:---:|
| **Sharpe Ratio** | $2.10 \rightarrow \mathbf{0.31\text{ (-85\%)}}$  | $1.10 \rightarrow \mathbf{0.85\text{ (-23\%)}}$  | Degradación $< 25-30\%$ |
| **Win Rate** | $68\% \rightarrow \mathbf{44\%\text{ (-35\%)}}$ | $58\% \rightarrow \mathbf{54\%\text{ (-7\%)}}$  | Estable |
| **Max Drawdown** | $-8\% \rightarrow \mathbf{-34\%\text{ ($\times$4.2)}}$ | $-12\% \rightarrow \mathbf{-16\%\text{ ($\times$1.3)}}$  | Drawdown contenido |
| **Expectancy (R)** | $+0.45\text{R} \rightarrow \mathbf{-0.12\text{R (NEGATIVA)}}$ | $+0.28\text{R} \rightarrow \mathbf{+0.21\text{R (-25\%)}}$  | Debe ser positiva en OOS |
| **Profit Factor** | $2.80 \rightarrow \mathbf{0.85\text{ (< 1.0)}}$ | $1.65 \rightarrow \mathbf{1.38\text{ (-16\%)}}$  | $> 1.25$ en OOS |

### El Semáforo Cuantitativo:
- **Degradación $> 50\%$:** Descartar inmediatamente la estrategia. No intente 'parcharla' con más filtros.
- **Degradación $\le 25\%$:** Modelo robusto con edge real transferible al mercado en vivo.

---

## SLIDE 13 — CIERRE & REGLA FINAL
**Tag:** `CONCLUSIONES CLAVE`  
**Título:** El Test Definitivo

### Mensaje Final del Speaker:
> "Para cerrar la sesión de hoy, quiero que se lleven estos tres mandamientos grabados:"

```
                
                          LOS 3 MANDAMIENTOS             
                        DEL TRADER CUANTITATIVO          
                
                                     
      
                                                                  
1. CAUSA ESTRUCTURAL           2. SALIDA CONSCIENTE           3. MESETAS > PICOS
Nunca operes una condición     El win rate es vanidad;        Diseña tus stops con MAE
sin un 'porque Z' validado     la expectancy y la tolerancia  empírico y busca estabilidad
antes de ver los datos.        al drawdown son supervivencia. en vecindarios amplios.
```

> "Recuerden siempre:
> **'Si tu equity curve depende del valor exacto del parámetro, no tienes un edge: tienes un sobreajuste.'**
> 
> En la próxima sesión nos meteremos de lleno en el código Python para automatizar el cálculo de MAE/MFE, Walk-Forward Optimization y matrices de correlación de carteras.
> 
> ¡Muchas gracias y abrimos espacio para preguntas!"

---
*Fin del Guion Oficial — Masterclass Diseño y Estrategias Cuantitativas.*
