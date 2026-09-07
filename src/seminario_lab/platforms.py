"""QRT Solutions: optional isolated MetaEditor/Strategy Tester utilities."""

import argparse
import hashlib
import json
import platform
import shutil
import subprocess
from pathlib import Path

from .config import LabError, confined, project_root
from .integrity import sha256
from .validation import registry, verify


class BacktestWorkspace:
    """Only repository-owned artifact workspaces; no terminal discovery or accounts."""

    def __init__(self, root: Path, name: str) -> None:
        if not name.isascii() or not name.replace("-", "").replace("_", "").isalnum():
            raise LabError("Nombre de workspace inválido.")
        self.path = confined(root, f"artifacts/mt5/{name}")
        self.marker = self.path / ".qrt-backtest-workspace"
        if self.path.exists() and not self.marker.is_file():
            raise LabError("No se reutiliza un directorio sin marca de laboratorio.")
        self.path.mkdir(parents=True, exist_ok=True)
        self.marker.write_text("QRT Solutions: isolated backtesting only\n", encoding="utf-8")

    def prepare(self, root: Path, strategy_id: str, symbol: str, start: str, end: str) -> Path:
        from datetime import date

        if not verify(root)["ok"]:
            raise LabError("El catálogo debe ser válido.")
        if not symbol or not all(c.isalnum() or c in "._-" for c in symbol):
            raise LabError("Símbolo inválido.")
        if date.fromisoformat(start) >= date.fromisoformat(end):
            raise LabError("El intervalo de pruebas debe ser creciente.")
        entries = [e for e in registry(root) if e["strategy_id"] == strategy_id]
        if not entries:
            raise LabError("Estrategia desconocida.")
        source = confined(root, entries[0]["artifacts"]["mql5_ea"])
        destination = confined(self.path, f"MQL5/Experts/{source.name}")
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
        specification = json.loads(
            confined(root, entries[0]["artifacts"]["specification"]).read_text(encoding="utf-8")
        )
        timeframe = specification["market_regime_mtf"]["execution_timeframe"]
        config = confined(self.path, "tester.ini")
        config.write_text(
            "[Tester]\n"
            + f"Expert={strategy_id}.ex5\nSymbol={symbol}\nPeriod={timeframe}\n"
            + f"FromDate={start.replace('-', '.')}\nToDate={end.replace('-', '.')}\n"
            + "Model=0\nOptimization=0\nVisual=0\nDeposit=100000\nCurrency=USD\n"
            + "Report=report.html\nReplaceReport=1\nShutdownTerminal=1\n",
            encoding="utf-8",
        )
        metadata = {
            "author": "QRT Solutions",
            "strategy_id": strategy_id,
            "source_sha256": sha256(source),
            "symbol": symbol,
            "start": start,
            "end": end,
            "timeframe": timeframe,
            "native_test": "not_run",
            "numerical_equivalence": "not_verified",
        }
        (self.path / "preparation.json").write_text(
            json.dumps(metadata, indent=2) + "\n", encoding="utf-8"
        )
        return destination

    def compile(self, source: Path, editor: Path, version: str) -> dict[str, str]:
        if platform.system() != "Windows":
            raise LabError(
                "Compilación nativa disponible solo en Windows con MetaEditor explícito."
            )
        if not version.strip() or not editor.is_file() or editor.suffix.lower() != ".exe":
            raise LabError("Indique MetaEditor y su versión verificable.")
        source = confined(self.path, source.relative_to(self.path).as_posix())
        if source.suffix != ".mq5" or not source.is_file():
            raise LabError("Fuente de compilación inválida.")
        binary = source.with_suffix(".ex5")
        binary.unlink(missing_ok=True)  # Prevent stale build from being mistaken for this source.
        log = confined(self.path, "compile.log")
        process = subprocess.run(
            [str(editor.resolve()), f"/compile:{source}", f"/log:{log}"],
            timeout=180,
            check=False,
            capture_output=True,
        )
        if process.returncode != 0 or not binary.is_file():
            raise LabError(
                "Compilación fallida; inspeccione el log local redactando datos privados."
            )
        result = {
            "source_sha256": sha256(source),
            "binary_sha256": sha256(binary),
            "editor_version_declared": version,
            "editor_sha256": sha256(editor),
        }
        (self.path / "compilation.json").write_text(
            json.dumps(result, indent=2) + "\n", encoding="utf-8"
        )
        return result

    def test(self, terminal: Path) -> dict[str, str]:
        if platform.system() != "Windows":
            raise LabError("Strategy Tester requiere Windows y una copia portable aislada.")
        terminal = terminal.resolve()
        if not terminal.is_relative_to(self.path) or terminal.name.lower() != "terminal64.exe":
            raise LabError("El terminal debe pertenecer al workspace aislado explícito.")
        config = confined(self.path, "tester.ini")
        if not config.is_file() or not (self.path / "compilation.json").is_file():
            raise LabError("Prepare y compile el experimento antes de ejecutarlo.")
        text = config.read_text(encoding="utf-8")
        if (
            "[Tester]" not in text
            or "ShutdownTerminal=1" not in text
            or any(
                word in text.casefold()
                for word in ("login=", "password=", "server=", "[experts]", "[startupprogram]")
            )
        ):
            raise LabError("Configuración ajena al perfil de backtesting.")
        report = confined(self.path, "report.html")
        report.unlink(missing_ok=True)
        process = subprocess.run(
            [str(terminal), "/portable", f"/config:{config}"],
            cwd=self.path,
            timeout=3600,
            check=False,
            capture_output=True,
        )
        if process.returncode != 0 or not report.is_file():
            raise LabError("No se obtuvo un reporte nuevo del tester.")
        result = {
            "report_sha256": sha256(report),
            "terminal_sha256": sha256(terminal),
            "configuration_sha256": hashlib.sha256(text.encode()).hexdigest(),
            "numerical_equivalence": "not_verified",
        }
        (self.path / "test.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
        return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project")
    parser.add_argument("--workspace", required=True)
    commands = parser.add_subparsers(dest="command", required=True)
    prepare = commands.add_parser("prepare")
    for option in ("strategy", "symbol", "start", "end"):
        prepare.add_argument("--" + option, required=True)
    compile_command = commands.add_parser("compile")
    compile_command.add_argument("--source", required=True)
    compile_command.add_argument("--editor", required=True, type=Path)
    compile_command.add_argument("--editor-version", required=True)
    tester = commands.add_parser("test")
    tester.add_argument("--terminal", required=True)
    args = parser.parse_args()
    try:
        root = project_root(args.project)
        workspace = BacktestWorkspace(root, args.workspace)
        if args.command == "prepare":
            workspace.prepare(root, args.strategy, args.symbol, args.start, args.end)
        elif args.command == "compile":
            workspace.compile(
                confined(workspace.path, args.source), args.editor, args.editor_version
            )
        else:
            workspace.test(confined(workspace.path, args.terminal))
        print("Operación de laboratorio completada; revisar evidencia local.")
        return 0
    except LabError as error:
        print(str(error))
        return 2
    except Exception as error:
        print(f"Error de plataforma ({type(error).__name__}).")
        return 3


if __name__ == "__main__":
    raise SystemExit(main())
