//+------------------------------------------------------------------+
//|                   STRAT-20260903-3WHITESOLDIERS-H4-v1.0.mq5      |
//|               QUANT AGENTIC SWARM (QAS) — MQL5 POO               |
//|                    Autor: QRT Solutions                          |
//|  Tesis: Patron de velas Three White Soldiers (Nison) con filtro  |
//|  de tendencia bajista previa. Estrategia solo-largo (long-only). |
//|  Generico: aplicable a cualquier simbolo bursatil o CFD.         |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "STRAT-20260903-3WHITESOLDIERS-H4-v1.0"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| BLOQUE 1: INPUTS DE USUARIO (CON SANITY CLAMPING)                |
//+------------------------------------------------------------------+
input group "1. Patron de Velas (Three White Soldiers) - Nucleo (siempre activo)"
input double   InpMinBodyRatio      = 0.6;     // Cuerpo Real Minimo (fraccion del rango H-L)
input double   InpMaxUpperWickRatio = 0.25;    // Mecha Superior Maxima (fraccion del cuerpo)
input bool     InpUseQualityFilters = true;    // Exigir Cuerpo/Mecha (false = solo vela alcista simple)

input group "1b. Filtro de Tendencia Previa"
input bool     InpUseTrendFilter    = true;    // Activar Filtro de Tendencia Bajista Previa
input int      InpTrendEmaPeriod    = 50;      // Periodo EMA de Tendencia Previa
input int      InpTrendLookback     = 5;       // Velas Previas que Deben Estar Bajo la EMA

input group "2. Regimen de Volatilidad MTF (D1 - Lopez de Prado)"
input bool     InpUseRegime         = true;    // Activar Filtro Z-Score MTF
input int      InpFastAtrPeriod     = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod     = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow      = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold   = 0.67;    // Umbral Minimo Z-Score (Exigir Expansion de Volatilidad)

input group "3. Salidas: Triple Barrier Method"
input double   InpProfitMultiplier  = 2.5;     // Barrera 1: Take Profit (+k1 * ATR D1)
input double   InpStopMultiplier    = 0.75;    // Barrera 2: Stop Loss (-k2 * ATR D1)
input int      InpMaxHoldingBars    = 24;      // Barrera 3: Time-Stop Maximo (Barras H4)

input group "4. Gestion de Orden y Trazabilidad"
input double   InpLotSize           = 0.01;    // Tamaño de Lote Fijo
input ulong    InpMagicNumber       = 20260905; // Magic Number Unico
input string   InpStrategyID        = "STRAT-20260903-3WHITESOLDIERS-H4-v1.0";

//+------------------------------------------------------------------+
//| CLASE UTILIDAD: DETECTOR DE NUEVA BARRA (TIMEFRAME FIJO H4)      |
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
int         g_handle_ema_trend = INVALID_HANDLE;

