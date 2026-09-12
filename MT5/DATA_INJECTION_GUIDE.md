# Guía de Inyección de Datos Históricos & Desbloqueo 24/7 en MetaTrader 5

> **Autor Canónico:** QRT Solutions & Pepperstone Latam  
> **Ámbito:** Repositorio Educativo `seminario_2-public`  
> **Propósito:** Enseñar al alumno a inyectar más de 20 años de datos intradiarios (M1) de alta calidad en MetaTrader 5 al doble clic, y erradicar de raíz el error `10018: Market closed`.

---

## 1. El Problema de los Datos en MT5 y la Solución QRT

Muchos brokers limitan el historial intradiario a pocos meses o semanas. Para realizar backtests robustos con significancia estadística real (*Marcos López de Prado*), se requieren **millones de velas M1**.

El repositorio incluye herramientas automatizadas para:
1. Crear símbolos personalizados (`CUSTOM_*`) e inyectar millones de cotizaciones M1.
2. Desbloquear las sesiones de trading y cotización de lunes a domingo 24/7.

---

## 2. Cómo Solucionar el Error `10018: Market closed`

### ¿Por qué ocurre?
Cuando intentas hacer un backtest de un símbolo sintético o personalizado fuera del horario regular de mercado (ej. un sábado o domingo, o fuera de horario RTH), el motor del Strategy Tester de MT5 consulta la tabla de sesiones. Si el símbolo no tiene declaradas sesiones para ese día/hora, MT5 rechaza todas las órdenes con el error `10018: Market closed`.

### La Solución en 1 Clic (`Script_Unlock_Custom_Symbols_Sessions.mq5`):
1. Abre MetaTrader 5.
2. Ve al panel **Navegador** (`Ctrl + N`) $\rightarrow$ despliega la carpeta **Scripts**.
3. Haz doble clic sobre **`Script_Unlock_Custom_Symbols_Sessions`** (o arrástralo a cualquier gráfico).
4. El script configurará automáticamente:
   - Sesiones de cotización de lunes a domingo de `00:00` a `24:00`.
   - Sesiones de trading de lunes a domingo de `00:00` a `24:00`.
   - Modo de trading total (`SYMBOL_TRADE_MODE_FULL`).
5. ¡Listo! Puedes ejecutar tus backtests los 365 días del año sin interrupciones.

---

## 3. Inyección de Datos al Doble Clic (`Script_Universal_Rates_Injector.mq5`)

Para cargar archivos históricos CSV de gran escala:
1. Copia el archivo CSV generado a la carpeta `MQL5\Files\` de tu MetaTrader 5.
2. En el Navegador de MT5, haz doble clic sobre **`Script_Universal_Rates_Injector`**.
3. El script leerá las velas en streaming continuo y las inyectará en el símbolo con `CustomRatesReplace` / `CustomRatesUpdate`.
4. El símbolo quedará inmediatamente disponible en el panel de **Observación del Mercado** (*Market Watch*) y en el **Probador de Estrategias** (`Ctrl + R`).
