//+------------------------------------------------------------------+
//|                             STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Estrategia Cuantitativa de Cruce Intermedio (SMA 20/50) con Filtro Tendencial EMA 200 y Triple Barrera"

// ==============================================================================
// BLOQUE 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

// ==============================================================================
// BLOQUE 2: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Medias Moviles de Cruce y Filtro ==="
input int      InpFastSMAPeriod  = 20;          // Periodo SMA Rapida
input int      InpSlowSMAPeriod  = 50;          // Periodo SMA Lenta
input int      InpMacroEMAPeriod = 200;         // Periodo EMA Macro Filtro

input group "=== Triple Barrera de Lopez de Prado ==="
input double   InpTPMultiplier   = 1.50;        // Multiplicador Take Profit (ATR Diario)
input double   InpSLMultiplier   = 0.75;        // Multiplicador Stop Loss (ATR Diario)
input int      InpMaxBarsHeld    = 48;          // Barrera Temporal Maxima (Barras M30 = 24h)

input group "=== Filtro de Regimen MTF Diario ==="
input int      InpATRDailyFast   = 5;           // Periodo ATR Diario Rapido
input int      InpATRDailySlow   = 14;          // Periodo ATR Diario Lento (Base de Barreras)
input double   InpZScoreMin      = -0.67;       // Umbral Minimo Z-Score de Volatilidad

input group "=== Gestion de Riesgo y Ejecucion ==="
input double   InpLotSize        = 0.01;        // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber    = 202609031;   // Numero Magico Unico

// ==============================================================================
// VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         m_trade;
int            g_h_sma_fast      = INVALID_HANDLE;
int            g_h_sma_slow      = INVALID_HANDLE;
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

   // Inicializacion de Handles de Medias Moviles
   g_h_sma_fast  = iMA(_Symbol, PERIOD_CURRENT, InpFastSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_sma_slow  = iMA(_Symbol, PERIOD_CURRENT, InpSlowSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_ema_macro = iMA(_Symbol, PERIOD_CURRENT, InpMacroEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);

   // Handles de Volatilidad Diaria MTF
   g_h_atr_d_fast = iATR(_Symbol, PERIOD_D1, InpATRDailyFast);
   g_h_atr_d_slow = iATR(_Symbol, PERIOD_D1, InpATRDailySlow);

   if(g_h_sma_fast == INVALID_HANDLE || g_h_sma_slow == INVALID_HANDLE || g_h_ema_macro == INVALID_HANDLE ||
      g_h_atr_d_fast == INVALID_HANDLE || g_h_atr_d_slow == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar los handles de indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0] Inicializado en %s. FastSMA:%d, SlowSMA:%d, MacroEMA:%d, Magic:%d",
               _Symbol, InpFastSMAPeriod, InpSlowSMAPeriod, InpMacroEMAPeriod, InpMagicNumber);
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_sma_fast);
   IndicatorRelease(g_h_sma_slow);
   IndicatorRelease(g_h_ema_macro);
   IndicatorRelease(g_h_atr_d_fast);
   IndicatorRelease(g_h_atr_d_slow);
   PrintFormat("[STOP] [STRAT-20260903-GOLD_SMA_CROSS-M30-v1.0] Detenido. Razon: %d", reason);
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
   double sma_f[], sma_s[], ema_m[];
   ArraySetAsSeries(sma_f, true);
   ArraySetAsSeries(sma_s, true);
   ArraySetAsSeries(ema_m, true);

   if(CopyBuffer(g_h_sma_fast,  0, 1, 2, sma_f) < 2) return;
   if(CopyBuffer(g_h_sma_slow,  0, 1, 2, sma_s) < 2) return;
   if(CopyBuffer(g_h_ema_macro, 0, 1, 2, ema_m) < 2) return;

   // Datos de la barra cerrada [1]
   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   if(CopyRates(_Symbol, PERIOD_CURRENT, 1, 2, rates) < 2) return;

   double close_1 = rates[0].close;

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
   // BLOQUE 6: GESTION DE SALIDAS (TRIPLE BARRERA & CRUCE OPUESTO)
   // ==============================================================================
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Barrera 3: Limite de tiempo maximo (48 barras M30 = 24 horas)
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion: Cruce opuesto de SMA 20 sobre SMA 50
         if(pos_type == POSITION_TYPE_BUY && (sma_f[0] < sma_s[0]))
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"OPPOSITE_CROSS_BUY\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
         else if(pos_type == POSITION_TYPE_SELL && (sma_f[0] > sma_s[0]))
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"OPPOSITE_CROSS_SELL\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }
      }
   }

   // No abrir si ya tenemos una posicion en curso con este Magic Number
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
   // BLOQUE 4: CONDICIONES DE ENTRADA (CRUCE DE MEDIAS EN VELA CERRADA)
   // ==============================================================================
   // Cruce alcista de SMA 20 sobre SMA 50 confirmado en vela [1] respecto a [2]
   bool cross_bull = (sma_f[0] > sma_s[0]) && (sma_f[1] <= sma_s[1]);
   // Cruce bajista de SMA 20 por debajo de SMA 50 confirmado en vela [1] respecto a [2]
   bool cross_bear = (sma_f[0] < sma_s[0]) && (sma_f[1] >= sma_s[1]);

   // Filtro direccional macro EMA 200
   bool filter_bull = close_1 > ema_m[0];
   bool filter_bear = close_1 < ema_m[0];

   // ==============================================================================
   // BLOQUE 5: EJECUCION DE ORDENES CON TRIPLE BARRERA
   // ==============================================================================
   if(cross_bull && filter_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "SMA_Cross_Buy"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f,\"z_score\":%.2f}",
                     ask_price, sl_price, tp_price, daily_atr, z_score_d1);
      }
   }
   else if(cross_bear && filter_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "SMA_Cross_Sell"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f,\"z_score\":%.2f}",
                     bid_price, sl_price, tp_price, daily_atr, z_score_d1);
      }
   }
}
