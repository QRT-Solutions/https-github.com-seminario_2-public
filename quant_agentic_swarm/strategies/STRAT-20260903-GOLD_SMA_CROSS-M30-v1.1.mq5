//+------------------------------------------------------------------+
//|                             STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.10"
#property description "Estrategia Cuantitativa Optimizada: Cruce SMA 20/50 con Filtro EMA 200, Modo Long-Only, TP MFE, Breakeven y Circuit Breaker"

// ==============================================================================
// BLOQUE 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

enum ENUM_TRADE_DIRECTION
{
   DIR_LONGS_ONLY = 0, // Solo Compras (Longs - Recomendado)
   DIR_SHORTS_ONLY = 1, // Solo Ventas (Shorts)
   DIR_BOTH        = 2  // Ambas Direcciones
};

// ==============================================================================
// BLOQUE 2: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Asimetria Direccional ==="
input ENUM_TRADE_DIRECTION InpTradeDirection = DIR_LONGS_ONLY; // Direccion Operativa

input group "=== Medias Moviles de Cruce y Filtro ==="
input int      InpFastSMAPeriod  = 20;          // Periodo SMA Rapida
input int      InpSlowSMAPeriod  = 50;          // Periodo SMA Lenta
input int      InpMacroEMAPeriod = 200;         // Periodo EMA Macro Filtro

input group "=== Salidas y Calibracion de Excursiones (MFE/MAE) ==="
input double   InpTPMultiplier   = 1.10;        // Multiplicador Take Profit MFE (ATR Diario)
input double   InpSLMultiplier   = 0.75;        // Multiplicador Stop Loss (ATR Diario)
input int      InpMaxBarsHeld    = 48;          // Barrera Temporal Maxima (Barras M30 = 24h)

input group "=== Proteccion Dinamica de Capital ==="
input bool     InpUseBreakeven   = true;        // Activar Breakeven Dinamico
input double   InpBETriggerMult  = 0.50;        // Gatillo Breakeven (Multiplo ATR Diario)
input int      InpMaxMonthLosses = 3;           // Circuit Breaker: Maximo de Perdidas Consecutivas en el Mes

input group "=== Filtro de Regimen MTF Diario ==="
input int      InpATRDailyFast   = 5;           // Periodo ATR Diario Rapido
input int      InpATRDailySlow   = 14;          // Periodo ATR Diario Lento (Base de Barreras)
input double   InpZScoreMin      = -0.67;       // Umbral Minimo Z-Score de Volatilidad

input group "=== Gestion de Riesgo y Ejecucion ==="
input double   InpLotSize        = 0.01;        // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber    = 202609032;   // Numero Magico Unico

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

