//+------------------------------------------------------------------+
//|                      STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Estrategia Cuantitativa de Ruptura de Canal Donchian (20) con Filtro Estructural EMA 200 y Triple Barrera"

// ==============================================================================
// BLOQUE 0 & 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

// ==============================================================================
// BLOQUE 1: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Parametros de Ruptura y Filtro Tendencial ==="
input int      InpDonchianPeriod = 20;          // Periodo Canal Donchian
input int      InpMacroEMAPeriod = 200;         // Periodo EMA Macro Filtro

input group "=== Triple Barrera de Lopez de Prado ==="
input double   InpTPMultiplier   = 1.50;        // Multiplicador Take Profit (ATR Diario)
input double   InpSLMultiplier   = 0.75;        // Multiplicador Stop Loss (ATR Diario)
input int      InpMaxBarsHeld    = 32;          // Barrera Temporal Maxima (Barras M30 = 16h)

input group "=== Filtro de Regimen MTF Diario ==="
input int      InpATRDailyFast   = 5;           // Periodo ATR Diario Rapido
input int      InpATRDailySlow   = 14;          // Periodo ATR Diario Lento (Base Barreras)
input double   InpZScoreMin      = -0.67;       // Umbral Minimo Z-Score de Volatilidad

input group "=== Gestion de Riesgo y Ejecucion ==="
input double   InpLotSize        = 0.01;        // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber    = 202609032;   // Numero Magico Unico

// ==============================================================================
// VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         m_trade;
int            g_h_ema_macro     = INVALID_HANDLE;
int            g_h_atr_d_fast    = INVALID_HANDLE;
int            g_h_atr_d_slow    = INVALID_HANDLE;
datetime       g_last_bar_time   = 0;

