//+------------------------------------------------------------------+
//|                                         Ind_Elder_Cross_M30.mq5  |
//|                    Autor: QRT Solutions                          |
//|        Indicador Visual de Cruce de Medias con Filtro Macro      |
//|  (EMA 9, EMA 21, EMA 200 + Flechas de Señal y Filtro de Elder)   |
//+------------------------------------------------------------------+
#property copyright   "QRT Solutions"
#property link        "https://github.com/quant-agentic-swarm"
#property version     "1.00"
#property description "Visualizador de Cruce de Medias con Filtro Macro EMA 200 y Flechas"
#property indicator_chart_window
#property indicator_buffers 5
#property indicator_plots   5

//--- Plot 1: Media Rapida
#property indicator_label1  "Fast EMA (9)"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrGold
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//--- Plot 2: Media Lenta
#property indicator_label2  "Slow EMA (21)"
#property indicator_type2   DRAW_LINE
#property indicator_color2  clrDarkOrange
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2

//--- Plot 3: Media Filtro Macro
#property indicator_label3  "Filter EMA (200)"
#property indicator_type3   DRAW_LINE
#property indicator_color3  clrDodgerBlue
#property indicator_style3  STYLE_SOLID
#property indicator_width3  3

//--- Plot 4: Flechas de Compra
#property indicator_label4  "Signal BUY"
#property indicator_type4   DRAW_ARROW
#property indicator_color4  clrLimeGreen
#property indicator_width4  3

//--- Plot 5: Flechas de Venta
#property indicator_label5  "Signal SELL"
#property indicator_type5   DRAW_ARROW
#property indicator_color5  clrCrimson
#property indicator_width5  3

//+------------------------------------------------------------------+
//| INPUTS                                                           |
//+------------------------------------------------------------------+
input group "=== Configuracion de Medias Moviles ==="
input int      InpFastPeriod   = 9;          // Periodo Media Rapida (EMA)
input int      InpSlowPeriod   = 21;         // Periodo Media Lenta (EMA)
input int      InpFilterPeriod = 200;        // Periodo Media Filtro Macro (EMA)
input bool     InpFilterSlope  = true;       // Exigir Pendiente Favorable en Filtro

input group "=== Señales Visuales y Alertas ==="
input bool     InpShowArrows   = true;       // Dibujar Flechas de Señal en Grafico
input double   InpArrowOffset  = 1.5;        // Separacion de Flechas (Multiplicador de Espaciado)
input bool     InpEnableAlerts = true;       // Activar Alertas Emergentes al Cierre de Barra

//+------------------------------------------------------------------+
//| BUFFERS DEL INDICADOR                                            |
//+------------------------------------------------------------------+
double g_buf_fast[];
double g_buf_slow[];
double g_buf_filter[];
double g_buf_buy[];
double g_buf_sell[];

