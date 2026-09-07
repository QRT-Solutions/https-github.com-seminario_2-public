//+------------------------------------------------------------------+
//|                          STRAT-20260902-ORB_MOM-M5-v1.1.mq5      |
//|               QUANT AGENTIC SWARM (QAS) — MQL5 POO               |
//|                    Autor: QRT Solutions                          |
//|  Tesis: Opening Range Breakout + Filtro de Aceleracion (ROC)     |
//|  Generico: aplicable a cualquier simbolo bursatil no continuo    |
//|  (accion o indice con apertura/cierre de sesion definidos)       |
//|  v1.1: Opcion A (TP 1.0x ATR D1) + Opcion C (ventana de entrada  |
//|  angosta a la "hora dorada" post-apertura, Fisher ACD/Crabel)    |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.10"
#property description "STRAT-20260902-ORB_MOM-M5-v1.1"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| BLOQUE 1: INPUTS DE USUARIO (CON SANITY CLAMPING)                |
//+------------------------------------------------------------------+
input group "1. Rango de Apertura (Opening Range)"
input int      InpSessionStartHour   = 16;      // Hora Inicio Sesion (Tiempo Servidor/Broker) [recalibrado: apertura real NVDA.US en Pepperstone-Demo]
input int      InpSessionStartMinute = 30;      // Minuto Inicio Sesion
input int      InpORBars             = 3;       // N_or: Velas M5 que forman el Rango de Apertura

input group "2. Filtro de Momentum (Aceleracion ROC)"
input bool     InpUseMomentumFilter  = true;    // Exigir 3 valores de ROC consecutivos crecientes

input group "3. Regimen de Volatilidad MTF (D1 - Lopez de Prado)"
input bool     InpUseRegime          = true;    // Activar Filtro Z-Score MTF
input int      InpFastAtrPeriod      = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod      = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow       = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold    = 0.67;    // Umbral Minimo Z-Score (Exigir Expansion de Volatilidad)

input group "4. Salidas: Triple Barrier Method"
input double   InpProfitMultiplier   = 1.0;     // Barrera 1: Take Profit (+k1 * ATR D1) [Opcion A: antes 1.5]
input double   InpStopMultiplier     = 0.5;     // Barrera 2: Stop Loss (-k2 * ATR D1)
input int      InpMaxHoldingBars     = 75;      // Barrera 3 (respaldo): Time-Stop Maximo en Barras M5

input group "5. Ventana de Entradas (Opcion C: Hora Dorada)"
input int      InpEntryEndHour       = 17;      // Hora Limite para Nuevas Entradas (Tiempo Servidor)
input int      InpEntryEndMinute     = 30;      // Minuto Limite para Nuevas Entradas

input group "6. Cierre Forzado de Sesion (Posiciones Abiertas)"
input int      InpSessionEndHour     = 22;      // Hora de Cierre Forzado (Tiempo Servidor)
input int      InpSessionEndMinute   = 45;      // Minuto de Cierre Forzado

input group "7. Gestion de Orden y Trazabilidad"
input double   InpLotSize            = 0.01;    // Tamaño de Lote Fijo
input ulong    InpMagicNumber        = 20260904; // Magic Number Unico
input string   InpStrategyID         = "STRAT-20260902-ORB_MOM-M5-v1.1";

//+------------------------------------------------------------------+
//| CLASE UTILIDAD: DETECTOR DE NUEVA BARRA (TIMEFRAME FIJO M5)      |
//+------------------------------------------------------------------+
class CIsNewBar
{
private:
   datetime m_last_bar_time;
public:
   CIsNewBar() { m_last_bar_time = 0; }
   bool IsNewBar(ENUM_TIMEFRAMES tf)
   {
      datetime cur_bar_time = iTime(_Symbol, tf, 0);
      if(cur_bar_time != m_last_bar_time && cur_bar_time != 0)
      {
         m_last_bar_time = cur_bar_time;
         return true;
      }
      return false;
   }
};

//+------------------------------------------------------------------+
//| VARIABLES GLOBALES Y HANDLES                                     |
//+------------------------------------------------------------------+
CTrade      g_trade;
CIsNewBar   g_bar_detector;

int         g_handle_atr5_d1   = INVALID_HANDLE;
int         g_handle_atr14_d1  = INVALID_HANDLE;

