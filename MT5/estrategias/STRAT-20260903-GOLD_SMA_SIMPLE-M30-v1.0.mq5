//+------------------------------------------------------------------+
//|                       STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0.mq5|
//|                                  Copyright 2026, QRT Solutions   |
//|                           https://github.com/quant-agentic-swarm |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Cruce Puro de SMA 20/50 (Bidireccional, sin filtros) con Triple Barrera"

// ==============================================================================
// BLOQUE 1: CABECERA INSTITUCIONAL Y BIBLIOTECAS
// ==============================================================================
#include <Trade\Trade.mqh>

// ==============================================================================
// BLOQUE 2: PARAMETROS DE ENTRADA (INPUTS)
// ==============================================================================
input group "=== Medias Moviles de Cruce ==="
input int      InpFastSMAPeriod  = 20;          // Periodo SMA Rapida
input int      InpSlowSMAPeriod  = 50;          // Periodo SMA Lenta

input group "=== Triple Barrera de Lopez de Prado ==="
input double   InpTPMultiplier   = 1.50;        // Multiplicador Take Profit (ATR Diario D1)
input double   InpSLMultiplier   = 0.75;        // Multiplicador Stop Loss (ATR Diario D1)
input int      InpMaxBarsHeld    = 48;          // Barrera Temporal Maxima (Barras M30 = 24h)
input int      InpATRDailyPeriod = 14;          // Periodo ATR Diario (Base de Barreras)

input group "=== Gestion de Riesgo y Ejecucion ==="
input double   InpLotSize        = 0.01;        // Volumen por Operacion (Lotes)
input ulong    InpMagicNumber    = 202609040;   // Numero Magico Unico

