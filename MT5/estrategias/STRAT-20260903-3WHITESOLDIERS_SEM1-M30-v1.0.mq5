//+------------------------------------------------------------------+
//|               STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0.mq5    |
//|               QUANT AGENTIC SWARM (QAS) — MQL5 POO               |
//|                    Autor: QRT Solutions                          |
//|  Tesis: Patron de velas Three White Soldiers Puro (Steve Nison)  |
//|  para Seminario 1. Sin filtros de tendencia, calidad o regimen.  |
//|  Ejecucion nativa al cierre de barra M30 (0 repainting).         |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Seminario 1: Three White Soldiers Puro en M30 (Sin Filtros)"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| BLOQUE 1: INPUTS DE USUARIO (CON SANITY CLAMPING)                |
//+------------------------------------------------------------------+
input group "=== 1. Triple Barrier Method (Salidas) ==="
input double   InpTPMultiplier   = 2.0;         // Barrera 1: Take Profit (+k1 * ATR D1)
input double   InpSLMultiplier   = 1.0;         // Barrera 2: Stop Loss (-k2 * ATR D1)
input int      InpMaxHoldingBars = 32;          // Barrera 3: Time-Stop Maximo (Barras M30 = 16h)

input group "=== 2. Volatilidad MTF Diario (Base Barreras) ==="
input int      InpSlowAtrPeriod  = 14;          // Periodo ATR Diario (D1)

input group "=== 3. Gestion de Orden y Trazabilidad ==="
input double   InpLotSize        = 0.01;        // Tamaño de Lote Fijo
input ulong    InpMagicNumber    = 20260907;    // Magic Number Unico (Seminario 1)
input string   InpStrategyID     = "STRAT-20260903-3WHITESOLDIERS_SEM1-M30-v1.0";

//+------------------------------------------------------------------+
//| VARIABLES GLOBALES Y HANDLES                                     |
//+------------------------------------------------------------------+
CTrade      g_trade;
int         g_handle_atr14_d1 = INVALID_HANDLE;
datetime    g_last_bar_time   = 0;

// Contadores de diagnostico
int         g_diag_bars_evaluated = 0;
int         g_diag_pattern_ok     = 0;

//+------------------------------------------------------------------+
//| DETECTOR DE NUEVA BARRA AL CIERRE                                |
//+------------------------------------------------------------------+
bool IsNewBar()
{
   datetime cur_time = iTime(_Symbol, PERIOD_CURRENT, 0);
   if(cur_time != g_last_bar_time && cur_time != 0)
   {
      g_last_bar_time = cur_time;
      return true;
   }
   return false;
}

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpTPMultiplier <= 0 || InpSLMultiplier <= 0 || InpMaxHoldingBars <= 0 || InpLotSize <= 0)
   {
      Print("[ERROR] Parametros de entrada fuera de rango.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetDeviationInPoints(20);
   g_trade.SetTypeFillingBySymbol(_Symbol);

   g_handle_atr14_d1 = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);
   if(g_handle_atr14_d1 == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar handle ATR Diario.");
      return(INIT_FAILED);
   }

   PrintFormat("[OK] [%s] Inicializado con exito en %s (%s). Magic:%d", 
               InpStrategyID, _Symbol, EnumToString(Period()), InpMagicNumber);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| FUNCION DE DESINICIALIZACION (OnDeinit)                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_handle_atr14_d1);
   Comment("");
   PrintFormat("{\"event\":\"DIAGNOSTIC_SUMMARY\",\"bars_evaluated\":%d,\"pattern_ok\":%d}",
               g_diag_bars_evaluated, g_diag_pattern_ok);
   PrintFormat("[STOP] [%s] Detenido. Razon: %d", InpStrategyID, reason);
}

