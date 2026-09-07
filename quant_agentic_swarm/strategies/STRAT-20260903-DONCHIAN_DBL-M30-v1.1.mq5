//+------------------------------------------------------------------+
//|                   STRAT-20260903-DONCHIAN_DBL-M30-v1.1.mq5       |
//|               QUANT AGENTIC SWARM (QAS) — MQL5 POO               |
//|                    Autor: QRT Solutions                          |
//|  Tesis: Ruptura de Canal de Donchian (N=20) con doble             |
//|  confirmacion de cierre. LONG-ONLY (el reporte de v1.0 mostro    |
//|  que el lado corto concentraba el 76% del drawdown maximo).      |
//|  Salida por Canal de Salida corto (N_exit=10, estilo Turtle      |
//|  Trading) en vez de Take Profit fijo, para dejar correr las      |
//|  tendencias en vez de cortarlas prematuramente.                  |
//|  Generico: aplicable a cualquier simbolo bursatil o CFD.         |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.10"
#property description "STRAT-20260903-DONCHIAN_DBL-M30-v1.1"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| BLOQUE 1: INPUTS DE USUARIO (CON SANITY CLAMPING)                |
//+------------------------------------------------------------------+
input group "1. Canal de Donchian (Entrada: Ruptura con Doble Confirmacion)"
input int      InpChannelPeriod     = 20;      // N: Periodos del Canal de Entrada

input group "1b. Canal de Salida (Trailing Exit estilo Turtle Trading)"
input int      InpExitChannelPeriod = 10;      // N_exit: Periodos del Canal de Salida (tipicamente N/2)

input group "2. Regimen de Volatilidad MTF (D1 - Lopez de Prado)"
input bool     InpUseRegime         = true;    // Activar Filtro Z-Score MTF
input int      InpFastAtrPeriod     = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod     = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow      = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold   = 0.67;    // Umbral Minimo Z-Score (Exigir Expansion de Volatilidad)

input group "3. Salidas: Triple Barrier Method (Barrera 1 = red de seguridad)"
input double   InpStopMultiplier    = 1.0;     // Barrera 2: Stop Loss inicial (-k2 * ATR D1)
input int      InpMaxHoldingBars    = 200;     // Barrera 3: Time-Stop Maximo (Barras M30, red de seguridad ultima)

input group "4. Gestion de Orden y Trazabilidad"
input double   InpLotSize           = 0.01;    // Tamaño de Lote Fijo
input ulong    InpMagicNumber       = 20260908; // Magic Number Unico
input string   InpStrategyID        = "STRAT-20260903-DONCHIAN_DBL-M30-v1.1";

//+------------------------------------------------------------------+
//| CLASE UTILIDAD: DETECTOR DE NUEVA BARRA (TIMEFRAME FIJO M30)     |
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

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0 ||
      InpLotSize <= 0 || InpChannelPeriod <= 0 || InpExitChannelPeriod <= 0)
   {
      Print("[ERROR] Parametros de entrada fuera de rango.");
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

   PrintFormat("[OK] [%s] Inicializado con exito en %s (M30). N_entry=%d, N_exit=%d, Magic:%d (LONG-ONLY)",
               InpStrategyID, _Symbol, InpChannelPeriod, InpExitChannelPeriod, InpMagicNumber);
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
//| GESTION DE SALIDAS ABIERTAS                                      |
//| Prioridad: 1) Canal de Salida (trailing, Turtle) 2) Time-Stop    |
//+------------------------------------------------------------------+
void ManageOpenPositions(double exit_channel_low, double close1)
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket <= 0) continue;

      if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_M30, open_time);

         bool exit_channel_hit = (close1 < exit_channel_low);
         bool time_stop_hit    = (bars_held >= InpMaxHoldingBars);

         if(exit_channel_hit || time_stop_hit)
         {
            string reason = exit_channel_hit ? "TRAILING_EXIT_CHANNEL" : "B3_TIME_STOP";
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
   // Ejecucion estrictamente al cierre de vela M30 (0 repainting)
   if(!g_bar_detector.IsNewBar(PERIOD_M30))
      return;

   // Guarda de calentamiento
   int bars_needed = MathMax(InpChannelPeriod, InpExitChannelPeriod) + 3;
   if(BarsCalculated(g_handle_atr14_d1) < InpSlowAtrPeriod + InpZScoreWindow + 5 ||
      Bars(_Symbol, PERIOD_M30) < bars_needed + 5)
      return;

   // 1. Canal de Donchian de ENTRADA: shift 3 a shift (InpChannelPeriod+2)
   double channel_high = -DBL_MAX;
   for(int s = 3; s <= InpChannelPeriod + 2; s++)
   {
      double h = iHigh(_Symbol, PERIOD_M30, s);
      if(h > channel_high) channel_high = h;
   }

   // 2. Canal de SALIDA (mas corto, trailing): shift 2 a shift (InpExitChannelPeriod+1)
   double exit_channel_low = DBL_MAX;
   for(int s = 2; s <= InpExitChannelPeriod + 1; s++)
   {
      double l = iLow(_Symbol, PERIOD_M30, s);
      if(l < exit_channel_low) exit_channel_low = l;
   }

   double close1 = iClose(_Symbol, PERIOD_M30, 1);
   double close2 = iClose(_Symbol, PERIOD_M30, 2);

   // 3. Doble confirmacion de ruptura alcista (LONG-ONLY)
   bool breakout_long = (close2 > channel_high) && (close1 > channel_high);

   // 4. Regimen de volatilidad MTF Diario
   double z_vol = 0.0, atr14_d1 = 0.0;
   if(!CalculateDailyZScore(z_vol, atr14_d1)) return;
   bool regime_ok = InpUseRegime ? (z_vol > InpZScoreThreshold) : true;

   // 5. Gestionar salidas de posiciones abiertas (Trailing Exit + Time-Stop)
   ManageOpenPositions(exit_channel_low, close1);

   // HUD informativo
   string hud = StringFormat("[%s]\nSymbol: %s (M30) [LONG-ONLY]\nCanal Entrada N=%d: High=%.5f\nCanal Salida N_exit=%d: Low=%.5f\nZ-Score Vol: %.2f [%s]\nATR D1: %.5f",
                              InpStrategyID, _Symbol, InpChannelPeriod, channel_high, InpExitChannelPeriod, exit_channel_low, z_vol,
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

   if(!breakout_long || !regime_ok) return;

   // 7. DISPARO DE ENTRADA (solo largo). Sin TP fijo: la salida real es el canal de salida.
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   double lot = NormalizeVolume(InpLotSize);

   double sl = NormalizeDouble(ask - (InpStopMultiplier * atr14_d1), digits);

   if(g_trade.Buy(lot, _Symbol, ask, sl, 0.0, "BUY_Donchian_TurtleExit"))
      PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.5f,\"sl\":%.5f,\"lot\":%.2f,\"channel_high\":%.5f,\"z_score\":%.2f}",
                  ask, sl, lot, channel_high, z_vol);
   else
      PrintFormat("{\"event\":\"ORDER_REJECTED\",\"side\":\"BUY\",\"lot\":%.2f,\"retcode\":%d,\"description\":\"%s\"}",
                  lot, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
}
//+------------------------------------------------------------------+
