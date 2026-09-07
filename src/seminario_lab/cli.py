"""QRT Solutions: portable diagnostics and research-contract verification."""

import argparse
import importlib.util
import json
import platform
import sys
from pathlib import Path
from typing import Any

from .config import LabError, project_root
from .validation import verify


def doctor(root: Path) -> dict[str, Any]:
    report = verify(root)
    return {
        "python": platform.python_version(),
        "supported_python": sys.version_info[:2] == (3, 12),
        "jsonschema_installed": importlib.util.find_spec("jsonschema") is not None,
        "presentation_available": (root / "masterclass/index.html").is_file(),
        "strategies": report["strategies"],
        "registry_valid": report["ok"],
        "native_compilation": "optional_not_verified",
        "credentials_required": False,
        "ready": sys.version_info[:2] == (3, 12)
        and report["ok"]
        and (root / "masterclass/index.html").is_file(),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        prog="seminario", description="QRT Solutions: diseño y contratos verificables"
    )
    parser.add_argument("--project", help="Raíz explícita del proyecto")
    commands = parser.add_subparsers(dest="command", required=True)
    for name in ("doctor", "verify", "quickstart"):
        commands.add_parser(name)
    args = parser.parse_args(argv)
    try:
        root = project_root(args.project)
        if args.command == "doctor":
            report = doctor(root)
            print(json.dumps(report, indent=2))
            return 0 if report["ready"] else 1
        report = verify(root)
        print(json.dumps(report, indent=2, ensure_ascii=False))
        if not report["ok"]:
            return 1
        if args.command == "quickstart":
            print("Empieza en docs/start.md. Abre masterclass/index.html para ver la presentación.")
        return 0
    except LabError as error:
        print(str(error), file=sys.stderr)
        return 2
    except Exception as error:
        print(
            f"Error de verificación ({type(error).__name__}); ejecutar seminario doctor.",
            file=sys.stderr,
        )
        return 3
