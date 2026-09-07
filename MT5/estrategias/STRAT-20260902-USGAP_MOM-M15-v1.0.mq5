//+------------------------------------------------------------------+
//|                          STRAT-20260902-USGAP_MOM-M15-v1.0.mq5  |
//|                                  Copyright 2026, QRT Solutions   |
//|                    https://github.com/felipemillar/seminario_2   |
//|  Tesis: US Opening Gap Momentum Continuation (Crabel & Prado)    |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/felipemillar/seminario_2"
#property version     "1.01"
#property description "US Opening Gap Momentum Continuation con Z-Score D1 y Triple Barrier Method"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| ENUMERACIONES Y TIPOS                                            |
//+------------------------------------------------------------------+
enum ENUM_VOL_REGIME
{
   REGIME_LOW    = 0, // Baja Volatilidad (Compresion)
   REGIME_MEDIUM = 1, // Volatilidad Media (Normal)
   REGIME_HIGH   = 2  // Alta Volatilidad (Expansion)
};

enum ENUM_GAP_DIR
{
   GAP_NONE = 0,
   GAP_UP   = 1,
   GAP_DOWN = -1
};

//+------------------------------------------------------------------+
//| INPUTS DE USUARIO (CON SANITY CHECKS)                            |
//+------------------------------------------------------------------+
input group "1. Deteccion de Gap de Apertura"
input double   InpGapThresholdATR  = 1.0;     // Umbral de Gap (k_gap * ATR_D14)
input double   InpMaxRetracePct    = 0.5;     // Retroceso Maximo Permitido (0.0 a 1.0) en vela confirmacion
input int      InpSessionStartHour = 16;      // Hora Servidor Apertura US (16 en GMT+3 / 15 en GMT+2 para 09:30 ET)
input int      InpSessionStartMin  = 30;      // Minuto Servidor Apertura US (30 para 09:30 ET)

input group "2. Regimen de Volatilidad MTF (D1) - Lopez de Prado"
input int      InpFastAtrPeriod    = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod    = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow     = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold  = 0.67;    // Umbral Z-Score Alta Volatilidad (Expansion)

input group "3. Salidas: Triple Barrier Method"
input double   InpProfitMultiplier = 2.0;     // B1: Take Profit (* ATR D14 cerrado)
input double   InpStopMultiplier   = 1.0;     // B2: Stop Loss (* ATR M15 intradia)
input int      InpMaxHoldingBars   = 26;      // B3: Limite Temporal (26 barras M15 = 6.5h RTH)
input bool     InpUseEarlyInvalid  = true;    // Activar Salida por Invalidacion Temprana (Primeros 30 min)

input group "4. Gestion de Posicion y Ejecucion"
input double   InpLotSize          = 0.10;    // Tamaño de Lote Fijo
input ulong    InpMagicNumber      = 20260902;// Magic Number Unico
input string   InpStrategyID       = "STRAT-20260902-USGAP_MOM-M15-v1.0"; // Strategy ID

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
CIsNewBar   g_bar_detector_m15;
int         g_handle_atr5_d1  = INVALID_HANDLE;
int         g_handle_atr14_d1 = INVALID_HANDLE;
int         g_handle_atr_m15  = INVALID_HANDLE;

