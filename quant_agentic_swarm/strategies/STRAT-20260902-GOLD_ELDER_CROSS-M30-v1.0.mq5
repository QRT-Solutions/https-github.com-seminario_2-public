//+------------------------------------------------------------------+
//|                      STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0.mq5|
//|               QUANT AGENTIC SWARM (QAS) — MQL5 POO               |
//|                    Autor: QRT Solutions                          |
//|  Tesis: Cruce EMA 9/21 en M30 con Filtro Macro EMA 200 (Elder)   |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| ENUMERACIONES                                                    |
//+------------------------------------------------------------------+
enum ENUM_VOL_REGIME
{
   REGIME_LOW = 0,    // Baja Volatilidad (Compresion)
   REGIME_MEDIUM = 1, // Volatilidad Media (Normal)
   REGIME_HIGH = 2    // Alta Volatilidad (Expansion)
};

//+------------------------------------------------------------------+
//| BLOQUE 1: INPUTS DE USUARIO (CON SANITY CLAMPING)                |
//+------------------------------------------------------------------+
input group "1. Medias Moviles & Filtro Macro (Elder Triple Screen)"
input int      InpFastPeriod       = 9;       // Periodo Media Rapida (EMA M30)
input int      InpSlowPeriod       = 21;      // Periodo Media Lenta (EMA M30)
input int      InpFilterPeriod     = 200;     // Periodo Media Filtro Macro (EMA M30)
input bool     InpFilterSlope      = true;    // Exigir Pendiente en Media Filtro (d/dt >= 0)

input group "2. Regimen de Volatilidad MTF (D1 - Lopez de Prado)"
input bool     InpUseRegime        = true;    // Activar Filtro Z-Score MTF
input int      InpFastAtrPeriod    = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod    = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow     = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold  = -0.67;   // Umbral Minimo Z-Score (Excluir Compresion Extrema)

input group "3. Salidas: Triple Barrier Method"
input double   InpProfitMultiplier = 1.5;     // Barrera 1: Take Profit (+k1 * ATR D1)
input double   InpStopMultiplier   = 0.75;    // Barrera 2: Stop Loss (-k2 * ATR D1)
input int      InpMaxHoldingBars   = 32;      // Barrera 3: Time-Stop Maximo (Barras M30)
input bool     InpExitOnCross      = true;    // Salida Preventiva por Cruce Inverso + Violacion Filtro

input group "4. Gestion de Orden y Trazabilidad"
input double   InpLotSize          = 0.01;    // Tamaño de Lote Fijo (Seguro para Oro)
input ulong    InpMagicNumber      = 20260902;// Magic Number Unico
input string   InpStrategyID       = "STRAT-20260902-GOLD_ELDER_CROSS-M30-v1.0";

