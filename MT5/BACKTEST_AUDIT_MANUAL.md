# Manual Institucional: Protocolo de Auditoría y Reportes de Backtesting

> **Autor Institucional:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Repositorio Educativo `seminario_2-public` (Módulo MT5, Python & Swarm)  
> **Vigencia:** Norma autoritativa para el Agente Educador Cuantitativo y alumnos del seminario.

---

## 1. ¿Cómo Solicitar el Reporte de Backtesting al Agente?

Para obtener el reporte cuantitativo completo con todos los KPIs del sistema, el usuario puede emplear cualquiera de las siguientes **frases disparadoras canónicas** (o lenguaje natural equivalente):

### Frases Disparadoras Recomendadas:
1. **Frase Directa de Pool Completo:**  
   > *"Audita el backtest de [Activo / Estrategia] con el pool completo de 3 módulos."*
2. **Frase Estándar Dual:**  
   > *"Genera el reporte de backtest con evaluación dual (monetaria y porcentual) y asimetrías."*
3. **Frase Rápida y Coloquial:**  
   > *"Analiza los KPIs de este backtest."* o *"Dame el reporte cuantitativo de este backtest."*
4. **Frase Específica de Archivo:**  
   > *"Procesa el reporte de backtest [Reporte.xml / deals.csv] y extrae todos los KPIs."*

> **Garantía Inmutable del Agente:**  
> Independientemente de cuán breve sea la solicitud del alumno (por ejemplo, simplemente *"analiza el backtest"*), el agente tiene el **mandato operativo ineludible** de generar y presentar el informe estructurado bajo los **3 Módulos de Diagnóstico Cuantitativo**.

---

## 2. La Estructura Obligatoria del Reporte en 3 Módulos

El reporte generado por el agente se divide estrictamente en 3 capas de auditoría para responder a preguntas tácticas concretas de optimización:

```
┌────────────────────────────────────────────────────────────────────────────────┐
│               ESTRUCTURA DE AUDITORÍA DE BACKTESTING QRT                       │
├────────────────────────────────────────────────────────────────────────────────┤
│ MÓDULO 1: LA EVALUACIÓN DUAL OBLIGATORIA                                      │
│ • Capa Monetaria (USD / Divisa de Cuenta)                                      │
│ • Capa Porcentual Pura (% Precio del Activo)                                   │
├────────────────────────────────────────────────────────────────────────────────┤
│ MÓDULO 2: DIAGNÓSTICO DE ASIMETRÍAS (¿DÓNDE ESTÁ EL EDGE REAL?)                │
│ • 1. Desglose Direccional Longs vs Shorts (Elder & Kaufman)                      │
│ • 2. Esperanza Matemática por Trade (Expectancy / E) (Minervini & Van Tharp)   │
│ • 3. Consistencia Temporal (% Meses Positivos) (Aronson & Kaufman)             │
├────────────────────────────────────────────────────────────────────────────────┤
│ MÓDULO 3: DIAGNÓSTICO DE EJECUCIÓN Y TIEMPOS (¿CÓMO OPTIMIZAR EL TRADE?)       │
│ • 4. Eficiencia de Excursión (MAE / MFE) (Sweeney & López de Prado)           │
│ • 5. Tiempo de Permanencia (Barras en Posición / Time-Stop) (Crabel)           │
│ • 6. Racha Máxima de Pérdidas y Circuit Breaker (Weissman & Elder)             │
└────────────────────────────────────────────────────────────────────────────────┘
```

---

## 3. Catálogo Completo de KPIs Entregados por Módulo

### Módulo 1: Evaluación Dual (Monetario vs Variación Porcentual Pura)
Elimina el sesgo distorsionador del tamaño de lote flotante o apalancamiento, auditando el movimiento real del precio del subyacente.

| Métrica / KPI | Fórmula Matemática | Unidad | Interpretación Práctica |
| :--- | :--- | :---: | :--- |
| **PnL Neto Total** | $\sum \text{Profit}_i$ | USD | Ganancia o pérdida total en dinero de la cuenta. |
| **Profit Factor Monetario** | $\frac{\sum \text{Ganancias}}{\sum \|\text{Pérdidas}\|}$ | Ratio | Dólares ganados por cada dólar perdido. |
| **Tasa de Acierto (Win Rate)** | $\frac{N_{\text{win}}}{N_{\text{total}}} \times 100\%$ | % | Porcentaje de operaciones cerradas con PnL > 0. |
| **Retorno % Acumulado** | $\sum R_i \quad \text{donde } R_i = \pm \frac{P_{\text{exit}} - P_{\text{entry}}}{P_{\text{entry}}} \times 100$ | % | Suma aritmética de las variaciones del precio del activo. |
| **Retorno % Compuesto** | $\prod (1 + r_i) - 1$ | % | Crecimiento geométrico sin inyecciones de capital. |
| **Profit Factor Porcentual** | $\frac{\sum R_{\text{win}}}{\sum \|R_{\text{loss}}\|}$ | Ratio | Variación porcentual ganada por cada % de precio perdido. |
| **Payoff Ratio Porcentual** | $\frac{\text{Avg Win \%}}{\|\text{Avg Loss \%}\|}$ | Ratio | Relación de asimetría: cuánto gana el trade medio vs cuánto pierde. |
| **Drawdown Máximo de Curva** | $\max (Peak_t - Equity_t)$ | % / USD | Peor caída sufrida desde el máximo anterior de la equity. |

