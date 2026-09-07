//+------------------------------------------------------------------+
//|                       STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1.mq5|
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.10"
#property description "Cruce SMA 20/50 con Filtro de Tendencia EMA 200, Breakeven y Circuit Breaker (v1.1)"

// ==============================================================================
// BLOQUE 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

enum ENUM_DIRECTION_MODE
{
   DIR_BOTH        = 0, // Ambas Direcciones (Bidireccional)
   DIR_LONGS_ONLY  = 1, // Solo Compras (Longs)
   DIR_SHORTS_ONLY = 2  // Solo Ventas (Shorts)
};

// ==============================================================================
// BLOQUE 2: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Direccionalidad ==="
input ENUM_DIRECTION_MODE InpTradeDirection = DIR_BOTH;     // Modo Direccional de Operacion

input group "=== Medias Moviles de Cruce y Filtro ==="
input int      InpFastSMAPeriod   = 20;                     // Periodo SMA Rapida
input int      InpSlowSMAPeriod   = 50;                     // Periodo SMA Lenta
input int      InpMacroEMAPeriod  = 200;                    // Periodo EMA Macro de Tendencia

input group "=== Triple Barrera de Lopez de Prado ==="
input double   InpTPMultiplier    = 1.50;                   // Multiplicador Take Profit (ATR Diario D1)
input double   InpSLMultiplier    = 0.75;                   // Multiplicador Stop Loss (ATR Diario D1)
input int      InpMaxBarsHeld     = 48;                     // Barrera Temporal Maxima (Barras M30 = 24h)
input int      InpATRDailyPeriod  = 14;                     // Periodo ATR Diario (Base de Barreras)

input group "=== Capa Dinamica de Proteccion de Capital ==="
input bool     InpUseBreakeven    = true;                   // Activar Breakeven Dinamico
input double   InpBETriggerATR    = 0.75;                   // Gatillo de Breakeven en multiplos de ATR D1
input int      InpBEBufferPoints  = 10;                     // Colchon de Breakeven sobre Entrada (Puntos)
input bool     InpUseCircuitBreaker = true;                 // Activar Circuit Breaker Mensual
input int      InpMaxConsLosses   = 4;                      // Maximas Perdidas Consecutivas en el Mes

input group "=== Gestion de Riesgo y Ejecucion ==="
input double   InpLotSize         = 0.01;                   // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber     = 202609041;              // Numero Magico Unico (v1.1)

