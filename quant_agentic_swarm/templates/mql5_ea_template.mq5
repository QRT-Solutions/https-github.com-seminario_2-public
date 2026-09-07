//+------------------------------------------------------------------+
//|                                     STRAT-ORB_D1Z-M15-v1.0.mq5   |
//|               QUANT AGENTIC SWARM (QAS) - PLANTILLA MQL5 POO     |
//|   Tesis: Ruptura de Rango con Filtro Z-Score D1 & Triple Barrera |
//+------------------------------------------------------------------+
#property copyright   "Quant Agentic Swarm"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "STRAT-20260901-ORB_D1Z-M15-v1.0"

#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| ENUMERACIONES Y TIPOS                                            |
//+------------------------------------------------------------------+
enum ENUM_VOL_REGIME
{
   REGIME_LOW = 0,    // Baja Volatilidad (Compresion)
   REGIME_MEDIUM = 1, // Volatilidad Media (Normal)
   REGIME_HIGH = 2    // Alta Volatilidad (Expansion)
};

//+------------------------------------------------------------------+
//| INPUTS DE USUARIO (CON SANITY CHECKS)                            |
//+------------------------------------------------------------------+
input group "1. Regimen de Volatilidad MTF (D1)"
input int      InpFastAtrPeriod    = 5;       // Periodo ATR Rapido (D1)
input int      InpSlowAtrPeriod    = 14;      // Periodo ATR Lento (D1)
input int      InpZScoreWindow     = 20;      // Ventana Z-Score (Dias)
input double   InpZScoreThreshold  = 0.67;    // Umbral Z-Score Alta Volatilidad

input group "2. Salidas: Triple Barrier Method"
input double   InpProfitMultiplier = 1.0;     // Multiplicador B1 (Take Profit * ATR D1)
input double   InpStopMultiplier   = 1.5;     // Multiplicador B2 (Stop Loss * ATR Intradia)
input int      InpMaxHoldingBars   = 24;      // Limite Temporal B3 (Barras M15)

input group "3. Gestion de Orden y Trazabilidad"
input double   InpLotSize          = 0.10;    // Tamaño de Lote Fijo
input ulong    InpMagicNumber      = 20260901;// Magic Number Unico
input string   InpStrategyID       = "STRAT-20260901-ORB_D1Z-v1.0"; // Strategy ID

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
int         g_handle_atr5_d1  = INVALID_HANDLE;
int         g_handle_atr14_d1 = INVALID_HANDLE;
int         g_handle_atr_m15  = INVALID_HANDLE;

// Variables de estado del trade activo
datetime    g_entry_time      = 0;
int         g_entry_bar_shift = 0;