// Contadores de diagnostico (para aislar por que no dispara la entrada)
int         g_diag_bars_evaluated = 0;
int         g_diag_pattern_ok     = 0;
int         g_diag_trend_ok       = 0;
int         g_diag_regime_ok      = 0;
int         g_diag_all_ok         = 0;

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpProfitMultiplier <= 0 || InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0 ||
      InpLotSize <= 0 || InpTrendEmaPeriod <= 0 || InpTrendLookback <= 0 ||
      InpMinBodyRatio <= 0 || InpMinBodyRatio > 1 || InpMaxUpperWickRatio < 0)
   {
      Print("[ERROR] Parametros de entrada fuera de rango.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetMarginMode();
   g_trade.SetTypeFillingBySymbol(_Symbol);

   g_handle_atr5_d1   = iATR(_Symbol, PERIOD_D1, InpFastAtrPeriod);
   g_handle_atr14_d1  = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);
   g_handle_ema_trend = iMA(_Symbol, PERIOD_H4, InpTrendEmaPeriod, 0, MODE_EMA, PRICE_CLOSE);

   if(g_handle_atr5_d1 == INVALID_HANDLE || g_handle_atr14_d1 == INVALID_HANDLE || g_handle_ema_trend == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar handles de indicadores.");
      return(INIT_FAILED);
   }

   PrintFormat("[OK] [%s] Inicializado con exito en %s (H4). Magic:%d", InpStrategyID, _Symbol, InpMagicNumber);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| FUNCION DE DESINICIALIZACION (OnDeinit)                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_handle_atr5_d1);
   IndicatorRelease(g_handle_atr14_d1);
   IndicatorRelease(g_handle_ema_trend);
   Comment("");
   PrintFormat("{\"event\":\"DIAGNOSTIC_SUMMARY\",\"bars_evaluated\":%d,\"pattern_ok\":%d,\"pattern+trend_ok\":%d,\"pattern+trend+regime_ok\":%d}",
               g_diag_bars_evaluated, g_diag_pattern_ok, g_diag_trend_ok, g_diag_regime_ok);
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
//| VALIDACION DE UNA VELA INDIVIDUAL (CUERPO Y MECHA)               |
//+------------------------------------------------------------------+
bool IsQualitySoldier(double o, double h, double l, double c)
{
   if(c <= o) return false; // debe ser alcista

   if(!InpUseQualityFilters) return true; // modo simple: solo exige vela alcista

   double range = h - l;
   if(range <= 0.0) return false;

   double body = c - o;
   double upper_wick = h - c;

   bool body_ok  = (body >= InpMinBodyRatio * range);
   bool wick_ok  = (body > 0.0) ? (upper_wick <= InpMaxUpperWickRatio * body) : false;

   return body_ok && wick_ok;
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
         int bars_held = iBarShift(_Symbol, PERIOD_H4, open_time);

         if(bars_held >= InpMaxHoldingBars)
         {
            if(g_trade.PositionClose(ticket))
            {
               PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%I64u,\"bars_held\":%d}", ticket, bars_held);
            }
            else
            {
               PrintFormat("{\"event\":\"EXIT_RETRY\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%I64u,\"bars_held\":%d,\"retcode\":%d,\"description\":\"%s\"}",
                           ticket, bars_held, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
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
   // Ejecucion estrictamente al cierre de vela H4 (0 repainting)
   if(!g_bar_detector.IsNewBar(PERIOD_H4))
      return;

   // Guarda de calentamiento
   if(BarsCalculated(g_handle_atr14_d1) < InpSlowAtrPeriod + InpZScoreWindow + 5 ||
      BarsCalculated(g_handle_ema_trend) < InpTrendEmaPeriod + InpTrendLookback + 5)
      return;

   // 1. Obtener OHLC de los 3 soldados: shift 3 (mas antiguo) a shift 1 (mas reciente)
   double o1=iOpen(_Symbol,PERIOD_H4,1), h1=iHigh(_Symbol,PERIOD_H4,1), l1=iLow(_Symbol,PERIOD_H4,1), c1=iClose(_Symbol,PERIOD_H4,1);
   double o2=iOpen(_Symbol,PERIOD_H4,2), h2=iHigh(_Symbol,PERIOD_H4,2), l2=iLow(_Symbol,PERIOD_H4,2), c2=iClose(_Symbol,PERIOD_H4,2);
   double o3=iOpen(_Symbol,PERIOD_H4,3), h3=iHigh(_Symbol,PERIOD_H4,3), l3=iLow(_Symbol,PERIOD_H4,3), c3=iClose(_Symbol,PERIOD_H4,3);

   // 2. Validar cada soldado individualmente (alcista, cuerpo dominante, mecha pequeña)
   bool soldier1_ok = IsQualitySoldier(o3, h3, l3, c3); // primer soldado (mas antiguo)
   bool soldier2_ok = IsQualitySoldier(o2, h2, l2, c2);
   bool soldier3_ok = IsQualitySoldier(o1, h1, l1, c1); // tercer soldado (mas reciente)

   // 3. Cierres crecientes
   bool closes_increasing = (c1 > c2) && (c2 > c3);

   // 4. Cada apertura dentro del cuerpo real de la vela anterior
   bool open2_in_body1 = (o2 >= MathMin(o3, c3)) && (o2 <= MathMax(o3, c3));
   bool open1_in_body2 = (o1 >= MathMin(o2, c2)) && (o1 <= MathMax(o2, c2));

   bool pattern_ok = soldier1_ok && soldier2_ok && soldier3_ok && closes_increasing && open2_in_body1 && open1_in_body2;

   g_diag_bars_evaluated++;
   if(pattern_ok)
   {
      g_diag_pattern_ok++;
      PrintFormat("{\"event\":\"PATTERN_DETECTED\",\"time\":\"%s\"}", TimeToString(iTime(_Symbol,PERIOD_H4,1)));
   }

   // 5. Filtro de tendencia previa (OPCIONAL): las InpTrendLookback velas antes del primer soldado deben estar bajo la EMA
   bool trend_ok = true;
   if(InpUseTrendFilter)
   {
      double ema_buf[];
      ArraySetAsSeries(ema_buf, true);
      int ema_needed = 3 + InpTrendLookback;
      trend_ok = false;
      if(pattern_ok && CopyBuffer(g_handle_ema_trend, 0, 1, ema_needed, ema_buf) == ema_needed)
      {
         trend_ok = true;
         for(int j = 0; j < InpTrendLookback; j++)
         {
            int shift_idx = 3 + j; // velas 4..(3+InpTrendLookback) en shift, 0-based en el buffer (shift1=idx0)
            double close_j = iClose(_Symbol, PERIOD_H4, shift_idx + 1);
            if(close_j >= ema_buf[shift_idx])
            {
               trend_ok = false;
               break;
            }
         }
      }
   }

   if(pattern_ok && trend_ok) g_diag_trend_ok++;

   // 6. Regimen de volatilidad MTF Diario
   double z_vol = 0.0, atr14_d1 = 0.0;
   if(!CalculateDailyZScore(z_vol, atr14_d1)) return;
   bool regime_ok = InpUseRegime ? (z_vol > InpZScoreThreshold) : true;

   if(pattern_ok && trend_ok && regime_ok) { g_diag_regime_ok++; g_diag_all_ok++; }

   // 7. Gestionar salidas de posiciones abiertas (Time-Stop)
   ManageOpenPositions();

   // HUD informativo
   string hud = StringFormat("[%s]\nSymbol: %s (H4)\nPatron valido: %s\nTendencia previa OK: %s\nZ-Score Vol: %.2f [%s]\nATR D1: %.5f",
                              InpStrategyID, _Symbol, pattern_ok ? "SI" : "no",
                              trend_ok ? "SI" : "no", z_vol,
                              z_vol > InpZScoreThreshold ? "EXPANSION" : "NORMAL/COMPRESION", atr14_d1);
   Comment(hud);

   // 8. Validar si ya hay posicion abierta (un trade a la vez, estrategia solo-largo)
   int total_positions = 0;
   for(int i = 0; i < PositionsTotal(); i++)
   {
      if(PositionGetTicket(i) > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         total_positions++;
   }
   if(total_positions > 0) return;

   if(!pattern_ok || !trend_ok || !regime_ok) return;

   // 9. DISPARO DE ENTRADA CON TRIPLE BARRERA (solo largo)
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   double lot = NormalizeVolume(InpLotSize);

   double sl = NormalizeDouble(l3 - (InpStopMultiplier * atr14_d1), digits); // SL: bajo el minimo del primer soldado, colchon ATR
   double tp = NormalizeDouble(ask + (InpProfitMultiplier * atr14_d1), digits);

   if(g_trade.Buy(lot, _Symbol, ask, sl, tp, "BUY_3WhiteSoldiers"))
      PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.5f,\"sl\":%.5f,\"tp\":%.5f,\"lot\":%.2f,\"z_score\":%.2f}",
                  ask, sl, tp, lot, z_vol);
   else
      PrintFormat("{\"event\":\"ORDER_REJECTED\",\"side\":\"BUY\",\"lot\":%.2f,\"retcode\":%d,\"description\":\"%s\"}",
                  lot, g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
}
//+------------------------------------------------------------------+