//+------------------------------------------------------------------+
//| GESTION DE SALIDAS ABIERTAS (BARRERA 3: TIME STOP)               |
//+------------------------------------------------------------------+
void ManageOpenPositions()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket <= 0) continue;

      if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);

         if(bars_held >= InpMaxHoldingBars)
         {
            if(g_trade.PositionClose(ticket))
            {
               PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%I64u,\"bars_held\":%d}", ticket, bars_held);
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//| FUNCION PRINCIPAL ON TICK                                        |
//+------------------------------------------------------------------+
void OnTick()
{
   // Sincronizacion estricta al cierre de barra M30 (0 repainting)
   if(!IsNewBar()) return;

   // Guarda de calentamiento
   if(BarsCalculated(g_handle_atr14_d1) < InpSlowAtrPeriod + 5 || Bars(_Symbol, PERIOD_CURRENT) < 30)
      return;

   // Gestionar Time-Stop en posiciones abiertas
   ManageOpenPositions();

   // 1. Obtener OHLC de los 3 soldados en velas cerradas [1], [2] y [3]
   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   if(CopyRates(_Symbol, PERIOD_CURRENT, 1, 3, rates) < 3) return;

   // rates[0] = vela shift 1 (tercer soldado, mas reciente)
   // rates[1] = vela shift 2 (segundo soldado)
   // rates[2] = vela shift 3 (primer soldado, mas antiguo)
   double o1 = rates[0].open, c1 = rates[0].close;
   double o2 = rates[1].open, c2 = rates[1].close;
   double o3 = rates[2].open, c3 = rates[2].close;

   // 2. Validacion geometrica pura de Steve Nison (Sin filtros secundarios)
   bool bull3 = (c3 > o3); // Vela 3 alcista
   bool bull2 = (c2 > o2); // Vela 2 alcista
   bool bull1 = (c1 > o1); // Vela 1 alcista

   // Cierres crecientes
   bool closes_increasing = (c1 > c2) && (c2 > c3);

   // Aperturas dentro o a nivel del cuerpo de la vela anterior
   bool open2_in_body3 = (o2 >= MathMin(o3, c3)) && (o2 <= MathMax(o3, c3));
   bool open1_in_body2 = (o1 >= MathMin(o2, c2)) && (o1 <= MathMax(o2, c2));

   bool pattern_ok = bull3 && bull2 && bull1 && closes_increasing && open2_in_body3 && open1_in_body2;

   g_diag_bars_evaluated++;
   if(pattern_ok)
   {
      g_diag_pattern_ok++;
      PrintFormat("{\"event\":\"PATTERN_DETECTED\",\"time\":\"%s\",\"c1\":%.2f,\"c2\":%.2f,\"c3\":%.2f}", 
                  TimeToString(rates[0].time), c1, c2, c3);
   }

   // 3. Lectura de ATR Diario cerrado (shift = 1) para dimensionar las barreras
   double buf_atr14[];
   ArraySetAsSeries(buf_atr14, true);
   if(CopyBuffer(g_handle_atr14_d1, 0, 1, 1, buf_atr14) < 1) return;
   double daily_atr = buf_atr14[0];
   if(daily_atr <= 0.0) return;

   // HUD Informativo en grafico
   int active_pos = 0;
   for(int i = 0; i < PositionsTotal(); i++)
   {
      if(PositionGetTicket(i) > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         active_pos++;
   }

   Comment(StringFormat("=====================================\n" +
                        "  QRT Solutions | Seminario 1        \n" +
                        "  UUID: %s                           \n" +
                        "=====================================\n" +
                        "  Timeframe        : %s (Puro, Sin Filtros)\n" +
                        "  Patron Detectado : %s\n" +
                        "  ATR D1 (14)      : %.2f\n" +
                        "  Posiciones       : %d\n" +
                        "  Total Evaluadas  : %d\n" +
                        "  Total Patrones   : %d\n" +
                        "=====================================",
                        InpStrategyID, EnumToString(Period()), pattern_ok ? "SI [GATILLO]" : "NO",
                        daily_atr, active_pos, g_diag_bars_evaluated, g_diag_pattern_ok));

   // No abrir si ya hay una posicion activa con este Magic Number
   if(active_pos > 0) return;

   // 4. Disparo si se cumple el patron
   if(!pattern_ok) return;

   double ask    = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   int    digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);

   double sl = NormalizeDouble(ask - (InpSLMultiplier * daily_atr), digits);
   double tp = NormalizeDouble(ask + (InpTPMultiplier * daily_atr), digits);

   if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, "3WS_SEM1_Buy"))
   {
      PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.5f,\"sl\":%.5f,\"tp\":%.5f,\"atr_d1\":%.2f}",
                  ask, sl, tp, daily_atr);
   }
   else
   {
      PrintFormat("{\"event\":\"ORDER_REJECTED\",\"side\":\"BUY\",\"retcode\":%d,\"description\":\"%s\"}",
                  g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
   }
}