//+------------------------------------------------------------------+
//| FUNCION DE INICIALIZACION (OnInit)                               |
//+------------------------------------------------------------------+
int OnInit()
{
   // Sanity Check en Inputs
   if(InpProfitMultiplier <= 0 || InpStopMultiplier <= 0 || InpMaxHoldingBars <= 0)
   {
      Print("[ERROR] Parametros de Triple Barrera incorrectos. Deben ser mayores a 0.");
      return(INIT_PARAMETERS_INCORRECT);
   }

   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetDeviationInPoints(20);

   // Inicializacion de Handles MTF en PERIOD_D1
   g_handle_atr5_d1  = iATR(_Symbol, PERIOD_D1, InpFastAtrPeriod);
   g_handle_atr14_d1 = iATR(_Symbol, PERIOD_D1, InpSlowAtrPeriod);
   g_handle_atr_m15  = iATR(_Symbol, PERIOD_CURRENT, 14);

   if(g_handle_atr5_d1 == INVALID_HANDLE || g_handle_atr14_d1 == INVALID_HANDLE || g_handle_atr_m15 == INVALID_HANDLE)
   {
      Print("[ERROR] No se pudieron inicializar los handles de ATR.");
      return(INIT_FAILED);
   }

   PrintFormat("[INIT OK] %s inicializado correctamente.", InpStrategyID);
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
//| CALCULO DEL Z-SCORE DE VOLATILIDAD DIARIA                        |
//+------------------------------------------------------------------+
ENUM_VOL_REGIME CalculateDailyVolatilityZScore(double &out_zscore, double &out_atr5, double &out_atr14)
{
   double atr5_buf[], atr14_buf[];
   ArraySetAsSeries(atr5_buf, true);
   ArraySetAsSeries(atr14_buf, true);

   // Copiamos las ultimas InpZScoreWindow barras diarias cerradas (shift = 1)
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
   {
      sq_diff += MathPow(diff_buf[i] - mean, 2.0);
   }
   double stdev = MathSqrt(sq_diff / (double)InpZScoreWindow);

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

   // 2. Actualizacion de HUD Neutro en Pantalla
   string history_badge = (years_d1 >= 5.0) ? StringFormat("%.1f Anos (%d D1) [OK]", years_d1, d1_bars) : 
                                             StringFormat("%.1f Anos [ALERTA: < 5 ANOS]", years_d1);
   
   string regime_str = (vol_regime == REGIME_HIGH) ? "ALTA (EXPANSION)" : 
                       (vol_regime == REGIME_LOW)  ? "BAJA (COMPRESION)" : "MEDIA (ESTACIONARIA)";

   string hud_text = StringFormat("--- %s ---\n"
                                  "Historial D1: %s\n"
                                  "Regimen Volatilidad: %s (Z=%.2f)\n"
                                  "ATR D1: ATR5=%.5f | ATR14=%.5f\n"
                                  "Triple Barrera: B1=+%.1fx ATR_D1 | B2=-%.1f | B3=%db\n"
                                  "Estado: OPERATIVO",
                                  InpStrategyID, history_badge, regime_str, z_score, atr5_d1, atr14_d1,
                                  InpProfitMultiplier, InpStopMultiplier, InpMaxHoldingBars);
   Comment(hud_text);

   // 3. Gestion de Posiciones Abiertas (Triple Barrier Exit)
   if(PositionsTotal() > 0)
   {
      for(int i = PositionsTotal() - 1; i >= 0; i--)
      {
         ulong ticket = PositionGetTicket(i);
         if(ticket > 0 && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         {
            datetime pos_time = (datetime)PositionGetInteger(POSITION_TIME);
            int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, pos_time);

            // Barrera 3: Time-Stop (Limite Temporal)
            if(bars_held >= InpMaxHoldingBars)
            {
               g_trade.PositionClose(ticket);
               PrintFormat("{\"event\":\"EXIT_B3_TIME\", \"ticket\":%d, \"bars_held\":%d, \"time\":\"%s\"}", 
                           ticket, bars_held, TimeToString(TimeCurrent()));
            }
         }
      }
   }

   // 4. Evaluacion de Entrada Sincronizada al Cierre de Barra (IsNewBar)
   if(!g_bar_detector.IsNewBar(PERIOD_CURRENT)) return;

   // Solo operamos si estamos flat
   if(PositionsTotal() == 0 && vol_regime == REGIME_HIGH)
   {
      double atr_m15[];
      ArraySetAsSeries(atr_m15, true);
      CopyBuffer(g_handle_atr_m15, 0, 1, 1, atr_m15);

      double highest_20 = iHigh(_Symbol, PERIOD_CURRENT, iHighest(_Symbol, PERIOD_CURRENT, MODE_HIGH, 20, 1));
      double close_prev = iClose(_Symbol, PERIOD_CURRENT, 1);

      // Condicion de Ruptura Alcista
      if(close_prev > highest_20)
      {
         double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         double sl  = ask - (InpStopMultiplier * atr_m15[0]);
         // Take Profit anclado a ATR Diario D1 de 14 periodos
         double tp  = ask + (InpProfitMultiplier * atr14_d1);

         if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, InpStrategyID))
         {
            PrintFormat("{\"event\":\"ENTRY_BUY\", \"strategy_id\":\"%s\", \"price\":%.5f, \"z_vol\":%.2f, \"tp_d1\":%.5f, \"sl\":%.5f}", 
                        InpStrategyID, ask, z_score, tp, sl);
         }
      }
   }
}
//+------------------------------------------------------------------+