// ==============================================================================
// VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         m_trade;
int            g_h_sma_fast    = INVALID_HANDLE;
int            g_h_sma_slow    = INVALID_HANDLE;
int            g_h_atr_d1      = INVALID_HANDLE;
datetime       g_last_bar_time = 0;

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
   if(InpFastSMAPeriod <= 0 || InpSlowSMAPeriod <= 0 || InpFastSMAPeriod >= InpSlowSMAPeriod)
   {
      Print("[ERROR] Periodos de SMA invalidos: FastSMA debe ser > 0 y menor que SlowSMA.");
      return INIT_PARAMETERS_INCORRECT;
   }
   if(InpTPMultiplier <= 0 || InpSLMultiplier <= 0 || InpMaxBarsHeld <= 0)
   {
      Print("[ERROR] Parametros de Triple Barrera invalidos. Deben ser mayores a 0.");
      return INIT_PARAMETERS_INCORRECT;
   }

   m_trade.SetExpertMagicNumber(InpMagicNumber);
   m_trade.SetDeviationInPoints(20);
   m_trade.SetTypeFillingBySymbol(_Symbol);

   g_h_sma_fast = iMA(_Symbol, PERIOD_CURRENT, InpFastSMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
   g_h_sma_slow = iMA(_Symbol, PERIOD_CURRENT, InpSlowSMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
   g_h_atr_d1   = iATR(_Symbol, PERIOD_D1, InpATRDailyPeriod);

   if(g_h_sma_fast == INVALID_HANDLE || g_h_sma_slow == INVALID_HANDLE || g_h_atr_d1 == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar los handles de indicadores.");
      return INIT_FAILED;
   }

   PrintFormat("[OK] [STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0] Inicializado en %s. FastSMA:%d, SlowSMA:%d, Magic:%d",
               _Symbol, InpFastSMAPeriod, InpSlowSMAPeriod, InpMagicNumber);
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_sma_fast);
   IndicatorRelease(g_h_sma_slow);
   IndicatorRelease(g_h_atr_d1);
   Comment("");
   PrintFormat("[STOP] [STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0] Detenido. Razon: %d", reason);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   // Control estricto al cierre de barra M30 (cero repainting)
   if(!IsNewBar()) return;

   // ==============================================================================
   // BLOQUE 3: LECTURA DE BUFFERS CON SHIFT = 1 (CERO REPAINTING)
   // ==============================================================================
   double sma_f[], sma_s[];
   ArraySetAsSeries(sma_f, true);
   ArraySetAsSeries(sma_s, true);

   if(CopyBuffer(g_h_sma_fast, 0, 1, 2, sma_f) < 2) return;
   if(CopyBuffer(g_h_sma_slow, 0, 1, 2, sma_s) < 2) return;

   // Take Profit anclado al ATR Diario cerrado de 14 periodos (shift = 1)
   double atr_d1_buf[1];
   if(CopyBuffer(g_h_atr_d1, 0, 1, 1, atr_d1_buf) < 1) return;
   double daily_atr = atr_d1_buf[0];
   if(daily_atr <= 0) return;

   // HUD Neutro-Informativo en pantalla
   Comment(StringFormat("--- STRAT-20260903-GOLD_SMA_SIMPLE-M30-v1.0 ---\n"
                         "SMA Rapida(%d): %.2f | SMA Lenta(%d): %.2f\n"
                         "ATR Diario(%d): %.2f\n"
                         "Triple Barrera: TP=+%.2fx | SL=-%.2fx | TimeStop=%d barras",
                         InpFastSMAPeriod, sma_f[0], InpSlowSMAPeriod, sma_s[0],
                         InpATRDailyPeriod, daily_atr, InpTPMultiplier, InpSLMultiplier, InpMaxBarsHeld));

   // ==============================================================================
   // BLOQUE 4: GESTION DE SALIDAS (TRIPLE BARRERA & CRUCE OPUESTO)
   // ==============================================================================
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
      {
         datetime open_time = (datetime)PositionGetInteger(POSITION_TIME);
         int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, open_time);
         ENUM_POSITION_TYPE pos_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

         // Barrera 3: Limite de tiempo maximo
         if(bars_held >= InpMaxBarsHeld)
         {
            m_trade.PositionClose(ticket);
            PrintFormat("{\"event\":\"EXIT\",\"reason\":\"B3_TIME_STOP\",\"ticket\":%d,\"bars_held\":%d}", ticket, bars_held);
            continue;
         }

         // Invalidacion: cruce opuesto de SMA 20/50
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

   // No abrir si ya existe una posicion en curso con este Magic Number
   for(int i = 0; i < PositionsTotal(); i++)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0 && PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == InpMagicNumber)
         return;
   }

   // ==============================================================================
   // BLOQUE 5: CONDICIONES DE ENTRADA (CRUCE PURO DE MEDIAS, SIN FILTROS)
   // ==============================================================================
   bool cross_bull = (sma_f[0] > sma_s[0]) && (sma_f[1] <= sma_s[1]);
   bool cross_bear = (sma_f[0] < sma_s[0]) && (sma_f[1] >= sma_s[1]);

   // ==============================================================================
   // BLOQUE 6: EJECUCION DE ORDENES CON TRIPLE BARRERA
   // ==============================================================================
   if(cross_bull)
   {
      double ask_price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double sl_price  = NormalizeDouble(ask_price - (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(ask_price + (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Buy(InpLotSize, _Symbol, ask_price, sl_price, tp_price, "SMA_Simple_Buy"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"BUY\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f}",
                     ask_price, sl_price, tp_price, daily_atr);
      }
   }
   else if(cross_bear)
   {
      double bid_price = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double sl_price  = NormalizeDouble(bid_price + (daily_atr * InpSLMultiplier), _Digits);
      double tp_price  = NormalizeDouble(bid_price - (daily_atr * InpTPMultiplier), _Digits);

      if(m_trade.Sell(InpLotSize, _Symbol, bid_price, sl_price, tp_price, "SMA_Simple_Sell"))
      {
         PrintFormat("{\"event\":\"ENTRY\",\"side\":\"SELL\",\"price\":%.2f,\"sl\":%.2f,\"tp\":%.2f,\"daily_atr\":%.2f}",
                     bid_price, sl_price, tp_price, daily_atr);
      }
   }
}
//+------------------------------------------------------------------+