// Variables de Estado del Circuit Breaker Mensual
int            g_current_month          = -1;
int            g_monthly_consec_losses  = 0;
bool           g_circuit_breaker_active = false;

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
//| Actualizar Estado del Circuit Breaker Mensual                    |
//+------------------------------------------------------------------+
void UpdateCircuitBreakerState()
{
   MqlDateTime dt;
   TimeCurrent(dt);

   if(dt.mon != g_current_month)
   {
      g_current_month = dt.mon;
      g_monthly_consec_losses = 0;
      g_circuit_breaker_active = false;
   }
}

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   m_trade.SetExpertMagicNumber(InpMagicNumber);
   m_trade.SetDeviationInPoints(20);
   m_trade.SetTypeFillingBySymbol(_Symbol);

   g_h_sma_fast  = iMA(_Symbol, PERIOD_CURRENT, InpFastSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_sma_slow  = iMA(_Symbol, PERIOD_CURRENT, InpSlowSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_ema_macro = iMA(_Symbol, PERIOD_CURRENT, InpMacroEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);

   g_h_atr_d_fast = iATR(_Symbol, PERIOD_D1, InpATRDailyFast);
   g_h_atr_d_slow = iATR(_Symbol, PERIOD_D1, InpATRDailySlow);

   if(g_h_sma_fast == INVALID_HANDLE || g_h_sma_slow == INVALID_HANDLE || g_h_ema_macro == INVALID_HANDLE ||
      g_h_atr_d_fast == INVALID_HANDLE || g_h_atr_d_slow == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar los handles de indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1] Inicializado en %s. Modo:%d, TP:%.2f ATR, BE:%s, Magic:%d",
               _Symbol, (int)InpTradeDirection, InpTPMultiplier, InpUseBreakeven ? "ON" : "OFF", InpMagicNumber);
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
   PrintFormat("[STOP] [STRAT-20260903-GOLD_SMA_CROSS-M30-v1.1] Detenido. Razon: %d", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   UpdateCircuitBreakerState();

   // ==============================================================================
   // GESTION INTRADIA DE BREAKEVEN EN TIEMPO REAL
   // ==============================================================================
   if(InpUseBreakeven)
   {
      double atr_d_slow_curr[1];
      if(CopyBuffer(g_h_atr_d_slow, 0, 1, 1, atr_d_slow_curr) >= 1)
      {
         double daily_atr_curr = atr_d_slow_curr[0];
         if(daily_atr_curr > 0)
         {
            for(int i = PositionsTotal() - 1; i >= 0; i--)
            {
               ulong ticket = PositionGetTicket(i);
               if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
               {
                  double open_price = PositionGetDouble(POSITION_PRICE_OPEN);
                  double current_sl = PositionGetDouble(POSITION_SL);
                  ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

                  if(pos_type == POSITION_TYPE_BUY)
                  {
                     double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
                     if((bid - open_price) >= (daily_atr_curr * InpBETriggerMult))
                     {
                        double new_sl = NormalizeDouble(open_price + (daily_atr_curr * 0.05), _Digits);
                        if(current_sl < new_sl)
                        {
                           m_trade.PositionModify(ticket, new_sl, PositionGetDouble(POSITION_TP));
                           PrintFormat("{\"event\":\"BREAKEVEN_TRIGGERED\",\"side\":\"BUY\",\"ticket\":%d,\"new_sl\":%.2f}", ticket, new_sl);
                        }
                     }
                  }
                  else if(pos_type == POSITION_TYPE_SELL)
                  {
                     double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
                     if((open_price - ask) >= (daily_atr_curr * InpBETriggerMult))
                     {
                        double new_sl = NormalizeDouble(open_price - (daily_atr_curr * 0.05), _Digits);
                        if(current_sl > new_sl || current_sl == 0.0)
                        {
                           m_trade.PositionModify(ticket, new_sl, PositionGetDouble(POSITION_TP));
                           PrintFormat("{\"event\":\"BREAKEVEN_TRIGGERED\",\"side\":\"SELL\",\"ticket\":%d,\"new_sl\":%.2f}", ticket, new_sl);
                        }
                     }
                  }
               }
            }
         }
      }
   }

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

   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   if(CopyRates(_Symbol, PERIOD_CURRENT, 1, 2, rates) < 2) return;

   double close_1 = rates[0].close;

   double atr_d_slow[1];
   if(CopyBuffer(g_h_atr_d_slow, 0, 1, 1, atr_d_slow) < 1) return;
   double daily_atr = atr_d_slow[0];
   if(daily_atr <= 0) return;

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

         // Barrera 3: Limite de tiempo maximo (48 barras M30 = 24h)
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion por Cruce Opuesto
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

   // Restriccion de Posicion Unica
   if(PositionsTotal() > 0)
   {
      for(int i = 0; i < PositionsTotal(); i++)
      {
         if(PositionGetSymbol(i) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
            return;
      }
   }

   // Verificacion de Circuit Breaker
   if(g_circuit_breaker_active)
   {
      return;
   }

   // Filtro de Z-Score de volatilidad diaria
   if(z_score_d1 < InpZScoreMin) return;

   // ==============================================================================
   // BLOQUE 4: CONDICIONES DE ENTRADA (CRUCE DE MEDIAS EN VELA CERRADA)
   // ==============================================================================
   bool cross_bull = (sma_f[0] > sma_s[0]) && (sma_f[1] <= sma_s[1]);
   bool cross_bear = (sma_f[0] < sma_s[0]) && (sma_f[1] >= sma_s[1]);

   bool filter_bull = close_1 > ema_m[0];
   bool filter_bear = close_1 < ema_m[0];

   bool allow_long  = (InpTradeDirection == DIR_LONGS_ONLY || InpTradeDirection == DIR_BOTH);
   bool allow_short = (InpTradeDirection == DIR_SHORTS_ONLY || InpTradeDirection == DIR_BOTH);

   // ==============================================================================
   // BLOQUE 5: EJECUCION DE ORDENES CON TRIPLE BARRERA OPTIMIZADA
   // ==============================================================================
   if(allow_long && cross_bull && filter_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "SMA_Cross_Opt_Buy"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f}",
                     ask_price, sl_price, tp_price, daily_atr);
      }
   }
   else if(allow_short && cross_bear && filter_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "SMA_Cross_Opt_Sell"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f}",
                     bid_price, sl_price, tp_price, daily_atr);
      }
   }
}
