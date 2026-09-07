//+------------------------------------------------------------------+
//|                                STRAT-20260902-BTC_TREND_CROSS-M30-v1.0.mq5 |
//|                                  Copyright 2026, QRT Solutions   |
//|                             https://github.com/QRT-Solutions/seminario_2 |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/QRT-Solutions/seminario_2"
#property version     "1.00"
#property description "Bitcoin Macro Trend-Filtered EMA Cross with Daily ATR Triple Barrier"

// ==============================================================================
// BLOQUE 1: INCLUSION DE LIBRERIAS ESTANDAR MQL5
// ==============================================================================
#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>

// ==============================================================================
// BLOQUE 2: INPUTS DE USUARIO Y GESTION DE RIESGO
// ==============================================================================
input group "=== 1. Medias Moviles & Filtro Macro ==="
input int               InpFastPeriod        = 12;           // Periodo Media Rapida (EMA M30)
input int               InpSlowPeriod        = 26;           // Periodo Media Lenta (EMA M30)
input int               InpMacroFilterPeriod = 200;          // Periodo Filtro Macro (EMA M30)
input int               InpMacroSlopeBars    = 5;            // Barras Confirmacion Pendiente EMA 200
input ENUM_APPLIED_PRICE InpAppliedPrice     = PRICE_CLOSE;  // Precio Aplicado

input group "=== 2. Triple Barrera de Lopez de Prado (ATR D1) ==="
input int               InpATRDailyPeriod    = 14;           // Periodo ATR Diario (D1)
input double            InpSLMultiplier      = 0.75;         // Stop Loss (Multiplo de ATR Diario)
input double            InpTPMultiplier      = 1.0;          // Take Profit (Multiplo de ATR Diario)
input int               InpMaxHoldingBars    = 32;           // Time-Stop Maximo (Barras M30 = 16h)
input bool              InpPreventiveExit    = false;        // Salida Preventiva por Cruce Inverso (Desactivada)

input group "=== 3. Gestion Monetaria y Control de Ordenes ==="
input double            InpLotSize           = 0.01;         // Volumen por Operacion (Lotes)
input ulong             InpMagicNumber       = 20260904;     // Numero Magico Unico

// ==============================================================================
// BLOQUE 3: VARIABLES GLOBALES Y HANDLES DE INDICADORES
// ==============================================================================
CTrade         g_trade;
CPositionInfo  g_pos;

int            g_h_fast_ema          = INVALID_HANDLE;
int            g_h_slow_ema          = INVALID_HANDLE;
int            g_h_macro_ema         = INVALID_HANDLE;
int            g_h_atr_daily         = INVALID_HANDLE;
datetime       g_last_bar_time       = 0;

//+------------------------------------------------------------------+
//| Sincronizacion estricta de nueva barra al cierre                 |
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
//| Obtencion segura del ATR Diario cerrado (shift = 1)              |
//+------------------------------------------------------------------+
double GetDailyATRPips()
{
   double atr_buf[];
   ArraySetAsSeries(atr_buf, true);
   if(CopyBuffer(g_h_atr_daily, 0, 1, 1, atr_buf) <= 0)
   {
      Print("[ERROR] Error al leer buffer de ATR Diario cerrado.");
      return 0.0;
   }
   return atr_buf[0];
}

// ==============================================================================
// BLOQUE 4: INICIALIZACION Y DEINICIALIZACION
// ==============================================================================
int OnInit()
{
   // Configuracion del objeto de trading
   g_trade.SetExpertMagicNumber(InpMagicNumber);
   g_trade.SetMarginMode();
   g_trade.SetTypeFillingBySymbol(_Symbol);

   // Creacion de indicadores en el timeframe de ejecucion (M30)
   g_h_fast_ema = iMA(_Symbol, PERIOD_CURRENT, InpFastPeriod, 0, MODE_EMA, InpAppliedPrice);
   g_h_slow_ema = iMA(_Symbol, PERIOD_CURRENT, InpSlowPeriod, 0, MODE_EMA, InpAppliedPrice);
   g_h_macro_ema = iMA(_Symbol, PERIOD_CURRENT, InpMacroFilterPeriod, 0, MODE_EMA, InpAppliedPrice);

   // Creacion del ATR en marco temporal Diario (D1)
   g_h_atr_daily = iATR(_Symbol, PERIOD_D1, InpATRDailyPeriod);

   if(g_h_fast_ema == INVALID_HANDLE || g_h_slow_ema == INVALID_HANDLE || 
      g_h_macro_ema == INVALID_HANDLE || g_h_atr_daily == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al inicializar los handles de indicadores.");
      return INIT_FAILED;
   }

   Print("[OK] Estrategia STRAT-20260902-BTC_TREND_CROSS-M30-v1.0 inicializada con exito en ", _Symbol);
   Print("[CONFIG] Filtro Elder: Pendiente EMA200 activa (", InpMacroSlopeBars, " barras) | Triple Barrera: SL ", InpSLMultiplier, "x ATR, TP ", InpTPMultiplier, "x ATR, Time-Stop ", InpMaxHoldingBars, " barras (16h)");
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_fast_ema);
   IndicatorRelease(g_h_slow_ema);
   IndicatorRelease(g_h_macro_ema);
   IndicatorRelease(g_h_atr_daily);
}

