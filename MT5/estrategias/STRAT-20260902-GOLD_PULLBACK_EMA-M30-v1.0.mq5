//+------------------------------------------------------------------+
//|                             STRAT-20260902-GOLD_PULLBACK_EMA.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Estrategia Cuantitativa de Retroceso a Triple EMA (13/34/89) con Triple Barrera"

// ==============================================================================
// BLOQUE 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

// ==============================================================================
// BLOQUE 2: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Configuracion de Medias Fibonacci ==="
input int      InpFastEMAPeriod  = 13;          // Periodo EMA Rapida
input int      InpMedEMAPeriod   = 34;          // Periodo EMA Media
input int      InpSlowEMAPeriod  = 89;          // Periodo EMA Macro

input group "=== Triple Barrera de Lopez de Prado ==="
input double   InpTPMultiplier   = 1.5;         // Multiplicador Take Profit (ATR Diario)
input double   InpSLMultiplier   = 0.75;        // Multiplicador Stop Loss (ATR Diario)
input int      InpMaxBarsHeld    = 32;          // Barrera Temporal Maxima (Barras M30 = 16h)

input group "=== Filtro de Regimen MTF Diario ==="
input int      InpATRDailyFast   = 5;           // Periodo ATR Diario Rapido
input int      InpATRDailySlow   = 14;          // Periodo ATR Diario Lento (Base de Barreras)
input double   InpZScoreMin      = -0.67;       // Umbral Minimo Z-Score

input group "=== Gestion de Riesgo y Ordenes ==="
input double   InpLotSize        = 0.01;        // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber    = 20260903;    // Numero Magico Unico

// ==============================================================================
// VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         m_trade;
int            g_h_ema_fast      = INVALID_HANDLE;
int            g_h_ema_med       = INVALID_HANDLE;
int            g_h_ema_slow      = INVALID_HANDLE;
int            g_h_atr_d_fast    = INVALID_HANDLE;
int            g_h_atr_d_slow    = INVALID_HANDLE;
datetime       g_last_bar_time   = 0;