//+------------------------------------------------------------------+
//| Sincronizacion de Nueva Barra al Cierre (Shift = 1)              |
//+------------------------------------------------------------------+
bool IsNewBar()
{
   datetime current_bar_time = iTime(_Symbol, PERIOD_CURRENT, 0);
   if(current_bar_time != g_last_bar_time)
   {
      g_last_bar_time = current_bar_time;
      return true;
   }
   return false;
}

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   m_trade.SetExpertMagicNumber(InpMagicNumber);
   m_trade.SetDeviationInPoints(20);
   m_trade.SetTypeFillingBySymbol(_Symbol);

   // Inicializacion del Handle de EMA 200
   g_h_ema_macro = iMA(_Symbol, PERIOD_CURRENT, InpMacroEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);

   // Handles de Volatilidad Diaria MTF
   g_h_atr_d_fast = iATR(_Symbol, PERIOD_D1, InpATRDailyFast);
   g_h_atr_d_slow = iATR(_Symbol, PERIOD_D1, InpATRDailySlow);

   if(g_h_ema_macro == INVALID_HANDLE || g_h_atr_d_fast == INVALID_HANDLE || g_h_atr_d_slow == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar los handles de indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0] Inicializado en %s. Donchian:%d, MacroEMA:%d, Magic:%d",
               _Symbol, InpDonchianPeriod, InpMacroEMAPeriod, InpMagicNumber);
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_ema_macro);
   IndicatorRelease(g_h_atr_d_fast);
   IndicatorRelease(g_h_atr_d_slow);
   Comment("");
   PrintFormat("[STOP] [STRAT-20260903-DONCHIAN_EMA_BREAK-M30-v1.0] Detenido. Razon: %d", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   // Control estricto al cierre de barra M30
   if(!IsNewBar()) return;

   // ==============================================================================
   // BLOQUE 2: GUARDA DE CALENTAMIENTO
   // ==============================================================================
   int bars_current = Bars(_Symbol, PERIOD_CURRENT);
   int bars_d1      = Bars(_Symbol, PERIOD_D1);
   if(bars_current < (InpMacroEMAPeriod + InpDonchianPeriod + 20) || bars_d1 < (InpATRDailySlow + 14))
      return;

   // ==============================================================================
   // BLOQUE 3: LECTURA DE BUFFERS CON SHIFT = 1 (CERO REPAINTING)
   // ==============================================================================
   double ema_m[];
   ArraySetAsSeries(ema_m, true);
   if(CopyBuffer(g_h_ema_macro, 0, 1, 2, ema_m) < 2) return;

   // Lectura de velas cerradas [1] y [2]
   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   if(CopyRates(_Symbol, PERIOD_CURRENT, 1, 2, rates) < 2) return;

   double close_1 = rates[0].close;
   double close_2 = rates[1].close;

   // Calculo del Canal Donchian en las N barras previas a la vela [1] (shift 2 a N+1)
   int high_idx = iHighest(_Symbol, PERIOD_CURRENT, MODE_HIGH, InpDonchianPeriod, 2);
   int low_idx  = iLowest(_Symbol, PERIOD_CURRENT, MODE_LOW, InpDonchianPeriod, 2);
   if(high_idx < 0 || low_idx < 0) return;

   double donchian_high = iHigh(_Symbol, PERIOD_CURRENT, high_idx);
   double donchian_low  = iLow(_Symbol, PERIOD_CURRENT, low_idx);

   // Lectura de ATR Diario cerrado (shift = 1)
   double atr_d_slow[1];
   if(CopyBuffer(g_h_atr_d_slow, 0, 1, 1, atr_d_slow) < 1) return;
   double daily_atr = atr_d_slow[0];
   if(daily_atr <= 0) return;

   // Calculo Z-Score de Lopez de Prado
   double atr_d_history[14];
   if(CopyBuffer(g_h_atr_d_fast, 0, 1, 14, atr_d_history) < 14) return;
   double sum_atr = 0.0;
   for(int i = 0; i < 14; i++) sum_atr += atr_d_history[i];
   double mean_atr = sum_atr / 14.0;
   double sum_sq = 0.0;
   for(int i = 0; i < 14; i++) sum_sq += MathPow(atr_d_history[i] - mean_atr, 2);
   double stdev_atr = MathSqrt(sum_sq / 14.0);
   double z_score_d1 = (stdev_atr > 0.0) ? (atr_d_history[0] - mean_atr) / stdev_atr : 0.0;

   // ==============================================================================
   // BLOQUE 6: GESTION DE SALIDAS (TRIPLE BARRERA & INVALIDACION ESTRUCTURAL)
   // ==============================================================================
   int pos_count = 0;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         pos_count++;
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Barrera 3: Limite de tiempo maximo (32 barras M30 = 16 horas)
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion Estructural: Perdida de la EMA 200 al cierre
         if(pos_type == POSITION_TYPE_BUY && (close_1 < ema_m[0]))
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"EMA200_INVALIDATION_BUY\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
         else if(pos_type == POSITION_TYPE_SELL && (close_1 > ema_m[0]))
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"EMA200_INVALIDATION_SELL\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
      }
   }

   // Actualizar telemetria HUD en grafico
   Comment(StringFormat("=====================================\n" +
                        "  QRT Solutions | Swarm Engine       \n" +
                        "  UUID: STRAT-20260903-DONCHIAN_EMA_BREAK-M30\n" +
                        "=====================================\n" +
                        "  Donchian High (20): %.2f\n" +
                        "  Donchian Low (20) : %.2f\n" +
                        "  EMA 200 Macro     : %.2f\n" +
                        "  ATR D1 (14)       : %.2f\n" +
                        "  Z-Score D1        : %.2f (Min: %.2f)\n" +
                        "  Posiciones Activas: %d\n" +
                        "=====================================",
                        donchian_high, donchian_low, ema_m[0], daily_atr, z_score_d1, InpZScoreMin, pos_count));

   // No abrir nueva posicion si ya existe una abierta con este Magic Number
   if(pos_count > 0) return;

   // Filtro de Z-Score de volatilidad diaria
   if(z_score_d1 < InpZScoreMin) return;

   // ==============================================================================
   // BLOQUE 4: CONDICIONES DE ENTRADA (RUPTURA CONFIRMADA EN VELA CERRADA)
   // ==============================================================================
   // Ruptura alcista del canal Donchian de 20 periodos
   bool breakout_bull = (close_1 > donchian_high) && (close_2 <= donchian_high);
   // Ruptura bajista del canal Donchian de 20 periodos
   bool breakout_bear = (close_1 < donchian_low)  && (close_2 >= donchian_low);

   // Filtro tendencial macro EMA 200
   bool filter_bull = close_1 > ema_m[0];
   bool filter_bear = close_1 < ema_m[0];

   // ==============================================================================
   // BLOQUE 5: EJECUCION DE ORDENES CON TRIPLE BARRERA
   // ==============================================================================
   if(breakout_bull && filter_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "Donchian_Break_Long"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f,\"z_score\":%.2f}",
                     ask_price, sl_price, tp_price, daily_atr, z_score_d1);
      }
   }
   else if(breakout_bear && filter_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "Donchian_Break_Short"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f,\"z_score\":%.2f}",
                     bid_price, sl_price, tp_price, daily_atr, z_score_d1);
      }
   }
}
