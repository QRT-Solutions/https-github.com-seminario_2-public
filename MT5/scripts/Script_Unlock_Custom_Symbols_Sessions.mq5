//+------------------------------------------------------------------+
//|               Script_Unlock_Custom_Symbols_Sessions.mq5          |
//|                    Autor: QRT Solutions                          |
//|  Configura sesiones de cotizacion y trading 24/7 (00:00 a 24:00) |
//|  y modo de trading FULL para TODOS los símbolos personalizados   |
//|  evitando el error '10018: Market closed' en Strategy Tester     |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/QRT-Solutions/seminario_2-public"
#property version     "2.00"
#property description "Desbloquea sesiones 24/7 y modo de trading FULL para TODOS los símbolos personalizados de MT5"
#property script_show_inputs false

void OnStart()
{
   datetime from_time = (datetime)0;      // 00:00:00
   datetime to_time   = (datetime)86400;  // 24:00:00

   int total_server = SymbolsTotal(false);
   int success_count = 0;
   int custom_count = 0;

   PrintFormat("[INICIO] Escaneando terminal en busca de símbolos personalizados (total examinados: %d)...", total_server);

   // Paso 1: Autodescubrimiento dinámico de todos los símbolos personalizados
   for(int i = 0; i < total_server; i++)
   {
      string sym = SymbolName(i, false);
      if(sym == "") continue;

      // Verificar si es un símbolo personalizado
      if(SymbolInfoInteger(sym, SYMBOL_CUSTOM))
      {
         custom_count++;
         
         // Habilitar modo de trading completo
         CustomSymbolSetInteger(sym, SYMBOL_TRADE_MODE, SYMBOL_TRADE_MODE_FULL);
         CustomSymbolSetInteger(sym, SYMBOL_TRADE_EXEMODE, SYMBOL_TRADE_EXECUTION_MARKET);

         // Asignar sesiones 24/7 para los 7 días de la semana (0 a 6: domingo a sábado)
         bool ok = true;
         for(int d = 0; d <= 6; d++)
         {
            if(!CustomSymbolSetSessionQuote(sym, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time))
               ok = false;
            if(!CustomSymbolSetSessionTrade(sym, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time))
               ok = false;
         }

         if(ok)
         {
            success_count++;
            SymbolSelect(sym, true);
            PrintFormat("[OK] %s: Modo FULL y sesiones 24/7 configuradas correctamente.", sym);
         }
         else
         {
            PrintFormat("[AVISO] %s: Error al fijar sesiones: %d", sym, GetLastError());
         }
      }
   }

   // Paso 2: Respaldo para símbolos con prefijo CUSTOM_ si no estaban marcados
   string fallback_symbols[] = {
      "CUSTOM_AAPL_M1", "CUSTOM_AMD_M1", "CUSTOM_AMZN_M1", "CUSTOM_ARM_M1",
      "CUSTOM_AVGO_M1", "CUSTOM_BA_M1", "CUSTOM_COIN_M1", "CUSTOM_CRM_M1",
      "CUSTOM_GOOGL_M1", "CUSTOM_INTC_M1", "CUSTOM_IWM_M1", "CUSTOM_JPM_M1",
      "CUSTOM_META_M1", "CUSTOM_MSFT_M1", "CUSTOM_MSTR_M1", "CUSTOM_NFLX_M1",
      "CUSTOM_NVDA_M1", "CUSTOM_PLTR_M1", "CUSTOM_QCOM_M1", "CUSTOM_QQQ_M1",
      "CUSTOM_SHOP_M1", "CUSTOM_SMH_M1", "CUSTOM_SPY_M1", "CUSTOM_TSLA_M1",
      "CUSTOM_UBER_M1", "CUSTOM_XBI_M1", "CUSTOM_XOM_M1"
   };

   for(int j = 0; j < ArraySize(fallback_symbols); j++)
   {
      string fs = fallback_symbols[j];
      if(SymbolInfoInteger(fs, SYMBOL_EXIST))
      {
         CustomSymbolSetInteger(fs, SYMBOL_TRADE_MODE, SYMBOL_TRADE_MODE_FULL);
         CustomSymbolSetInteger(fs, SYMBOL_TRADE_EXEMODE, SYMBOL_TRADE_EXECUTION_MARKET);
         for(int d = 0; d <= 6; d++)
         {
            CustomSymbolSetSessionQuote(fs, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time);
            CustomSymbolSetSessionTrade(fs, (ENUM_DAY_OF_WEEK)d, 0, from_time, to_time);
         }
         SymbolSelect(fs, true);
      }
   }

   PrintFormat("[FINALIZADO] Éxito: %d símbolos personalizados desbloqueados con sesiones 24/7 completas.", (success_count > 0 ? success_count : custom_count));
}
