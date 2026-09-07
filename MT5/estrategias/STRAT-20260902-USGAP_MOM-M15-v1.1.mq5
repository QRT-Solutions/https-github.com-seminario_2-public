//+------------------------------------------------------------------+
//|                          STRAT-20260902-USGAP_MOM-M15-v1.1.mq5  |
//|                                  Copyright 2026, QRT Solutions   |
//|                    https://github.com/felipemillar/seminario_2   |
//|  Tesis: US Opening Gap Momentum Continuation (Crabel & Prado)    |
//|  Version 1.1: Take Profit Calibrado + Breakeven + Circuit Breaker|
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/felipemillar/seminario_2"
#property version     "1.10"
#property description "US Opening Gap Momentum Continuation v1.1 Optimizada (Breakeven + Circuit Breaker)"

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

input group "3. Salidas: Triple Barrier Method Optimizada"
input double   InpProfitMultiplier = 1.25;    // B1: Take Profit (* ATR D14 cerrado, calibrado a 1.25x)
input double   InpStopMultiplier   = 1.0;     // B2: Stop Loss (* ATR M15 intradia)
input int      InpMaxHoldingBars   = 26;      // B3: Limite Temporal (26 barras M15 = 6.5h RTH)
input bool     InpUseEarlyInvalid  = true;    // Activar Salida por Invalidacion Temprana (Primeros 30 min)

input group "4. Proteccion Dinamica de Ganancias (Breakeven)"
input bool     InpUseBreakeven     = true;    // Activar Proteccion Breakeven
input double   InpBreakevenTrigger = 0.75;    // Ganancia Latente para Disparo (* ATR M15)
input int      InpBreakevenLockPts = 10;      // Puntos asegurados sobre precio de entrada

input group "5. Control de Riesgo Institucional (Circuit Breaker)"
input bool     InpUseCircuitBreaker= true;    // Activar Circuit Breaker Mensual
input int      InpMaxConsecLosses  = 3;       // Maximas perdidas consecutivas permitidas en el mes

input group "6. Gestion de Posicion y Ejecucion"
input double   InpLotSize          = 0.10;    // Tamano de Lote Fijo
input ulong    InpMagicNumber      = 20260903;// Magic Number Unico v1.1
input string   InpStrategyID       = "STRAT-20260902-USGAP_MOM-M15-v1.1"; // Strategy ID

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
bool         g_breakeven_applied  = false;

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

   PrintFormat("[INIT OK] %s inicializado correctamente por QRT Solutions con Breakeven y Circuit Breaker.", InpStrategyID);
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

   double stdev = (InpZScoreWindow > 1) ? MathSqrt(sq_diff / (double)(InpZScoreWindow - 1)) : 0.0;
   out_zscore = (stdev > 0.0) ? (diff_buf[0] - mean) / stdev : 0.0;

   if(out_zscore > InpZScoreThreshold)  return(REGIME_HIGH);
   if(out_zscore < -InpZScoreThreshold) return(REGIME_LOW);
   return(REGIME_MEDIUM);
}