datetime    g_current_day      = 0;
int         g_or_bar_count     = 0;
bool        g_or_ready         = false;
double      g_or_high          = 0.0;
double      g_or_low           = 0.0;

double      g_roc0 = 0.0, g_roc1 = 0.0, g_roc2 = 0.0;
int         g_roc_valid_count  = 0;
double      g_last_close       = 0.0;

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpProfitMultiplier <= 0 || InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0 ||
      InpLotSize <= 0 || InpORBars <= 0 ||
      InpSessionStartHour < 0 || InpSessionStartHour > 23 || InpSessionStartMinute < 0 || InpSessionStartMinute > 59 ||
      InpEntryEndHour < 0 || InpEntryEndHour > 23 || InpEntryEndMinute < 0 || InpEntryEndMinute > 59 ||
      InpSessionEndHour < 0 || InpSessionEndHour > 23 || InpSessionEndMinute < 0 || InpSessionEndMinute > 59)
   {
      Print("[ERROR] Parametros de entrada fuera de rango.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   if((InpEntryEndHour * 60 + InpEntryEndMinute) >= (InpSessionEndHour * 60 + InpSessionEndMinute))
   {
      Print("[ERROR] La ventana de entrada debe cerrar antes del cierre forzado de sesion.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetMarginMode();
   g_trade.SetTypeFillingBySymbol(_Symbol);

   g_handle_atr5_d1  = iATR(_Symbol, PERIOD_D1, InpFastAtrPeriod);
   g_handle_atr14_d1 = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);

   if(g_handle_atr5_d1 == INVALID_HANDLE || g_handle_atr14_d1 == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar handles de ATR Diario.");
      return(INIT_FAILED);
   }

   PrintFormat("[OK] [%s] Inicializado con exito en %s. Entradas %02d:%02d-%02d:%02d, Cierre forzado %02d:%02d (tiempo servidor), N_or=%d, Magic:%d",
               InpStrategyID, _Symbol, InpSessionStartHour, InpSessionStartMinute,
               InpEntryEndHour, InpEntryEndMinute, InpSessionEndHour, InpSessionEndMinute, InpORBars, InpMagicNumber);
   Print("[AVISO] Los horarios de sesion estan en tiempo del servidor/broker, NO en UTC. Verifica la apertura real del simbolo (Especificacion del simbolo en Market Watch) antes de operar en vivo -en NVDA.US/Pepperstone-Demo la apertura real observada fue ~16:30 hora servidor, no 13:30.");
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| FUNCION DE DESINICIALIZACION (OnDeinit)                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_handle_atr5_d1);
   IndicatorRelease(g_handle_atr14_d1);
   Comment("");
   PrintFormat("[STOP] [%s] Detenido. Razon: %d", InpStrategyID, reason);
}

//+------------------------------------------------------------------+
//| CALCULO DE REGIMEN MTF DIARIO (LOPEZ DE PRADO Z-SCORE)           |
//+------------------------------------------------------------------+
bool CalculateDailyZScore(double &out_zscore, double &out_atr14)
{
   out_zscore = 0.0;
   out_atr14 = 0.0;

   double buf_atr5[], buf_atr14[];
   ArraySetAsSeries(buf_atr5, true);
   ArraySetAsSeries(buf_atr14, true);

   int needed = InpZScoreWindow + 2;
   if(CopyBuffer(g_handle_atr5_d1, 0, 1, needed, buf_atr5) < needed) return false;
   if(CopyBuffer(g_handle_atr14_d1, 0, 1, needed, buf_atr14) < needed) return false;

   out_atr14 = buf_atr14[0]; // ATR D1 cerrado mas reciente (shift 1)

   double diffs[];
   ArrayResize(diffs, InpZScoreWindow);
   double sum = 0.0;

   for(int i = 0; i < InpZScoreWindow; i++)
   {
      diffs[i] = buf_atr5[i] - buf_atr14[i];
      sum += diffs[i];
   }

   double mean = sum / (double)InpZScoreWindow;
   double sum_sq = 0.0;
   for(int i = 0; i < InpZScoreWindow; i++)
      sum_sq += MathPow(diffs[i] - mean, 2.0);

   double stdev = MathSqrt(sum_sq / (double)InpZScoreWindow);
   out_zscore = (stdev > 0.0) ? (diffs[0] - mean) / stdev : 0.0;

   return true;
}

//+------------------------------------------------------------------+
//| NORMALIZACION DE VOLUMEN SEGUN ESPECIFICACION DEL SIMBOLO        |
//+------------------------------------------------------------------+
double NormalizeVolume(double requested_vol)
{
   double vol_min  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
   double vol_max  = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
   double vol_step = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);

   double vol = requested_vol;
   if(vol_step > 0.0)
      vol = MathRound(vol / vol_step) * vol_step;

   if(vol_min > 0.0) vol = MathMax(vol, vol_min);
   if(vol_max > 0.0) vol = MathMin(vol, vol_max);

   return vol;
}

