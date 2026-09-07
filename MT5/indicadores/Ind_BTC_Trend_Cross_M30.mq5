//+------------------------------------------------------------------+
//|                                   Ind_BTC_Trend_Cross_M30.mq5    |
//|                                  Copyright 2026, QRT Solutions   |
//|                             https://github.com/QRT-Solutions/seminario_2 |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/QRT-Solutions/seminario_2"
#property version     "1.00"
#property description "Visualizador de Cruce Tendencial EMA 12/26 con Filtro Macro 200 para Bitcoin"
#property indicator_chart_window
#property indicator_buffers 5
#property indicator_plots   5

// Plot 1: EMA Rapida (12) - Azul Cielo
#property indicator_label1  "EMA Rapida (12)"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrDeepSkyBlue
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

// Plot 2: EMA Lenta (26) - Naranja
#property indicator_label2  "EMA Lenta (26)"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrOrange
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

// Plot 3: EMA Macro (200) - Blanco / Gris claro
#property indicator_label3  "EMA Macro (200)"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrWhite
#property indicator_style3  STYLE_SOLID
#property indicator_width3  3

// Plot 4: Flecha de Compra (Filtrada)
#property indicator_label4  "Señal BUY (Tendencial)"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrLime
#property indicator_width4  3

// Plot 5: Flecha de Venta (Filtrada)
#property indicator_label5  "Señal SELL (Tendencial)"
#property indicator_type5   DRAW_ARROW
#property indicator_color5  clrRed
#property indicator_width5  3

// Inputs
input int InpFastPeriod  = 12;  // Periodo Media Rapida
input int InpSlowPeriod  = 26;  // Periodo Media Lenta
input int InpMacroPeriod = 200; // Periodo Media Macro

// Buffers
double BufferFast[];
double BufferSlow[];
double BufferMacro[];
double BufferBuy[];
double BufferSell[];

int g_h_fast  = INVALID_HANDLE;
int g_h_slow  = INVALID_HANDLE;
int g_h_macro = INVALID_HANDLE;

int OnInit()
{
   SetIndexBuffer(0, BufferFast, INDICATOR_DATA);
   SetIndexBuffer(1, BufferSlow, INDICATOR_DATA);
   SetIndexBuffer(2, BufferMacro, INDICATOR_DATA);
   SetIndexBuffer(3, BufferBuy, INDICATOR_DATA);
   SetIndexBuffer(4, BufferSell, INDICATOR_DATA);

   PlotIndexSetInteger(3, PLOT_ARROW, 233); // Wingdings 233: Flecha arriba
   PlotIndexSetInteger(4, PLOT_ARROW, 234); // Wingdings 234: Flecha abajo

   PlotIndexSetDouble(3, PLOT_EMPTY_VALUE, 0.0);
   PlotIndexSetDouble(4, PLOT_EMPTY_VALUE, 0.0);

   g_h_fast  = iMA(_Symbol, PERIOD_CURRENT, InpFastPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_slow  = iMA(_Symbol, PERIOD_CURRENT, InpSlowPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_macro = iMA(_Symbol, PERIOD_CURRENT, InpMacroPeriod, 0, MODE_EMA, PRICE_CLOSE);

   if(g_h_fast == INVALID_HANDLE || g_h_slow == INVALID_HANDLE || g_h_macro == INVALID_HANDLE)
   {
      Print("[ERROR] No se pudieron crear los handles de las medias.");
      return INIT_FAILED;
   }

   return INIT_SUCCEEDED;
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   if(rates_total < InpMacroPeriod + 2)
      return 0;

   int to_copy = rates_total - prev_calculated;
   if(to_copy > 1)
      to_copy = rates_total;

   if(CopyBuffer(g_h_fast, 0, 0, to_copy, BufferFast) <= 0 ||
      CopyBuffer(g_h_slow, 0, 0, to_copy, BufferSlow) <= 0 ||
      CopyBuffer(g_h_macro, 0, 0, to_copy, BufferMacro) <= 0)
      return 0;

   int start = (prev_calculated > 1) ? prev_calculated - 1 : 1;

   for(int i = start; i < rates_total - 1; i++)
   {
      BufferBuy[i]  = 0.0;
      BufferSell[i] = 0.0;

      bool bull_cross = (BufferFast[i-1] <= BufferSlow[i-1] && BufferFast[i] > BufferSlow[i]);
      bool bear_cross = (BufferFast[i-1] >= BufferSlow[i-1] && BufferFast[i] < BufferSlow[i]);

      double atr_dist = (high[i] - low[i]) * 0.5;

      // Compra filtrada: Cruce alcista con precio sobre EMA 200
      if(bull_cross && close[i] > BufferMacro[i])
      {
         BufferBuy[i] = low[i] - atr_dist;
      }
      // Venta filtrada: Cruce bajista con precio bajo EMA 200
      else if(bear_cross && close[i] < BufferMacro[i])
      {
         BufferSell[i] = high[i] + atr_dist;
      }
   }

   return rates_total;
}