// ==============================================================================
// BLOQUE 3: VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         m_trade;
int            g_h_sma_fast       = INVALID_HANDLE;
int            g_h_sma_slow       = INVALID_HANDLE;
int            g_h_ema_macro      = INVALID_HANDLE;
int            g_h_atr_d1         = INVALID_HANDLE;
datetime       g_last_bar_time    = 0;

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
//| Actualizar Estado del Circuit Breaker Mensual al Cambiar de Mes  |
//+------------------------------------------------------------------+
void UpdateMonthlyCircuitBreaker()
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
//| Transacciones Comerciales: Monitoreo de Rachas y Circuit Breaker |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction &trans,
                         const MqlTradeRequest &request,
                         const MqlTradeResult &result)
{
   if(!InpUseCircuitBreaker) return;

   if(trans.type == TRADE_TRANSACTION_DEAL_ADD)
   {
      ulong deal_ticket = trans.deal;
      if(HistoryDealSelect(deal_ticket))
      {
         long deal_magic = HistoryDealGetInteger(deal_ticket, DEAL_MAGIC);
         string deal_symbol = HistoryDealGetString(deal_ticket, DEAL_SYMBOL);
         ENUM_DEAL_ENTRY deal_entry = (ENUM_DEAL_ENTRY)HistoryDealGetInteger(deal_ticket, DEAL_ENTRY);

         if(deal_magic == InpMagicNumber && deal_symbol == _Symbol && deal_entry == DEAL_ENTRY_OUT)
         {
            double profit = HistoryDealGetDouble(deal_ticket, DEAL_PROFIT) +
                            HistoryDealGetDouble(deal_ticket, DEAL_SWAP) +
                            HistoryDealGetDouble(deal_ticket, DEAL_COMMISSION);

            if(profit < 0.0)
            {
               g_monthly_consec_losses++;
               if(g_monthly_consec_losses >= InpMaxConsLosses)
               {
                  g_circuit_breaker_active = true;
                  PrintFormat("{\"event\":\"CIRCUIT_BREAKER_TRIGGERED\",\"losses\":%d,\"month\":%d}",
                              g_monthly_consec_losses, g_current_month);
               }
            }
            else if(profit > 0.0)
            {
               g_monthly_consec_losses = 0;
            }
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   if(InpFastSMAPeriod <= 0 || InpSlowSMAPeriod <= 0 || InpFastSMAPeriod >= InpSlowSMAPeriod)
   {
      Print("[ERROR] Periodos de SMA invalidos: FastSMA debe ser > 0 y menor que SlowSMA.");
      return INIT_PARAMETERS_INCORRECT;
   }

   if(InpMacroEMAPeriod <= InpSlowSMAPeriod)
   {
      Print("[ERROR] Periodo EMA macro invalido: InpMacroEMAPeriod debe ser mayor que SlowSMA.");
      return INIT_PARAMETERS_INCORRECT;
   }

   if(InpTPMultiplier <= 0.0 || InpSLMultiplier <= 0.0 || InpMaxBarsHeld <= 0)
   {
      Print("[ERROR] Parametros de Triple Barrera invalidos.");
      return INIT_PARAMETERS_INCORRECT;
   }

   m_trade.SetExpertMagicNumber(InpMagicNumber);
   m_trade.SetDeviationInPoints(20);
   m_trade.SetTypeFillingBySymbol(_Symbol);

   g_h_sma_fast  = iMA(_Symbol, PERIOD_CURRENT, InpFastSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_sma_slow  = iMA(_Symbol, PERIOD_CURRENT, InpSlowSMAPeriod,  0, MODE_SMA, PRICE_CLOSE);
   g_h_ema_macro = iMA(_Symbol, PERIOD_CURRENT, InpMacroEMAPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_atr_d1    = iATR(_Symbol, PERIOD_D1, InpATRDailyPeriod);

   if(g_h_sma_fast == INVALID_HANDLE || g_h_sma_slow == INVALID_HANDLE ||
      g_h_ema_macro == INVALID_HANDLE || g_h_atr_d1 == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al crear los handles de los indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1] Inicializado. Simbolo: %s, Modo: %d, BE: %s, CB: %s, Magic: %d",
               _Symbol, (int)InpTradeDirection, InpUseBreakeven ? "ON" : "OFF", InpUseCircuitBreaker ? "ON" : "OFF", InpMagicNumber);
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
   IndicatorRelease(g_h_atr_d1);
   PrintFormat("[STOP] [STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.1] Detenido. Razon: %d", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   UpdateMonthlyCircuitBreaker();

   // ==============================================================================
   // BLOQUE 7A: GESTION INTRADIA DE BREAKEVEN DINAMICO EN TIEMPO REAL
   // ==============================================================================
   if(InpUseBreakeven)
   {
      double atr_d_buff[1];
      if(CopyBuffer(g_h_atr_d1, 0, 1, 1, atr_d_buff) >= 1)
      {
         double daily_atr_rt = atr_d_buff[0];
         if(daily_atr_rt > 0.0)
         {
            double be_buffer = InpBEBufferPoints * _Point;
            for(int i = PositionsTotal() - 1; i >= 0; i--)
            {
               ulong ticket = PositionGetTicket(i);
               if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
               {
                  double open_price = PositionGetDouble(POSITION_PRICE_OPEN);
                  double current_sl = PositionGetDouble(POSITION_SL);
                  double current_tp = PositionGetDouble(POSITION_TP);
                  ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

                  if(pos_type == POSITION_TYPE_BUY)
                  {
                     double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
                     if((bid - open_price) >= (daily_atr_rt * InpBETriggerATR))
                     {
                        double target_be_sl = NormalizeDouble(open_price + be_buffer, _Digits);
                        if(current_sl < target_be_sl)
                        {
                           m_trade.PositionModify(ticket, target_be_sl, current_tp);
                           PrintFormat("{\"event\":\"BREAKEVEN_TRIGGERED\",\"side\":\"BUY\",\"ticket\":%d,\"new_sl\":%.2f}", ticket, target_be_sl);
                        }
                     }
                  }
                  else if(pos_type == POSITION_TYPE_SELL)
                  {
                     double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
                     if((open_price - ask) >= (daily_atr_rt * InpBETriggerATR))
                     {
                        double target_be_sl = NormalizeDouble(open_price - be_buffer, _Digits);
                        if(current_sl > target_be_sl || current_sl == 0.0)
                        {
                           m_trade.PositionModify(ticket, target_be_sl, current_tp);
                           PrintFormat("{\"event\":\"BREAKEVEN_TRIGGERED\",\"side\":\"SELL\",\"ticket\":%d,\"new_sl\":%.2f}", ticket, target_be_sl);
                        }
                     }
                  }
               }
            }
         }
      }
   }

   // Control estricto de ejecucion al cierre de vela (shift = 1)
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

   double atr_d[1];
   if(CopyBuffer(g_h_atr_d1, 0, 1, 1, atr_d) < 1) return;
   double daily_atr = atr_d[0];
   if(daily_atr <= 0.0) return;

   // ==============================================================================
   // BLOQUE 6: GESTION DE SALIDAS (BARRERA 3 DE TIEMPO & CRUCE OPUESTO)
   // ==============================================================================
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Barrera 3 de Tiempo: 48 barras M30 (24 horas)
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"TIME_STOP_B3\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion de hipotesis por cruce opuesto al cierre de vela
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

   // Restriccion de Posicion Unica (Evitar solapamiento dentro del mismo Magic Number)
   if(PositionsTotal() > 0)
   {
      for(int i = 0; i < PositionsTotal(); i++)
      {
         if(PositionGetSymbol(i) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
            return;
      }
   }

   // Bloqueo por Circuit Breaker Mensual
   if(InpUseCircuitBreaker && g_circuit_breaker_active)
   {
      return;
   }

   // ==============================================================================
   // BLOQUE 4: SENALES DE ENTRADA CON FILTRO MACRO EMA 200 (SHIFT = 1)
   // ==============================================================================
   bool cross_bull = (sma_f[0] > sma_s[0]) && (sma_f[1] <= sma_s[1]);
   bool cross_bear = (sma_f[0] < sma_s[0]) && (sma_f[1] >= sma_s[1]);

   bool filter_bull = (close_1 > ema_m[0]);
   bool filter_bear = (close_1 < ema_m[0]);

   bool allow_long  = (InpTradeDirection == DIR_LONGS_ONLY  || InpTradeDirection == DIR_BOTH);
   bool allow_short = (InpTradeDirection == DIR_SHORTS_ONLY || InpTradeDirection == DIR_BOTH);

   // ==============================================================================
   // BLOQUE 5: EJECUCION DE ORDENES CON TRIPLE BARRERA OPTIMIZADA
   // ==============================================================================
   if(allow_long && cross_bull && filter_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "SMA_Simple_v1.1_Buy"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"atr_d\":%.2f}",
                     ask_price, sl_price, tp_price, daily_atr);
      }
   }
   else if(allow_short && cross_bear && filter_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "SMA_Simple_v1.1_Sell"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"atr_d\":%.2f}",
                     bid_price, sl_price, tp_price, daily_atr);
      }
   }
}
//+------------------------------------------------------------------+