int    g_h_fast   = INVALID_HANDLE;
int    g_h_slow   = INVALID_HANDLE;
int    g_h_filter = INVALID_HANDLE;
datetime g_last_alert_time = 0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
   // Mapeo de Buffers
   SetIndexBuffer(0, g_buf_fast,   INDICATOR_DATA);
   SetIndexBuffer(1, g_buf_slow,   INDICATOR_DATA);
   SetIndexBuffer(2, g_buf_filter, INDICATOR_DATA);
   SetIndexBuffer(3, g_buf_buy,    INDICATOR_DATA);
   SetIndexBuffer(4, g_buf_sell,   INDICATOR_DATA);

   // Configuracion de Flechas (Wingdings)
   PlotIndexSetInteger(3, PLOT_ARROW, 233); // Flecha hacia arriba
   PlotIndexSetInteger(4, PLOT_ARROW, 234); // Flecha hacia abajo

   // Inicializar handles de medias
   g_h_fast   = iMA(_Symbol, PERIOD_CURRENT, InpFastPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_slow   = iMA(_Symbol, PERIOD_CURRENT, InpSlowPeriod, 0, MODE_EMA, PRICE_CLOSE);
   g_h_filter = iMA(_Symbol, PERIOD_CURRENT, InpFilterPeriod, 0, MODE_EMA, PRICE_CLOSE);

   if(g_h_fast == INVALID_HANDLE || g_h_slow == INVALID_HANDLE || g_h_filter == INVALID_HANDLE)
   {
      Print("[ERROR] Fallo al crear handles de medias moviles.");
      return(INIT_FAILED);
   }

   // Nombre corto en ventana
   string short_name = StringFormat("ElderCross(%d,%d,%d)", InpFastPeriod, InpSlowPeriod, InpFilterPeriod);
   IndicatorSetString(INDICATOR_SHORTNAME, short_name);
   IndicatorSetInteger(INDICATOR_DIGITS, _Digits);

   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(g_h_fast);
   IndicatorRelease(g_h_slow);
   IndicatorRelease(g_h_filter);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
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
   if(rates_total < InpFilterPeriod + 5)
      return(0);

   // Copiar valores de indicadores a buffers temporales
   double fast[], slow[], filter[];
   if(CopyBuffer(g_h_fast, 0, 0, rates_total, fast) <= 0) return(0);
   if(CopyBuffer(g_h_slow, 0, 0, rates_total, slow) <= 0) return(0);
   if(CopyBuffer(g_h_filter, 0, 0, rates_total, filter) <= 0) return(0);

   int start = prev_calculated - 1;
   if(start < 1)
   {
      start = 1;
      ArrayInitialize(g_buf_buy, EMPTY_VALUE);
      ArrayInitialize(g_buf_sell, EMPTY_VALUE);
   }

   for(int i = start; i < rates_total; i++)
   {
      g_buf_fast[i]   = fast[i];
      g_buf_slow[i]   = slow[i];
      g_buf_filter[i] = filter[i];

      g_buf_buy[i]  = EMPTY_VALUE;
      g_buf_sell[i] = EMPTY_VALUE;

      if(i < 2) continue;

      // Evaluacion de cruce en barra i
      bool cross_bull = (fast[i] > slow[i]) && (fast[i - 1] <= slow[i - 1]);
      bool cross_bear = (fast[i] < slow[i]) && (fast[i - 1] >= slow[i - 1]);

      // Evaluacion de la media filtro (Close relativo y pendiente)
      bool slope_up   = filter[i] >= filter[i - 1];
      bool slope_down = filter[i] <= filter[i - 1];

      bool macro_long_ok  = (close[i] > filter[i]) && (InpFilterSlope ? slope_up : true);
      bool macro_short_ok = (close[i] < filter[i]) && (InpFilterSlope ? slope_down : true);

      // Calculo de holgura vertical dinamica para posicionar la flecha
      double range = high[i] - low[i];
      if(range <= 0) range = 10 * _Point;
      double offset = range * InpArrowOffset;

      if(InpShowArrows)
      {
         if(cross_bull && macro_long_ok)
         {
            g_buf_buy[i] = low[i] - offset;

            // Alerta en la barra mas reciente confirmada
            if(InpEnableAlerts && i == rates_total - 2 && time[i] != g_last_alert_time)
            {
               g_last_alert_time = time[i];
               Alert(StringFormat("[SIGNAL] [BUY SIGNAL] %s M30: Cruce Alcista EMA 9/21 confirmado sobre EMA 200 a %.2f", _Symbol, close[i]));
            }
         }
         else if(cross_bear && macro_short_ok)
         {
            g_buf_sell[i] = high[i] + offset;

            // Alerta en la barra mas reciente confirmada
            if(InpEnableAlerts && i == rates_total - 2 && time[i] != g_last_alert_time)
            {
               g_last_alert_time = time[i];
               Alert(StringFormat("[DOWN] [SELL SIGNAL] %s M30: Cruce Bajista EMA 9/21 confirmado bajo EMA 200 a %.2f", _Symbol, close[i]));
            }
         }
      }
   }

   return(rates_total);
}