// Estado del gap del dia en curso
ENUM_GAP_DIR g_gap_direction      = GAP_NONE;
double       g_gap_value          = 0.0;
double       g_session_open       = 0.0;
datetime     g_last_processed_day = 0;
datetime     g_entry_time         = 0;
ulong        g_active_ticket      = 0;

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpProfitMultiplier <= 0 || InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0 || InpGapThresholdATR <= 0)
   {
      Print("[ERROR] Parametros de Gap/Triple Barrera incorrectos. Deben ser mayores a 0.");
      return(INIT_PARAMETERS_INCORRECT);
   }
   if(InpSessionStartHour < 0 || InpSessionStartHour > 23 || InpSessionStartMin < 0 || InpSessionStartMin > 59)
   {
      Print("[ERROR] Hora o minuto de sesion invalidos.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetDeviationInPoints(20);

   g_handle_atr5_d1  = iATR(_Symbol, PERIOD_D1, InpFastAtrPeriod);
   g_handle_atr14_d1 = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);
   g_handle_atr_m15  = iATR(_Symbol, PERIOD_CURRENT, 14);

   if(g_handle_atr5_d1 == INVALID_HANDLE || g_handle_atr14_d1 == INVALID_HANDLE || g_handle_atr_m15 == INVALID_HANDLE)
   {
      Print("[ERROR] No se pudieron inicializar los handles de ATR.");
      return(INIT_FAILED);
   }

   PrintFormat("[INIT OK] %s inicializado correctamente por QRT Solutions.", InpStrategyID);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| FUNCION DE DESINICIALIZACION (OnDeinit)                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_handle_atr5_d1);
   IndicatorRelease(g_handle_atr14_d1);
   IndicatorRelease(g_handle_atr_m15);
   Comment("");
}

//+------------------------------------------------------------------+
//| CALCULO DEL Z-SCORE DE VOLATILIDAD DIARIA (LOPEZ DE PRADO)       |
//+------------------------------------------------------------------+
ENUM_VOL_REGIME CalculateDailyVolatilityZScore(double &out_zscore, double &out_atr5, double &out_atr14)
{
   double atr5_buf[], atr14_buf[];
   ArraySetAsSeries(atr5_buf, true);
   ArraySetAsSeries(atr14_buf, true);

   // Lectura segura desde shift 1 para cero repainting
   if(CopyBuffer(g_handle_atr5_d1,  0, 1, InpZScoreWindow, atr5_buf)  < InpZScoreWindow ||
      CopyBuffer(g_handle_atr14_d1, 0, 1, InpZScoreWindow, atr14_buf) < InpZScoreWindow)
   {
      out_zscore = 0.0;
      return(REGIME_MEDIUM);
   }

   out_atr5  = atr5_buf[0];
   out_atr14 = atr14_buf[0];

   double diff_buf[];
   ArrayResize(diff_buf, InpZScoreWindow);
   double sum = 0.0;

   for(int i = 0; i < InpZScoreWindow; i++)
   {
      diff_buf[i] = atr5_buf[i] - atr14_buf[i];
      sum += diff_buf[i];
   }

   double mean = sum / (double)InpZScoreWindow;
   double sq_diff = 0.0;
   for(int i = 0; i < InpZScoreWindow; i++)
      sq_diff += MathPow(diff_buf[i] - mean, 2.0);

   // Desviacion estandar muestral (N - 1) identica a ta.stdev de Pine Script
   double stdev = (InpZScoreWindow > 1) ? MathSqrt(sq_diff / (double)(InpZScoreWindow - 1)) : 0.0;
   out_zscore = (stdev > 0.0) ? (diff_buf[0] - mean) / stdev : 0.0;

   if(out_zscore > InpZScoreThreshold)  return(REGIME_HIGH);
   if(out_zscore < -InpZScoreThreshold) return(REGIME_LOW);
   return(REGIME_MEDIUM);
}