---

### Módulo 2: Diagnóstico de Asimetrías
Identifica sesgos estructurales y dependencias estadísticas ocultas.

| Métrica / KPI | Fórmula / Fuente Canónica | Interpretación y Pregunta que Responde |
| :--- | :--- | :--- |
| **Desglose Longs vs Shorts** | *Alexander Elder (Triple Pantalla) & Perry Kaufman.* | Compara Retorno %, Win Rate y PF de Compras vs Ventas. Responde: *"¿El edge es bidireccional o los cortos están devorando las ganancias de los largos?"* |
| **Esperanza Matemática ($E$)** | $E = (WR \times \text{Avg Win \%}) - (LR \times \text{Avg Loss \%})$ <br> *Mark Minervini & Van Tharp.* | Retorno porcentual neto esperado por cada trade ejecutado. Si $E \le 0$, el sistema es perdedor sin importar el lote. |
| **Consistencia Temporal** | $\% \text{ Meses Positivos} = \frac{\text{Meses Verde}}{\text{Meses Totales}} \times 100$ <br> *David Aronson & Perry Kaufman.* | Responde: *"¿La ganancia fue un golpe de suerte aislado en un solo mes o una ventaja distribuida mes a mes?"* (Objetivo robusto: $> 55\%$). |

---

### Módulo 3: Diagnóstico de Ejecución y Salidas
Aporta las directrices exactas para calibrar Stops, Targets y límites de tiempo.

| Métrica / KPI | Fórmula / Fuente Canónica | Interpretación y Pregunta que Responde |
| :--- | :--- | :--- |
| **Excursiones (MAE / MFE)** | $\text{MAE} = \frac{Low_{\min} - P_{\text{entry}}}{ATR_D} \quad \text{MFE} = \frac{High_{\max} - P_{\text{entry}}}{ATR_D}$ <br> *John Sweeney & Marcos López de Prado.* | Calibra Stops y Targets empíricos. Si el 85% de los ganadores nunca superó $0.8x$ ATR en contra, cualquier Stop $> 1.0x$ es capital desperdiciado. |
| **Tiempo de Permanencia** | Conteo de barras intradiarias abiertas hasta el cierre. <br> *Toby Crabel (Holding Period Decay).* | Responde: *"¿Cuánto tiempo tarda la hipótesis en materializarse antes de perder su ventaja?"* Permite fijar el *Time-Stop*. |
| **Racha Máxima y Circuit Breaker** | Conteo de pérdidas continuas máximas. <br> *Richard Weissman & Alexander Elder.* | Define el peor escenario de estrés consecutivo y programa el freno automático de emergencia (ej. pausar tras 3 pérdidas en el día). |

---

## 4. Ejemplo de Salida Oficial Esperada

Cada vez que solicites el reporte, el agente te entregará un formato estructurado como este:

```markdown
# Reporte de Auditoría Cuantitativa: [Estrategia / Activo]
Muestreo: [N] Operaciones | Periodo: [Fecha Inicio] a [Fecha Fin]

### Módulo 1: Evaluación Dual (Monetaria vs Variación Porcentual Pura)
| Métrica | Capa Monetaria (USD) | Capa Porcentual (%) |
| :--- | :--- | :--- |
| **Rendimiento Neto** | +$1.450,20 USD | +34,80% |
| **Profit Factor** | 1,42 | 1,38 |
| **Win Rate** | 42,5% | 42,5% |
| **Payoff Ratio** | 1,92x | 1,86x |

### Módulo 2: Diagnóstico de Asimetrías
| Dirección | Trades | Retorno % Neto | Win Rate | Profit Factor |
| :--- | :---: | :---: | :---: | :---: |
| **Compras (Longs)** | 120 | +28,40% | 48,3% | 1,65 |
| **Ventas (Shorts)** | 115 | +6,40% | 36,5% | 1,08 |
- **Esperanza Matemática ($E$):** +0,42% por trade.
- **Consistencia Mensual:** 68% de meses positivos (17 de 25 meses).

### Módulo 3: Diagnóstico de Ejecución y Salidas
- **Eficiencia MAE (Percentil 90 de ganadores):** 0,68x ATR Diario (Stop sugerido: 0,75x ATR).
- **Masa Modal MFE:** 1,45x ATR Diario (Target sugerido: 1,50x ATR).
- **Tiempo medio en posición:** 24 barras intradiarias (Time-stop óptimo: 32 barras).
- **Racha máxima de pérdidas:** 4 operaciones consecutivas.
```