//+------------------------------------------------------------------+
//| GESTION DE SALIDAS ABIERTAS (BARRERA 3: CIERRE DE SESION)        |
//| Se cierra por reloj de sesion (garantiza mismo dia, sin importar |
//| a que hora entro la operacion) y como respaldo por conteo de     |
//| barras (Triple Barrier del contrato JSON).                      |
//+------------------------------------------------------------------+
void ManageOpenPositions(int time_of_day_min, int session_end_min)
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket <= 0) continue;

      if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_M5, open_time);

         bool session_over  = (time_of_day_min >= session_end_min);
         bool bars_exceeded = (bars_held >= InpMaxHoldingBars);

         if(session_over || bars_exceeded)
         {
            string reason = session_over ? "B3_SESSION_CLOSE" : "B3_TIME_STOP_MAX_BARS";
            if(g_trade.PositionClose(ticket))
            {
               PrintFormat("{\"event\":\"EXIT\",\"reason\":\"%s\",\"ticket\":%I64u,\"bars_held\":%d}", reason, ticket, bars_held);
            }
            else
            {
               PrintFormat("{\"event\":\"EXIT_RETRY\",\"reason\":\"%s\",\"ticket\":%I64u,\"bars_held\":%d,\"retcode\":%d,\"description\":\"%s\"}",
                           reason, ticket, bars_held, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
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
   // Ejecucion estrictamente al cierre de vela M5 (0 repainting), independiente del TF del grafico
   if(!g_bar_detector.IsNewBar(PERIOD_M5))
      return;

   // Guarda de calentamiento del regimen MTF Diario
   if(BarsCalculated(g_handle_atr14_d1) < InpSlowAtrPeriod + InpZScoreWindow + 5)
      return;

   datetime t1  = iTime(_Symbol, PERIOD_M5, 1);
   double   h1  = iHigh(_Symbol, PERIOD_M5, 1);
   double   l1  = iLow(_Symbol, PERIOD_M5, 1);
   double   c1  = iClose(_Symbol, PERIOD_M5, 1);

   MqlDateTime dt;
   TimeToStruct(t1, dt);
   datetime day_key = t1 - (dt.hour * 3600 + dt.min * 60 + dt.sec);
   int time_of_day_min = dt.hour * 60 + dt.min;
   int session_start_min = InpSessionStartHour * 60 + InpSessionStartMinute;
   int entry_end_min     = InpEntryEndHour * 60 + InpEntryEndMinute;
   int session_end_min   = InpSessionEndHour * 60 + InpSessionEndMinute;

   // 1. Deteccion de nuevo dia: reiniciar Rango de Apertura y buffer de ROC
   if(day_key != g_current_day)
   {
      g_current_day     = day_key;
      g_or_bar_count    = 0;
      g_or_ready        = false;
      g_or_high         = 0.0;
      g_or_low          = 0.0;
      g_roc0 = g_roc1 = g_roc2 = 0.0;
      g_roc_valid_count = 0;
      g_last_close      = 0.0;
   }

   // 2. Construccion del Rango de Apertura (primeras N_or velas M5 desde el inicio de sesion)
   if(time_of_day_min >= session_start_min && !g_or_ready)
   {
      if(g_or_bar_count == 0)
      {
         g_or_high = h1;
         g_or_low  = l1;
      }
      else
      {
         g_or_high = MathMax(g_or_high, h1);
         g_or_low  = MathMin(g_or_low, l1);
      }
      g_or_bar_count++;
      if(g_or_bar_count >= InpORBars)
         g_or_ready = true;
   }

   // 3. Actualizacion del buffer de ROC (aceleracion de momentum)
   if(g_last_close > 0.0)
   {
      double roc = (c1 - g_last_close) / g_last_close;
      g_roc2 = g_roc1;
      g_roc1 = g_roc0;
      g_roc0 = roc;
      if(g_roc_valid_count < 3) g_roc_valid_count++;
   }
   g_last_close = c1;

   // 4. Regimen de volatilidad MTF Diario
   double z_vol = 0.0, atr14_d1 = 0.0;
   if(!CalculateDailyZScore(z_vol, atr14_d1)) return;
   bool regime_ok = InpUseRegime ? (z_vol > InpZScoreThreshold) : true;

   // 5. Gestionar salidas de posiciones abiertas (Time-Stop / Cierre de Sesion)
   ManageOpenPositions(time_of_day_min, session_end_min);

   // HUD informativo
   string or_status = g_or_ready ? StringFormat("OR [%.5f - %.5f]", g_or_low, g_or_high) : StringFormat("Formando OR (%d/%d)", g_or_bar_count, InpORBars);
   string hud = StringFormat("[%s]\nSymbol: %s (M5)\nHora Servidor: %02d:%02d\n%s\nROC: %.5f / %.5f / %.5f\nZ-Score Vol: %.2f [%s]\nATR D1: %.5f",
                              InpStrategyID, _Symbol, dt.hour, dt.min, or_status,
                              g_roc0, g_roc1, g_roc2, z_vol,
                              z_vol > InpZScoreThreshold ? "EXPANSION" : "NORMAL/COMPRESION", atr14_d1);
   Comment(hud);

   // 6. Validar si ya hay posicion abierta para esta estrategia (un trade a la vez)
   int total_positions = 0;
   for(int i = 0; i < PositionsTotal(); i++)
   {
      if(PositionGetTicket(i) > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         total_positions++;
   }
   if(total_positions > 0) return;

   // Solo se buscan entradas dentro de la "hora dorada" post-apertura, con el OR ya definido
   bool within_entry_window = g_or_ready && time_of_day_min >= session_start_min && time_of_day_min <= entry_end_min;
   if(!within_entry_window || g_roc_valid_count < 3) return;

   bool momentum_long_ok  = InpUseMomentumFilter ? (g_roc0 > g_roc1 && g_roc1 > g_roc2 && g_roc0 > 0.0) : (g_roc0 > 0.0);
   bool momentum_short_ok = InpUseMomentumFilter ? (g_roc0 < g_roc1 && g_roc1 < g_roc2 && g_roc0 < 0.0) : (g_roc0 < 0.0);

   bool breakout_long  = c1 > g_or_high;
   bool breakout_short = c1 < g_or_low;

   // 7. DISPARO DE ENTRADAS CON TRIPLE BARRERA
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);

   double lot = NormalizeVolume(InpLotSize);

   if(breakout_long && momentum_long_ok && regime_ok)
   {
      double sl = NormalizeDouble(ask - (InpStopMultiplier * atr14_d1), digits);
      double tp = NormalizeDouble(ask + (InpProfitMultiplier * atr14_d1), digits);

      if(g_trade.Buy(lot, _Symbol, ask, sl, tp, "BUY_ORB_Momentum"))
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.5f,\"sl\":%.5f,\"tp\":%.5f,\"lot\":%.2f,\"or_high\":%.5f,\"z_score\":%.2f}",
                     ask, sl, tp, lot, g_or_high, z_vol);
      else
         PrintFormat("{\"event\":\"ORDER_REJECTED\",\"side\":\"BUY\",\"lot\":%.2f,\"retcode\":%d,\"description\":\"%s\"}",
                     lot, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
   }
   else if(breakout_short && momentum_short_ok && regime_ok)
   {
      double sl = NormalizeDouble(bid + (InpStopMultiplier * atr14_d1), digits);
      double tp = NormalizeDouble(bid - (InpProfitMultiplier * atr14_d1), digits);

      if(g_trade.Sell(lot, _Symbol, bid, sl, tp, "SELL_ORB_Momentum"))
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.5f,\"sl\":%.5f,\"tp\":%.5f,\"lot\":%.2f,\"or_low\":%.5f,\"z_score\":%.2f}",
                     bid, sl, tp, lot, g_or_low, z_vol);
      else
         PrintFormat("{\"event\":\"ORDER_REJECTED\",\"side\":\"SELL\",\"lot\":%.2f,\"retcode\":%d,\"description\":\"%s\"}",
                     lot, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
   }
}
//+------------------------------------------------------------------+