//+------------------------------------------------------------------+
//| BUCLE PRINCIPAL DE EJECUCION (OnTick)                            |
//+------------------------------------------------------------------+
void OnTick()
{
   // 1. Guarda de Calentamiento de Datos D1
   int d1_bars = Bars(_Symbol, PERIOD_D1);
   if(d1_bars < (InpSlowAtrPeriod + InpZScoreWindow))
   {
      Comment(StringFormat("[WARMUP] Esperando historial D1 (%d/%d barras)...", d1_bars, InpSlowAtrPeriod + InpZScoreWindow));
      return;
   }

   double years_d1 = (double)d1_bars / 252.0;
   double z_score = 0.0, atr5_d1 = 0.0, atr14_d1 = 0.0;
   ENUM_VOL_REGIME vol_regime = CalculateDailyVolatilityZScore(z_score, atr5_d1, atr14_d1);

   // 2. Actualizacion de HUD Institucional en Pantalla
   string history_badge = (years_d1 >= 5.0) ? StringFormat("%.1f Anos (%d D1) [OK]", years_d1, d1_bars) :
                                              StringFormat("%.1f Anos [ALERTA: < 5 ANOS]", years_d1);
   string regime_str = (vol_regime == REGIME_HIGH) ? "ALTA (EXPANSION) [PERMITIDO]" :
                       (vol_regime == REGIME_LOW)  ? "BAJA (COMPRESION) [BLOQUEADO]" : "MEDIA (ESTACIONARIA) [BLOQUEADO]";
   string gap_str = (g_gap_direction == GAP_UP) ? "ALCISTA" : (g_gap_direction == GAP_DOWN) ? "BAJISTA" : "SIN GAP VALIDO";

   string hud_text = StringFormat("=== %s (QRT Solutions) ===\n"
                                  "Historial D1: %s\n"
                                  "Regimen Volatilidad: %s (Z=%.2f)\n"
                                  "Gap Detectado: %s (%.2f pts)\n"
                                  "Precio Open Sesion: %.2f\n"
                                  "ATR D1 Cerrado: ATR5=%.2f | ATR14=%.2f\n"
                                  "Triple Barrera: B1=+%.1fx ATR_D | B2=-%.1fx ATR_M15 | B3=%db\n"
                                  "Estado: OPERATIVO",
                                  InpStrategyID, history_badge, regime_str, z_score, gap_str, g_gap_value, g_session_open,
                                  atr5_d1, atr14_d1, InpProfitMultiplier, InpStopMultiplier, InpMaxHoldingBars);
   Comment(hud_text);

   // 3. Gestion de Posiciones Abiertas (Triple Barrier + Criterio de Invalidacion)
   if(PositionsTotal() > 0)
   {
      for(int i = PositionsTotal() - 1; i >= 0; i--)
      {
         ulong ticket = PositionGetTicket(i);
         if(ticket > 0 && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         {
            datetime pos_time = (datetime)PositionGetInteger(POSITION_TIME);
            int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, pos_time);
            ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

            // Barrera 3: Limite Temporal (Time-Stop)
            if(bars_held >= InpMaxHoldingBars)
            {
               g_trade.PositionClose(ticket);
               PrintFormat("{\"event\":\"EXIT_B3_TIME\", \"ticket\":%I64u, \"bars_held\":%d, \"time\":\"%s\"}",
                           ticket, bars_held, TimeToString(TimeCurrent()));
               continue;
            }

            // Criterio de Invalidacion Temprana (Primeras 2 barras M15 = 30 min):
            // Si el precio retrocede mas del 50% del gap en contra de la direccion, la tesis muere.
            if(InpUseEarlyInvalid && bars_held <= 2 && g_gap_direction != GAP_NONE)
            {
               double current_close = iClose(_Symbol, PERIOD_CURRENT, 1);
               bool invalidated = false;

               if(pos_type == POSITION_TYPE_BUY && g_gap_direction == GAP_UP)
               {
                  double retrace_level = g_session_open - (0.50 * g_gap_value);
                  if(current_close < retrace_level) invalidated = true;
               }
               else if(pos_type == POSITION_TYPE_SELL && g_gap_direction == GAP_DOWN)
               {
                  double retrace_level = g_session_open - (0.50 * g_gap_value); // gap_value es negativo
                  if(current_close > retrace_level) invalidated = true;
               }

               if(invalidated)
               {
                  g_trade.PositionClose(ticket);
                  PrintFormat("{\"event\":\"EXIT_INVALIDATION_30MIN\", \"ticket\":%I64u, \"bars_held\":%d, \"close\":%.2f}",
                              ticket, bars_held, current_close);
                  continue;
               }
            }
         }
      }
   }

   // 4. Evaluacion Sincronizada Estricta al Cierre de Barra M15 (IsNewBar)
   if(!g_bar_detector_m15.IsNewBar(PERIOD_CURRENT)) return;

   // 5. Deteccion de la Vela de Apertura de Sesion US (09:30 ET)
   datetime bar_time = iTime(_Symbol, PERIOD_CURRENT, 1); // Vela M15 recien cerrada
   MqlDateTime dt;
   TimeToStruct(bar_time, dt);
   datetime day_start = bar_time - (dt.hour * 3600 + dt.min * 60 + dt.sec);

   bool is_session_open_bar = (dt.hour == InpSessionStartHour && dt.min == InpSessionStartMin);
   if(!is_session_open_bar || day_start == g_last_processed_day) return;

   g_last_processed_day = day_start; // Evaluacion estrictamente unica por sesion diaria

   // Calculo fiel de la apertura de la sesion US respecto al cierre previo oficial D1
   double session_open_price = iOpen(_Symbol, PERIOD_CURRENT, 1); // Precio al inicio de la vela 09:30
   double prev_daily_close   = iClose(_Symbol, PERIOD_D1, 1);     // Cierre D1 cerrado anterior (shift 1)

   g_session_open = session_open_price;
   g_gap_value    = session_open_price - prev_daily_close;

   // Clasificacion direccional del gap frente a umbral k_gap * ATR_D1(14)
   double gap_threshold = InpGapThresholdATR * atr14_d1;
   if(g_gap_value >= gap_threshold)
      g_gap_direction = GAP_UP;
   else if(g_gap_value <= -gap_threshold)
      g_gap_direction = GAP_DOWN;
   else
      g_gap_direction = GAP_NONE;

   // Filtros de pureza institucional
   if(PositionsTotal() > 0) return;             // Solo operar si estamos planos (Flat)
   if(vol_regime != REGIME_HIGH) return;         // Requiere Z-Score > 0.67 (Expansion)
   if(g_gap_direction == GAP_NONE) return;       // Requiere Gap estadisticamente significativo

   // Evaluacion de Confirmacion en la 1ra Vela M15
   double c1 = iClose(_Symbol, PERIOD_CURRENT, 1);
   double h1 = iHigh(_Symbol, PERIOD_CURRENT, 1);
   double l1 = iLow(_Symbol, PERIOD_CURRENT, 1);
   double bar_range = h1 - l1;
   if(bar_range <= 0.0) return;

   double atr_m15[];
   ArraySetAsSeries(atr_m15, true);
   CopyBuffer(g_handle_atr_m15, 0, 1, 1, atr_m15);

   // Confirmacion Long: Cierre por encima del Open de sesion y en la mitad superior del rango
   if(g_gap_direction == GAP_UP && c1 > g_session_open && c1 >= (l1 + InpMaxRetracePct * bar_range))
   {
      double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl  = NormalizeDouble(ask - (InpStopMultiplier * atr_m15[0]), _Digits);
      double tp  = NormalizeDouble(ask + (InpProfitMultiplier * atr14_d1), _Digits);

      if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, InpStrategyID))
      {
         g_entry_time = TimeCurrent();
         PrintFormat("{\"event\":\"ENTRY_BUY\", \"strategy_id\":\"%s\", \"price\":%.2f, \"gap\":%.2f, \"z_vol\":%.2f, \"tp_d1\":%.2f, \"sl\":%.2f}",
                     InpStrategyID, ask, g_gap_value, z_score, tp, sl);
      }
   }
   // Confirmacion Short: Cierre por debajo del Open de sesion y en la mitad inferior del rango
   else if(g_gap_direction == GAP_DOWN && c1 < g_session_open && c1 <= (h1 - InpMaxRetracePct * bar_range))
   {
      double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl  = NormalizeDouble(bid + (InpStopMultiplier * atr_m15[0]), _Digits);
      double tp  = NormalizeDouble(bid - (InpProfitMultiplier * atr14_d1), _Digits);

      if(g_trade.Sell(InpLotSize, _Symbol, bid, sl, tp, InpStrategyID))
      {
         g_entry_time = TimeCurrent();
         PrintFormat("{\"event\":\"ENTRY_SELL\", \"strategy_id\":\"%s\", \"price\":%.2f, \"gap\":%.2f, \"z_vol\":%.2f, \"tp_d1\":%.2f, \"sl\":%.2f}",
                     InpStrategyID, bid, g_gap_value, z_score, tp, sl);
      }
   }
}
//+------------------------------------------------------------------++