// ==============================================================================
// BLOQUE 5 & 6: EJECUCION AL CIERRE DE VELA Y GESTION DE POSICIONES
// ==============================================================================
void OnTick()
{
   // Evaluar unicamente al completarse cada barra M30 (0 repainting)
   if(!IsNewBar())
      return;

   // 1. Obtener lecturas de las medias en barra 1 (cerrada) y barra 2 (previa)
   double fast_buf[], slow_buf[], macro_buf[];
   ArraySetAsSeries(fast_buf, true);
   ArraySetAsSeries(slow_buf, true);
   ArraySetAsSeries(macro_buf, true);

   if(CopyBuffer(g_h_fast_ema, 0, 1, 2, fast_buf) < 2 ||
      CopyBuffer(g_h_slow_ema, 0, 1, 2, slow_buf) < 2 ||
      CopyBuffer(g_h_macro_ema, 0, 1, InpMacroSlopeBars + 1, macro_buf) < (InpMacroSlopeBars + 1))
   {
      Print("[WARN] Esperando sincronizacion de datos de mercado...");
      return;
   }

   double fast_curr = fast_buf[0]; // Barra 1
   double fast_prev = fast_buf[1]; // Barra 2
   double slow_curr = slow_buf[0];
   double slow_prev = slow_buf[1];
   double macro_curr = macro_buf[0];
   double macro_slope_ref = macro_buf[InpMacroSlopeBars];
   double close_curr = iClose(_Symbol, PERIOD_CURRENT, 1);

   // Condiciones de cruce exacto en velas cerradas
   bool bullish_cross = (fast_prev <= slow_prev && fast_curr > slow_curr);
   bool bearish_cross = (fast_prev >= slow_prev && fast_curr < slow_curr);

   // Filtro de Marea Macro con Pendiente Direccional (Elder Triple Screen)
   bool macro_bullish = (close_curr > macro_curr && macro_curr > macro_slope_ref);
   bool macro_bearish = (close_curr < macro_curr && macro_curr < macro_slope_ref);

   // 2. Gestion de Posicion Existente
   bool has_position = false;
   ulong pos_ticket = 0;
   ENUM_POSITION_TYPE pos_type = POSITION_TYPE_BUY;
   datetime pos_open_time = 0;

   if(g_pos.SelectByMagic(_Symbol, InpMagicNumber))
   {
      has_position = true;
      pos_ticket = g_pos.Ticket();
      pos_type = g_pos.PositionType();
      pos_open_time = (datetime)g_pos.Time();
   }

   // 2.1. Salida Preventiva por Cruce Inverso (DESACTIVADA: Triple Barrera Pura)
   // Desactivado para permitir que actue el Stop Loss (0.75x ATR) y Take Profit (1.5x ATR) sin cortes prematuros.
   /*
   if(has_position && InpPreventiveExit)
   {
      if(pos_type == POSITION_TYPE_BUY && bearish_cross)
      {
         Print("[EXIT] Salida Preventiva: Cruce bajista detectado. Cerrando BUY #", pos_ticket);
         g_trade.PositionClose(pos_ticket);
         has_position = false;
      }
      else if(pos_type == POSITION_TYPE_SELL && bullish_cross)
      {
         Print("[EXIT] Salida Preventiva: Cruce alcista detectado. Cerrando SELL #", pos_ticket);
         g_trade.PositionClose(pos_ticket);
         has_position = false;
      }
   }
   */

   // 2.2. Barrera 3: Time-Stop Maximo (32 Barras = 16 Horas)
   if(has_position)
   {
      int bars_held = iBarShift(_Symbol, PERIOD_CURRENT, pos_open_time);
      if(bars_held >= InpMaxHoldingBars)
      {
         Print("[TIME-STOP] Expiracion de tiempo (", bars_held, " barras >= ", InpMaxHoldingBars, "). Cerrando ticket #", pos_ticket);
         g_trade.PositionClose(pos_ticket);
         has_position = false;
      }
   }

   // 3. Apertura de Nuevas Posiciones
   if(!has_position)
   {
      double atr_daily = GetDailyATRPips();
      if(atr_daily <= 0.0)
         return;

      double sl_distance = InpSLMultiplier * atr_daily;
      double tp_distance = InpTPMultiplier * atr_daily;
      int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);

      // Entrada en COMPRA
      if(bullish_cross && macro_bullish)
      {
         double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         double sl = NormalizeDouble(ask - sl_distance, digits);
         double tp = NormalizeDouble(ask + tp_distance, digits);

         if(g_trade.Buy(InpLotSize, _Symbol, ask, sl, tp, "BTC Trend BUY"))
         {
            Print("[BUY OK] Posicion BUY abierta a ", ask, " | SL: ", sl, " (-", InpSLMultiplier, "x ATR) | TP: ", tp, " (+", InpTPMultiplier, "x ATR)");
         }
         else
         {
            Print("[ERROR] Error abriendo BUY: ", g_trade.ResultRetcodeDescription());
         }
      }
      // Entrada en VENTA
      else if(bearish_cross && macro_bearish)
      {
         double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
         double sl = NormalizeDouble(bid + sl_distance, digits);
         double tp = NormalizeDouble(bid - tp_distance, digits);

         if(g_trade.Sell(InpLotSize, _Symbol, bid, sl, tp, "BTC Trend SELL"))
         {
            Print("[SELL OK] Posicion SELL abierta a ", bid, " | SL: ", sl, " (+", InpSLMultiplier, "x ATR) | TP: ", tp, " (-", InpTPMultiplier, "x ATR)");
         }
         else
         {
            Print("[ERROR] Error abriendo SELL: ", g_trade.ResultRetcodeDescription());
         }
      }
   }
}
