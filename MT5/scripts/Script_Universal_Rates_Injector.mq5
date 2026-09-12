//+------------------------------------------------------------------+
//|                             Script_Universal_Rates_Injector.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|               https://github.com/felipemillar/seminario_2-public |
//+------------------------------------------------------------------+
#property copyright "QRT Solutions"
#property link      "https://github.com/felipemillar/seminario_2-public"
#property version   "1.00"

// ==============================================================================
// PARÁMETROS DE CONFIGURACIÓN DEL SCRIPT
// ==============================================================================
input group "=== 1. Identificación del Símbolo Personalizado ==="
input string InpSymbolName   = "CUSTOM_NVDA_M1";          // Nombre del Símbolo Destino en MT5
input string InpBaseClone    = "NVDA.US";                 // Activo Base para clonar propiedades (NVDA.US/US100)
input string InpGroup        = "Custom\\US_Equities";     // Jerarquía en Observación del Mercado
input int    InpDigits       = 2;                         // Dígitos decimales de precisión
input double InpPoint        = 0.01;                      // Tamaño del punto flotante (Point)

input group "=== 2. Archivo de Datos en MQL5/Files ==="
input string InpFileName     = "NVDA_1m_2020_2026_MT5.csv"; // Nombre del archivo CSV en MQL5/Files

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   Print("[INICIO] Pipeline Universal de Inyección Cuantitativa");
   Print("[INFO] Símbolo objetivo: ", InpSymbolName, " | Archivo origen: MQL5/Files/", InpFileName);

   // ---------------------------------------------------------------------------
   // PASO 1: CREAR SÍMBOLO PERSONALIZADO SI NO EXISTE
   // ---------------------------------------------------------------------------
   if(!SymbolInfoInteger(InpSymbolName, SYMBOL_EXIST))
   {
      string base = InpBaseClone;

      if(!SymbolInfoInteger(base, SYMBOL_EXIST))
      {
         int total = SymbolsTotal(false);
         bool found = false;
         for(int i = 0; i < total; i++)
         {
            string candidate = SymbolName(i, false);
            if(StringCompare(candidate, InpBaseClone, false) == 0)
            {
               base = candidate;
               found = true;
               break;
            }
         }

         if(!found)
         {
            Print("[AVISO] '", InpBaseClone, "' no existe en el broker. Usando lista de respaldo generica.");
            string candidates[] = {"NVDA.US", "US100", "USTEC", "NAS100", "XAUUSD", "BTCUSD", "EURUSD"};
            for(int i = 0; i < ArraySize(candidates); i++)
            {
               if(SymbolInfoInteger(candidates[i], SYMBOL_EXIST))
               {
                  base = candidates[i];
                  break;
               }
            }
         }
      }

      Print("[PASO 1] El símbolo no existe. Clonando propiedades desde ", base, "...");

      ResetLastError();
      if(!CustomSymbolCreate(InpSymbolName, InpGroup, base))
      {
         Print("[ERROR] Falló CustomSymbolCreate para ", InpSymbolName, ". Error: ", GetLastError());
         return;
      }
      Print("[OK] Símbolo personalizado creado con éxito clonando de: ", base);

      SymbolSelect(base, true);

      double base_contract_size = SymbolInfoDouble(base, SYMBOL_TRADE_CONTRACT_SIZE);
      double base_tick_size     = SymbolInfoDouble(base, SYMBOL_TRADE_TICK_SIZE);
      double base_tick_value    = SymbolInfoDouble(base, SYMBOL_TRADE_TICK_VALUE);
      long   base_calc_mode     = SymbolInfoInteger(base, SYMBOL_TRADE_CALC_MODE);

      if(base_contract_size <= 0.0) base_contract_size = 1.0;
      if(base_tick_size <= 0.0) base_tick_size = InpPoint;
      if(base_tick_value <= 0.0) base_tick_value = base_tick_size * base_contract_size;

      CustomSymbolSetInteger(InpSymbolName, SYMBOL_TRADE_CALC_MODE, base_calc_mode);
      CustomSymbolSetDouble(InpSymbolName, SYMBOL_TRADE_CONTRACT_SIZE, base_contract_size);
      CustomSymbolSetDouble(InpSymbolName, SYMBOL_TRADE_TICK_SIZE, base_tick_size);
      CustomSymbolSetDouble(InpSymbolName, SYMBOL_TRADE_TICK_VALUE, base_tick_value);
      CustomSymbolSetString(InpSymbolName, SYMBOL_CURRENCY_BASE, "USD");
      CustomSymbolSetString(InpSymbolName, SYMBOL_CURRENCY_PROFIT, "USD");
      CustomSymbolSetString(InpSymbolName, SYMBOL_CURRENCY_MARGIN, "USD");

      PrintFormat("[OK] Propiedades de calculo copiadas de %s -> contract_size=%.2f, tick_size=%.5f, tick_value=%.5f",
                  base, base_contract_size, base_tick_size, base_tick_value);
   }
   else
   {
      Print("[INFO] Símbolo ", InpSymbolName, " ya existe en la terminal.");
   }

   CustomSymbolSetString(InpSymbolName, SYMBOL_DESCRIPTION, "US Equities M1 (TradeStation Data)");
   CustomSymbolSetInteger(InpSymbolName, SYMBOL_DIGITS, InpDigits);
   CustomSymbolSetDouble(InpSymbolName, SYMBOL_POINT, InpPoint);
   SymbolSelect(InpSymbolName, true);

   // ---------------------------------------------------------------------------
   // PASO 2: LECTURA Y PARSEO DEL ARCHIVO CSV DESDE MQL5/Files
   // ---------------------------------------------------------------------------
   int handle = FileOpen(InpFileName, FILE_READ | FILE_TXT | FILE_ANSI);
   if(handle == INVALID_HANDLE)
   {
      Print("[ERROR] No se pudo abrir MQL5/Files/", InpFileName, ". Código de error: ", GetLastError());
      Print("[AYUDA] Asegúrate de que el archivo exista en la carpeta MQL5/Files de tu terminal.");
      return;
   }

   string header = FileReadString(handle);
   Print("[INFO] Encabezado CSV: ", header);

   MqlRates rates[];
   ArrayResize(rates, 500000);
   int count = 0;

   while(!FileIsEnding(handle))
   {
      string line = FileReadString(handle);
      if(StringLen(line) < 10) 
         continue;

      string parts[];
      int n = StringSplit(line, ',', parts);
      if(n < 6) 
         continue;

      string ts_str = parts[0] + " " + parts[1];
      datetime t = StringToTime(ts_str);
      if(t <= 0) 
         continue;

      rates[count].time        = t;
      rates[count].open        = StringToDouble(parts[2]);
      rates[count].high        = StringToDouble(parts[3]);
      rates[count].low         = StringToDouble(parts[4]);
      rates[count].close       = StringToDouble(parts[5]);
      rates[count].tick_volume = (n > 6) ? (long)StringToInteger(parts[6]) : 100;
      rates[count].real_volume = (n > 7) ? (long)StringToInteger(parts[7]) : rates[count].tick_volume;
      rates[count].spread      = 10;

      count++;
      if(count % 300000 == 0)
         PrintFormat("[PROGRESO] %d barras parseadas en memoria...", count);

      if(count >= ArraySize(rates))
         ArrayResize(rates, count + 200000);
   }

   FileClose(handle);
   ArrayResize(rates, count);
   Print("[OK] Lectura finalizada: ", count, " barras parseadas.");

   if(count == 0)
   {
      Print("[ERROR] No se encontraron registros válidos para importar.");
      return;
   }

   // ---------------------------------------------------------------------------
   // PASO 3: INYECCIÓN DIRECTA EN LA BASE DE DATOS DE MT5
   // ---------------------------------------------------------------------------
   Print("[PASO 3] Inyectando ", count, " barras en ", InpSymbolName, "...");
   ResetLastError();

   int res = CustomRatesReplace(InpSymbolName, rates[0].time, rates[count - 1].time, rates, count);
   if(res < 0)
   {
      Print("[WARN] CustomRatesReplace arrojó código ", GetLastError(), ". Probando CustomRatesUpdate...");
      ResetLastError();
      res = CustomRatesUpdate(InpSymbolName, rates, count);
   }

   if(res >= 0)
   {
      Print("==================================================================");
      Print("[ÉXITO TOTAL] Se inyectaron ", res, " barras en ", InpSymbolName);
      Print("[INFO] Rango histórico: ", TimeToString(rates[0].time), " hasta ", TimeToString(rates[count - 1].time));
      Print("==================================================================");
      
      // ---------------------------------------------------------------------------
      // PASO 4: DESBLOQUEO AUTOMÁTICO DE SESIONES 24/7 (PREVENCIÓN ERROR 10018)
      // ---------------------------------------------------------------------------
      Print("[PASO 4] Configurando modo FULL y sesiones 24/7 para ", InpSymbolName, "...");
      CustomSymbolSetInteger(InpSymbolName, SYMBOL_TRADE_MODE, SYMBOL_TRADE_MODE_FULL);
      CustomSymbolSetInteger(InpSymbolName, SYMBOL_TRADE_EXEMODE, SYMBOL_TRADE_EXECUTION_MARKET);

      datetime from_time = (datetime)0;      // 00:00:00
      datetime to_time   = (datetime)86400;  // 24:00:00

      for(int d = 0; d <= 6; d++)
      {
         CustomSymbolSetSessionQuote(InpSymbolName, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time);
         CustomSymbolSetSessionTrade(InpSymbolName, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time);
      }
      Print("[OK] Sesiones 24/7 (lunes a domingo) habilitadas. Símbolo listo para Strategy Tester sin error 10018.");

      ChartSetSymbolPeriod(0, InpSymbolName, PERIOD_CURRENT);
      ChartRedraw(0);
   }
   else
   {
      Print("[ERROR] Falló la inyección en ", InpSymbolName, ". Código de error: ", GetLastError());
   }
}