//+------------------------------------------------------------------+
//| CLASE UTILIDAD: DETECTOR DE NUEVA BARRA                          |
//+------------------------------------------------------------------+
class CIsNewBar
{
private:
   datetime m_last_bar_time;
public:
   CIsNewBar() { m_last_bar_time = 0; }
   bool IsNewBar(ENUM_TIMEFRAMES tf = PERIOD_CURRENT)
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

int         g_handle_fast_ma   = INVALID_HANDLE;
int         g_handle_slow_ma   = INVALID_HANDLE;
int         g_handle_filter_ma = INVALID_HANDLE;
int         g_handle_atr5_d1   = INVALID_HANDLE;
int         g_handle_atr14_d1  = INVALID_HANDLE;

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpProfitMultiplier <= 0 || InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0 || InpLotSize <= 0)
   {
      Print("[ERROR] Parametros de Triple Barrera o Lote incorrectos.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetMarginMode();
   g_trade.SetTypeFillingBySymbol(_Symbol);

   // Crear handles de medias en timeframe actual (M30)
   g_handle_fast_ma   = iMA(_Symbol, PERIOD_CURRENT, InpFastPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_handle_slow_ma   = iMA(_Symbol, PERIOD_CURRENT, InpSlowPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_handle_filter_ma = iMA(_Symbol, PERIOD_CURRENT, InpFilterPeriod, 0, MODE_EMA, PRICE_CLOSE);

   // Crear handles de ATR en timeframe Diario (D1)
   g_handle_atr5_d1   = iATR(_Symbol, PERIOD_D1, InpFastAtrPeriod);
   g_handle_atr14_d1  = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);

   if(g_handle_fast_ma == INVALID_HANDLE || g_handle_slow_ma == INVALID_HANDLE || 
      g_handle_filter_ma == INVALID_HANDLE || g_handle_atr5_d1 == INVALID_HANDLE || 
      g_handle_atr14_d1 == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar handles de indicadores.");
      return(INIT_FAILED);
   }

   PrintFormat("[OK] [%s] Inicializado con exito en %s. Fast:%d, Slow:%d, Filter:%d, Magic:%d",
               InpStrategyID, _Symbol, InpFastPeriod, InpSlowPeriod, InpFilterPeriod, InpMagicNumber);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| FUNCION DE DESINICIALIZACION (OnDeinit)                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_handle_fast_ma);
   IndicatorRelease(g_handle_slow_ma);
   IndicatorRelease(g_handle_filter_ma);
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
   {
      sum_sq += MathPow(diffs[i] - mean, 2.0);
   }

   double stdev = MathSqrt(sum_sq / (double)InpZScoreWindow);
   if(stdev > 0.0)
      out_zscore = (diffs[0] - mean) / stdev;
   else
      out_zscore = 0.0;

   return true;
}

//+------------------------------------------------------------------+
//| GESTION DE SALIDAS (BARRERA 3: TIME STOP Y REVERSION)            |
//+------------------------------------------------------------------+
void ManageOpenPositions(double fast_cur, double slow_cur, double filter_cur)
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket <= 0) continue;

      if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Calcular barras transcurridas en M30
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);

         // BARRERA 3: Time-Stop Maximo
         if(bars_held >= InpMaxHoldingBars)
         {
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%I64u,\"bars_held\":%d}", ticket, bars_held);
            g_trade.PositionClose(ticket);
            continue;
         }

         // Salida preventiva por reversion macro
         if(InpExitOnCross)
         {
            double close1 = iClose(_Symbol, PERIOD_CURRENT, 1);
            if(pos_type == POSITION_TYPE_BUY && fast_cur < slow_cur && close1 < filter_cur)
            {
               PrintFormat("{\"event\":\"EXIT\",\"reason\":\"MACRO_REVERSAL_BUY\",\"ticket\":%I64u}", ticket);
               g_trade.PositionClose(ticket);
               continue;
            }
            else if(pos_type == POSITION_TYPE_SELL && fast_cur > slow_cur && close1 > filter_cur)
            {
               PrintFormat("{\"event\":\"EXIT\",\"reason\":\"MACRO_REVERSAL_SELL\",\"ticket\":%I64u}", ticket);
               g_trade.PositionClose(ticket);
               continue;
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
   // Ejecucion estrictamente al cierre de barra M30 (0 repainting)
   if(!g_bar_detector.IsNewBar(PERIOD_CURRENT))
      return;

   // Guarda de calentamiento
   if(BarsCalculated(g_handle_filter_ma) < InpFilterPeriod + 5 ||
      BarsCalculated(g_handle_atr14_d1) < InpSlowAtrPeriod + InpZScoreWindow + 5)
   {
      return;
   }

   // 1. Obtener valores de medias en barras cerradas [1] y [2]
   double fast_ma[], slow_ma[], filter_ma[];
   ArraySetAsSeries(fast_ma, true);
   ArraySetAsSeries(slow_ma, true);
   ArraySetAsSeries(filter_ma, true);

   if(CopyBuffer(g_handle_fast_ma, 0, 1, 3, fast_ma) < 3) return;
   if(CopyBuffer(g_handle_slow_ma, 0, 1, 3, slow_ma) < 3) return;
   if(CopyBuffer(g_handle_filter_ma, 0, 1, 3, filter_ma) < 3) return;

   double close1 = iClose(_Symbol, PERIOD_CURRENT, 1);

   // 2. Evaluar condiciones de la media filtro y su pendiente
   bool slope_up   = filter_ma[0] >= filter_ma[1];
   bool slope_down = filter_ma[0] <= filter_ma[1];

   bool macro_long_ok  = (close1 > filter_ma[0]) && (InpFilterSlope ? slope_up : true);
   bool macro_short_ok = (close1 < filter_ma[0]) && (InpFilterSlope ? slope_down : true);

   // 3. Evaluar cruces en barras cerradas
   bool cross_bull = (fast_ma[0] > slow_ma[0]) && (fast_ma[1] <= slow_ma[1]);
   bool cross_bear = (fast_ma[0] < slow_ma[0]) && (fast_ma[1] >= slow_ma[1]);

   // 4. Evaluar regimen de volatilidad MTF Diario
   double z_vol = 0.0, atr14_d1 = 0.0;
   if(!CalculateDailyZScore(z_vol, atr14_d1)) return;

   bool regime_ok = InpUseRegime ? (z_vol >= InpZScoreThreshold) : true;

   // Actualizar HUD informativo
   string hud = StringFormat("[%s]\nSymbol: %s (M30)\nMacro Filter: %s\nZ-Score Vol: %.2f [%s]\nATR D1: %.2f",
                             InpStrategyID, _Symbol,
                             close1 > filter_ma[0] ? "ALCISTA (Close > 200)" : "BAJISTA (Close < 200)",
                             z_vol, z_vol > 0.67 ? "ALTA" : z_vol < -0.67 ? "BAJA" : "MEDIA",
                             atr14_d1);
   Comment(hud);

   // 5. Gestionar salidas de posiciones abiertas (Time-Stop / Reversion)
   ManageOpenPositions(fast_ma[0], slow_ma[0], filter_ma[0]);

   // 6. Validar si ya hay posicion abierta para esta estrategia
   int total_positions = 0;
   for(int i = 0; i < PositionsTotal(); i++)
   {
      if(PositionGetTicket(i) > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         total_positions++;
   }

   if(total_positions > 0) return; // Un trade a la vez

   // 7. DISPARO DE ENTRADAS CON TRIPLE BARRERA
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);

   if(cross_bull && macro_long_ok && regime_ok)
   {
      double sl = NormalizeDouble(ask - (InpStopMultiplier * atr14_d1), digits);
      double tp = NormalizeDouble(ask + (InpProfitMultiplier * atr14_d1), digits);

      if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, "BUY_Elder_Triple_Barrier"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"z_score\":%.2f}",
                     ask, sl, tp, z_vol);
      }
   }
   else if(cross_bear && macro_short_ok && regime_ok)
   {
      double sl = NormalizeDouble(bid + (InpStopMultiplier * atr14_d1), digits);
      double tp = NormalizeDouble(bid - (InpProfitMultiplier * atr14_d1), digits);

      if(g_trade.Sell(InpLotSize, _Symbol, bid, sl, tp, "SELL_Elder_Triple_Barrier"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"z_score\":%.2f}",
                     bid, sl, tp, z_vol);
      }
   }
}