//+------------------------------------------------------------------+
//| VERIFICACION DEL CIRCUIT BREAKER MENSUAL                         |
//+------------------------------------------------------------------+
bool IsCircuitBreakerTripped()
{
   if(!InpUseCircuitBreaker) return false;

   datetime now = TimeCurrent();
   MqlDateTime dt_now;
   TimeToStruct(now, dt_now);

   // Inicio del mes en curso
   MqlDateTime dt_month_start = dt_now;
   dt_month_start.day  = 1;
   dt_month_start.hour = 0;
   dt_month_start.min  = 0;
   dt_month_start.sec  = 0;
   datetime month_start_time = StructToTime(dt_month_start);

   if(!HistorySelect(month_start_time, now)) return false;

   int consecutive_losses = 0;
   int deals_total = HistoryDealsTotal();

   // Recorrer los deals en orden inverso (del mas reciente al mas antiguo)
   for(int i = deals_total - 1; i >= 0; i--)
   {
      ulong ticket = HistoryDealGetTicket(i);
      if(ticket > 0)
      {
         long magic = HistoryDealGetInteger(ticket, DEAL_MAGIC);
         long entry = HistoryDealGetInteger(ticket, DEAL_ENTRY);
         if(magic == InpMagicNumber && entry == DEAL_ENTRY_OUT)
         {
            double profit = HistoryDealGetDouble(ticket, DEAL_PROFIT);
            if(profit < 0.0)
            {
               consecutive_losses++;
               if(consecutive_losses >= InpMaxConsecLosses)
                  return true; // Circuit Breaker activado
            }
            else if(profit > 0.0)
            {
               break; // La racha perdedora se corto con un trade ganador
            }
         }
      }
   }
   return false;
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
   bool cb_tripped = IsCircuitBreakerTripped();

   // 2. Actualizacion de HUD Institucional en Pantalla
   string history_badge = (years_d1 >= 5.0) ? StringFormat("%.1f Anos (%d D1) [OK]", years_d1, d1_bars) :
                                              StringFormat("%.1f Anos [ALERTA: < 5 ANOS]", years_d1);
   string regime_str = (vol_regime == REGIME_HIGH) ? "ALTA (EXPANSION) [PERMITIDO]" :
                       (vol_regime == REGIME_LOW)  ? "BAJA (COMPRESION) [BLOQUEADO]" : "MEDIA (ESTACIONARIA) [BLOQUEADO]";
   string gap_str = (g_gap_direction == GAP_UP) ? "ALCISTA" : (g_gap_direction == GAP_DOWN) ? "BAJISTA" : "SIN GAP VALIDO";
   string cb_str  = cb_tripped ? "ACTIVADO (BLOQUEADO HASTA PROXIMO MES)" : "INACTIVO [OK]";

   string hud_text = StringFormat("=== %s (QRT Solutions) ===\n"
                                  "Historial D1: %s\n"
                                  "Regimen Volatilidad: %s (Z=%.2f)\n"
                                  "Gap Detectado: %s (%.2f pts)\n"
                                  "ATR D1 Cerrado: ATR5=%.2f | ATR14=%.2f\n"
                                  "Triple Barrera: B1=+%.2fx ATR_D | B2=-%.1fx ATR_M15 | B3=%db\n"
                                  "Breakeven: %s (Trigger=%.2fx ATR_M15)\n"
                                  "Circuit Breaker: %s\n"
                                  "Estado: %s",
                                  InpStrategyID, history_badge, regime_str, z_score, gap_str,
                                  atr5_d1, atr14_d1, InpProfitMultiplier, InpStopMultiplier, InpMaxHoldingBars,
                                  InpUseBreakeven ? "HABILITADO" : "DESHABILITADO", InpBreakevenTrigger,
                                  cb_str, cb_tripped ? "PAUSADO POR CIRCUIT BREAKER" : "OPERATIVO");
   Comment(hud_text);

   // 3. Gestion Dinamica de Posiciones Abiertas (Triple Barrier + Breakeven + Invalidacion)
   if(PositionsTotal() > 0)
   {
      double atr_m15_buf[];
      ArraySetAsSeries(atr_m15_buf, true);
      CopyBuffer(g_handle_atr_m15, 0, 1, 1, atr_m15_buf);
      double current_atr_m15 = (ArraySize(atr_m15_buf) > 0) ? atr_m15_buf[0] : 0.0;

      for(int i = PositionsTotal() - 1; i >= 0; i--)
      {
         ulong ticket = PositionGetTicket(i);
         if(ticket > 0 && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         {
            datetime pos_time = (datetime)PositionGetInteger(POSITION_TIME);
            int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, pos_time);
            ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
            double open_price = PositionGetDouble(POSITION_PRICE_OPEN);
            double cur_sl     = PositionGetDouble(POSITION_SL);
            double cur_tp     = PositionGetDouble(POSITION_TP);

            // A. Motor de Breakeven Dinamico
            if(InpUseBreakeven && current_atr_m15 > 0.0)
            {
               double point_val = SymbolInfoDouble(_Symbol, SYMBOL_POINT);
               double lock_distance = InpBreakevenLockPts * point_val;
               double trigger_distance = InpBreakevenTrigger * current_atr_m15;

               if(pos_type == POSITION_TYPE_BUY)
               {
                  double current_bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
                  if((current_bid - open_price) >= trigger_distance)
                  {
                     double new_sl = NormalizeDouble(open_price + lock_distance, _Digits);
                     if(cur_sl < open_price) // Solo subir el Stop
                     {
                        if(g_trade.PositionModify(ticket, new_sl, cur_tp))
                        {
                           PrintFormat("{\"event\":\"BREAKEVEN_APPLIED\", \"ticket\":%I64u, \"open\":%.2f, \"new_sl\":%.2f}",
                                       ticket, open_price, new_sl);
                        }
                     }
                  }
               }
               else if(pos_type == POSITION_TYPE_SELL)
               {
                  double current_ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
                  if((open_price - current_ask) >= trigger_distance)
                  {
                     double new_sl = NormalizeDouble(open_price - lock_distance, _Digits);
                     if(cur_sl > open_price || cur_sl == 0.0) // Solo bajar el Stop
                     {
                        if(g_trade.PositionModify(ticket, new_sl, cur_tp))
                        {
                           PrintFormat("{\"event\":\"BREAKEVEN_APPLIED\", \"ticket\":%I64u, \"open\":%.2f, \"new_sl\":%.2f}",
                                       ticket, open_price, new_sl);
                        }
                     }
                  }
               }
            }

            // B. Barrera 3: Limite Temporal (Time-Stop)
            if(bars_held >= InpMaxHoldingBars)
            {
               g_trade.PositionClose(ticket);
               PrintFormat("{\"event\":\"EXIT_B3_TIME\", \"ticket\":%I64u, \"bars_held\":%d, \"time\":\"%s\"}",
                           ticket, bars_held, TimeToString(TimeCurrent()));
               continue;
            }

            // C. Criterio de Invalidacion Temprana (Primeras 2 barras M15 = 30 min)
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
                  double retrace_level = g_session_open - (0.50 * g_gap_value);
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
   datetime bar_time = iTime(_Symbol, PERIOD_CURRENT, 1);
   MqlDateTime dt;
   TimeToStruct(bar_time, dt);
   datetime day_start = bar_time - (dt.hour * 3600 + dt.min * 60 + dt.sec);

   bool is_session_open_bar = (dt.hour == InpSessionStartHour && dt.min == InpSessionStartMin);
   if(!is_session_open_bar || day_start == g_last_processed_day) return;

   g_last_processed_day = day_start;

   double session_open_price = iOpen(_Symbol, PERIOD_CURRENT, 1);
   double prev_daily_close   = iClose(_Symbol, PERIOD_D1, 1);

   g_session_open = session_open_price;
   g_gap_value    = session_open_price - prev_daily_close;

   double gap_threshold = InpGapThresholdATR * atr14_d1;
   if(g_gap_value >= gap_threshold)
      g_gap_direction = GAP_UP;
   else if(g_gap_value <= -gap_threshold)
      g_gap_direction = GAP_DOWN;
   else
      g_gap_direction = GAP_NONE;

   // Filtros de pureza institucional y Circuit Breaker
   if(PositionsTotal() > 0) return;             // Solo operar si estamos planos (Flat)
   if(cb_tripped) return;                       // Bloqueado por Circuit Breaker mensual
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

   // Confirmacion Long
   if(g_gap_direction == GAP_UP && c1 > g_session_open && c1 >= (l1 + InpMaxRetracePct * bar_range))
   {
      double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl  = NormalizeDouble(ask - (InpStopMultiplier * atr_m15[0]), _Digits);
      double tp  = NormalizeDouble(ask + (InpProfitMultiplier * atr14_d1), _Digits);

      if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, InpStrategyID))
      {
         g_entry_time = TimeCurrent();
         PrintFormat("{\"event\":\"ENTRY_BUY_V11\", \"strategy_id\":\"%s\", \"price\":%.2f, \"gap\":%.2f, \"tp\":%.2f, \"sl\":%.2f}",
                     InpStrategyID, ask, g_gap_value, tp, sl);
      }
   }
   // Confirmacion Short
   else if(g_gap_direction == GAP_DOWN && c1 < g_session_open && c1 <= (h1 - InpMaxRetracePct * bar_range))
   {
      double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl  = NormalizeDouble(bid + (InpStopMultiplier * atr_m15[0]), _Digits);
      double tp  = NormalizeDouble(bid - (InpProfitMultiplier * atr14_d1), _Digits);

      if(g_trade.Sell(InpLotSize, _Symbol, bid, sl, tp, InpStrategyID))
      {
         g_entry_time = TimeCurrent();
         PrintFormat("{\"event\":\"ENTRY_SELL_V11\", \"strategy_id\":\"%s\", \"price\":%.2f, \"gap\":%.2f, \"tp\":%.2f, \"sl\":%.2f}",
                     InpStrategyID, bid, g_gap_value, tp, sl);
      }
   }
}
//+------------------------------------------------------------------+
