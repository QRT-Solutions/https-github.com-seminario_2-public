#!/usr/bin/env python3
"""
generate_percentage_audit_report.py
Autor Institucional: QRT Solutions & Pepperstone Latam
Auditor Cuantitativo de Retorno Porcentual Puro (% Variación del Activo).
Calcula y audita métricas invariantes a divisa, saldo, splits y precio nominal (Regla Canónica 4.7).
"""

import os
import sys


def find_common_files_dir():
    # Detect platform path
    if sys.platform == "darwin":
        base = os.path.expanduser("~/Library/Application Support/net.metaquotes.wine.metatrader5/drive_c/users")
        for user in ["user", "fmillar"]:
            p = os.path.join(base, user, "AppData/Roaming/MetaQuotes/Terminal/Common/Files")
            if os.path.exists(p):
                return p
        return os.path.join(base, "user", "AppData/Roaming/MetaQuotes/Terminal/Common/Files")
    elif sys.platform == "win32":
        appdata = os.environ.get("APPDATA", "")
        if appdata:
            return os.path.join(appdata, "MetaQuotes/Terminal/Common/Files")
    return os.path.abspath("./MT5/Files")

def read_metrics_csv(filename):
    common_dir = find_common_files_dir()
    path = os.path.join(common_dir, filename)
    if not os.path.exists(path):
        # Fallback local path
        path = os.path.join("./MT5/Files", filename)
        if not os.path.exists(path):
            return {}
    
    data = {}
    with open(path, "rb") as f:
        raw_bytes = f.read()
    
    try:
        text = raw_bytes.decode("utf-16")
    except Exception:
        text = raw_bytes.decode("utf-8", errors="replace")
        
    lines = text.strip().splitlines()
    for line in lines:
        parts = [p.strip() for p in line.split(",") if p.strip()]
        if len(parts) >= 10:
            if parts[0] in ["Symbol", "CUSTOM_Symbol"]:
                continue
            sym = parts[0].replace("CUSTOM_", "").replace("_M1", "")
            try:
                data[sym] = {
                    "symbol": sym,
                    "trades": int(parts[1]),
                    "win_rate": float(parts[2]),
                    "pf_pct": float(parts[3]),
                    "payoff_pct": float(parts[4]),
                    "e_pct": float(parts[5]),
                    "cum_ret": float(parts[6]),
                    "sharpe_pct": float(parts[7]),
                    "max_dd_pct": float(parts[8]),
                    "score_pct": float(parts[9])
                }
            except ValueError:
                continue
    return data

def generate_report(output_dir="./MT5/reports"):
    os.makedirs(output_dir, exist_ok=True)
    buy_metrics = read_metrics_csv("orb_buy_20y_pct_metrics.csv")
    sell_metrics = read_metrics_csv("orb_sell_20y_pct_metrics.csv")
    
    if not buy_metrics and not sell_metrics:
        print("[INFO] No se encontraron archivos de métricas porcentuales en MT5 Common Files.")
        return False
        
    lines = []
    lines.append("# Auditoría Cuantitativa Transversal: Evaluación de Variación Porcentual Pura (% Precio)")
    lines.append("")
    lines.append("> **Autor Institucional:** QRT Solutions & Pepperstone Latam  ")
    lines.append("> **Metodología Canónica:** Evaluación Invariante por Variación Porcentual del Activo ($R_i = \\pm \\frac{\\Delta P}{P_{\\text{entry}}} \\times 100$)  ")
    lines.append("> **Marco Metodológico:** Pool Completo de 3 Módulos de Diagnóstico Cuantitativo (Regla 4.7)  ")
    lines.append("")
    lines.append("---")
    lines.append("")
    
    if buy_metrics:
        lines.append("## 1. Rendimiento Cuantitativo Puro: COMPRAS")
        lines.append("")
        lines.append("| Símbolo | Trades | Win Rate % | Retorno % Acum | Profit Factor % | Payoff % | Esperanza % (E) | Sharpe % | Max Drawdown % | Score OnTester % |")
        lines.append("| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |")
        sorted_buy = sorted(buy_metrics.values(), key=lambda x: x["sharpe_pct"], reverse=True)
        for r in sorted_buy:
            lines.append(f"| **{r['symbol']}** | {r['trades']:,} | {r['win_rate']:.1f}% | **{r['cum_ret']:+.2f}%** | **{r['pf_pct']:.3f}** | {r['payoff_pct']:.2f} | **{r['e_pct']:+.4f}%** | **{r['sharpe_pct']:+.2f}** | {r['max_dd_pct']:.2f}% | {r['score_pct']:.2f} |")
        lines.append("")
        lines.append("---")
        lines.append("")
        
    if sell_metrics:
        lines.append("## 2. Rendimiento Cuantitativo Puro: VENTAS")
        lines.append("")
        lines.append("| Símbolo | Trades | Win Rate % | Retorno % Acum | Profit Factor % | Payoff % | Esperanza % (E) | Sharpe % | Max Drawdown % | Score OnTester % |")
        lines.append("| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |")
        sorted_sell = sorted(sell_metrics.values(), key=lambda x: x["sharpe_pct"], reverse=True)
        for r in sorted_sell:
            lines.append(f"| **{r['symbol']}** | {r['trades']:,} | {r['win_rate']:.1f}% | **{r['cum_ret']:+.2f}%** | **{r['pf_pct']:.3f}** | {r['payoff_pct']:.2f} | **{r['e_pct']:+.4f}%** | **{r['sharpe_pct']:+.2f}** | {r['max_dd_pct']:.2f}% | {r['score_pct']:.2f} |")
        lines.append("")
        lines.append("---")
        lines.append("")
        
    if buy_metrics and sell_metrics:
        lines.append("## 3. Matriz Comparativa de Asimetría Porcentual (Edge Real Long vs Short)")
        lines.append("")
        lines.append("| Símbolo | Retorno % BUY | PF % BUY | E % BUY || Retorno % SELL | PF % SELL | E % SELL || Asimetría Dominante |")
        lines.append("| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |")
        all_syms = sorted(set(list(buy_metrics.keys()) + list(sell_metrics.keys())))
        for s in all_syms:
            b = buy_metrics.get(s, {"cum_ret": 0, "pf_pct": 0, "e_pct": 0})
            v = sell_metrics.get(s, {"cum_ret": 0, "pf_pct": 0, "e_pct": 0})
            if b["pf_pct"] > 1.0 and v["pf_pct"] > 1.0:
                edge = "**BIDIRECCIONAL RENTABLE**"
            elif b["pf_pct"] > 1.0:
                edge = "**EDGE PURO EN COMPRAS**"
            elif v["pf_pct"] > 1.0:
                edge = "**EDGE PURO EN VENTAS**"
            elif b["pf_pct"] > v["pf_pct"]:
                edge = "Sesgo Alcista (Buy > Sell)"
            else:
                edge = "Sesgo Bajista (Sell > Buy)"
            lines.append(f"| **{s}** | {b['cum_ret']:+.2f}% | {b['pf_pct']:.3f} | {b['e_pct']:+.4f}% || {v['cum_ret']:+.2f}% | {v['pf_pct']:.3f} | {v['e_pct']:+.4f}% || {edge} |")
        lines.append("")

    out_file = os.path.join(output_dir, "AUDIT_PURE_PERCENTAGE_REPORT.md")
    with open(out_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"[OK] Reporte porcentual institucional generado en: {out_file}")
    return True

if __name__ == "__main__":
    generate_report()