//+------------------------------------------------------------------+
//| Sincronizacion de Nueva Barra al Cierre                          |
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

   // Inicializacion de Handles
   g_h_ema_fast   = iMA(_Symbol, PERIOD_CURRENT, InpFastEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_ema_med    = iMA(_Symbol, PERIOD_CURRENT, InpMedEMAPeriod,  0, MODE_EMA, PRICE_CLOSE);
   g_h_ema_slow   = iMA(_Symbol, PERIOD_CURRENT, InpSlowEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);

   g_h_atr_d_fast = iATR(_Symbol, PERIOD_D1, InpATRDailyFast);
   g_h_atr_d_slow = iATR(_Symbol, PERIOD_D1, InpATRDailySlow);

   if(g_h_ema_fast == INVALID_HANDLE || g_h_ema_med == INVALID_HANDLE || g_h_ema_slow == INVALID_HANDLE ||
      g_h_atr_d_fast == INVALID_HANDLE || g_h_atr_d_slow == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al crear los handles de indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0] Inicializado en %s. Fast:%d, Med:%d, Slow:%d, Magic:%d",
               _Symbol, InpFastEMAPeriod, InpMedEMAPeriod, InpSlowEMAPeriod, InpMagicNumber);
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_ema_fast);
   IndicatorRelease(g_h_ema_med);
   IndicatorRelease(g_h_ema_slow);
   IndicatorRelease(g_h_atr_d_fast);
   IndicatorRelease(g_h_atr_d_slow);
   PrintFormat("[STOP] [STRAT-20260902-GOLD_PULLBACK_EMA-M30-v1.0] Detenido. Razon: %d", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   // Control estricto al cierre de barra M30
   if(!IsNewBar()) return;

   // ==============================================================================
   // BLOQUE 3: LECTURA DE BUFFERS CON SHIFT = 1 (CERO REPAINTING)
   // ==============================================================================
   double ema_f[2], ema_m[2], ema_s[2];
   if(CopyBuffer(g_h_ema_fast, 0, 1, 2, ema_f) < 2) return;
   if(CopyBuffer(g_h_ema_med,  0, 1, 2, ema_m) < 2) return;
   if(CopyBuffer(g_h_ema_slow, 0, 1, 2, ema_s) < 2) return;

   // Datos OHLC de la barra cerrada [1]
   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   if(CopyRates(_Symbol, PERIOD_CURRENT, 1, 2, rates) < 2) return;

   double close_1 = rates[0].close;
   double open_1  = rates[0].open;
   double high_1  = rates[0].high;
   double low_1   = rates[0].low;

   // Lectura de ATR Diario cerrado (shift = 1)
   double atr_d_slow[1];
   if(CopyBuffer(g_h_atr_d_slow, 0, 1, 1, atr_d_slow) < 1) return;
   double daily_atr = atr_d_slow[0];
   if(daily_atr <= 0) return;

   // Calculo Z-Score MTF Diario (ultimos 14 dias de ATR Rapido)
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
   // BLOQUE 6: GESTION DE SALIDAS (TRIPLE BARRERA Y REVERSION TENDENCIAL)
   // ==============================================================================
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Barrera 3: Limite de Tiempo (32 barras M30 = 16 horas)
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion tendencial: Cierre contrario a la EMA Media (34)
         if(pos_type == POSITION_TYPE_BUY && close_1 < ema_m[1])
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"MACRO_INVALIDATION_BUY\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
         else if(pos_type == POSITION_TYPE_SELL && close_1 > ema_m[1])
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"MACRO_INVALIDATION_SELL\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
      }
   }

   // No abrir si ya tenemos una posicion abierta
   if(PositionsTotal() > 0)
   {
      for(int i = 0; i < PositionsTotal(); i++)
      {
         if(PositionGetSymbol(i) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
            return;
      }
   }

   // Filtro de Z-Score de volatilidad diaria
   if(z_score_d1 < InpZScoreMin) return;

   // ==============================================================================
   // BLOQUE 4: CONDICIONES DE ENTRADA (HIPOTESIS DE PULLBACK)
   // ==============================================================================
   // 1. Alineacion Tendencial de Fibonacci
   bool trend_bull = (ema_f[1] > ema_m[1]) && (ema_m[1] > ema_s[1]);
   bool trend_bear = (ema_f[1] < ema_m[1]) && (ema_m[1] < ema_s[1]);

   // 2. Retroceso a la zona de valor (Pullback a la EMA 13 sin perforar en exceso la EMA 34)
   bool pullback_bull = (low_1 <= ema_f[1]) && (low_1 >= (ema_m[1] - daily_atr * 0.2));
   bool pullback_bear = (high_1 >= ema_f[1]) && (high_1 <= (ema_m[1] + daily_atr * 0.2));

   // 3. Gatillo de rechazo del soporte/resistencia y cierre a favor del impulso
   bool rejection_bull = (close_1 > ema_f[1]) && (close_1 > open_1) && (close_1 >= (high_1 + low_1) * 0.5);
   bool rejection_bear = (close_1 < ema_f[1]) && (close_1 < open_1) && (close_1 <= (high_1 + low_1) * 0.5);

   // ==============================================================================
   // BLOQUE 5: EJECUCION DE ORDENES CON TRIPLE BARRERA
   // ==============================================================================
   if(trend_bull && pullback_bull && rejection_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "Pullback_EMA_Buy"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"z_score\":%.2f}",
                     ask_price, sl_price, tp_price, z_score_d1);
      }
   }
   else if(trend_bear && pullback_bear && rejection_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "Pullback_EMA_Sell"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"z_score\":%.2f}",
                     bid_price, sl_price, tp_price, z_score_d1);
      }
   }
}
