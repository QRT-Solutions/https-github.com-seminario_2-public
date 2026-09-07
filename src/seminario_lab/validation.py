"""QRT Solutions: schema, registry, source and deployment invariants."""

import json
import re
import shutil
from pathlib import Path
from typing import Any

import jsonschema

from .config import LabError, confined
from .integrity import sha256

ID = re.compile(r"STRAT-\d{8}-[A-Za-z0-9_]+-[A-Za-z0-9]+-v\d+(?:\.\d+)?")


def registry(root: Path) -> list[dict[str, Any]]:
    with (root / "quant_agentic_swarm/STRATEGY_REGISTRY.json").open(encoding="utf-8") as stream:
        result = json.load(stream)
    if not isinstance(result, list):
        raise LabError("El registro debe ser una lista.")
    return result


def verify(root: Path, *, deployment: bool = True) -> dict[str, Any]:
    errors: list[str] = []
    swarm = root / "quant_agentic_swarm"
    schema = json.loads((swarm / "schemas/strategy_specification.schema.json").read_text())
    cls = jsonschema.validators.validator_for(schema)
    cls.check_schema(schema)
    validator = cls(schema, format_checker=jsonschema.FormatChecker())
    identifiers: set[str] = set()
    for item in registry(root):
        sid = item.get("strategy_id", "")
        if not isinstance(sid, str) or not ID.fullmatch(sid) or sid in identifiers:
            errors.append("Identificador inválido o duplicado en registro.")
            continue
        identifiers.add(sid)
        artifacts = item.get("artifacts", {})
        for required in ("specification", "mql5_ea"):
            if not artifacts.get(required):
                errors.append(f"{sid}: falta {required}")
        for kind, relative in artifacts.items():
            if relative is None:
                continue
            if not isinstance(relative, str):
                errors.append(f"{sid}: ruta de artefacto inválida")
                continue
            try:
                target = confined(root, relative)
                allowed = root / "MT5/estrategias" if kind == "mt5_ea" else swarm / "strategies"
                if not target.is_relative_to(allowed.resolve()) or (
                    not target.is_file() and (deployment or kind != "mt5_ea")
                ):
                    errors.append(f"{sid}: artefacto inexistente o fuera de destino ({kind})")
                    continue
                if not target.name.startswith(sid + ".") and not target.name.startswith(sid + "_"):
                    errors.append(f"{sid}: nombre de artefacto no corresponde al ID")
                if kind == "specification":
                    specification = json.loads(target.read_text(encoding="utf-8"))
                    profit = specification.get("profit_exit", {})
                    barrier = specification.get("triple_barrier_exits", {}).get(
                        "barrier_1_profit_atr_d1_multiplier"
                    )
                    if (
                        profit.get("kind") == "fixed_atr"
                        and profit.get("atr_d1_multiplier") != barrier
                    ):
                        errors.append(f"{sid}: salidas fijas inconsistentes")
                    if specification.get("artifacts") != artifacts:
                        errors.append(f"{sid}: artefactos del contrato no corresponden al registro")
                    if specification.get("strategy_id") != sid:
                        errors.append(f"{sid}: contrato con ID diferente")
                    errors.extend(
                        f"{sid}: contrato inválido ({e.validator})"
                        for e in validator.iter_errors(specification)
                    )
            except LabError:
                errors.append(f"{sid}: ruta no confinada")
        if deployment:
            for kind, suffix, destination in (
                ("mql5_ea", ".mq5", "MT5/estrategias"),
                ("pine_script", ".pine", "TradingView/pine/strategies"),
            ):
                relative = artifacts.get(kind)
                if not relative:
                    continue
                try:
                    source = confined(root, relative)
                    target = confined(root, f"{destination}/{sid}{suffix}")
                    if (
                        not source.is_file()
                        or not target.is_file()
                        or sha256(source) != sha256(target)
                    ):
                        errors.append(f"{sid}: copia desincronizada ({kind})")
                except LabError:
                    errors.append(f"{sid}: despliegue fuera de destino")
    for source in (swarm / "strategies").glob("*_specification.json"):
        if source.name.removesuffix("_specification.json") not in identifiers:
            errors.append(f"Contrato no registrado: {source.name}")
    for source in (swarm / "strategies").glob("*.mq5"):
        if source.stem not in identifiers:
            errors.append(f"Código sin contrato registrado: {source.name}")
    for base in (swarm, root / "TradingView"):
        for source in base.rglob("*.pine"):
            text = source.read_text(encoding="utf-8-sig")
            if not text.startswith("//@version=6") or "@version=5" in text:
                errors.append(f"Versión Pine inválida: {source.name}")
    # This edition retains the platform catalog but defers the historical teaching tracks.
    masterclass = root / "masterclass"
    for source in masterclass.rglob("*"):
        if source.is_file() and source.suffix.lower() in {".gz", ".csv", ".ipynb"}:
            errors.append("masterclass contiene históricos o notebooks fuera de esta edición")
    for name in ("index.html", "app.js", "guion.md"):
        source = masterclass / name
        if source.is_file() and re.search(
            r"\b(?:NQ|GC)\b|Nasdaq|XAUUSD", source.read_text(encoding="utf-8"), re.I
        ):
            errors.append(f"masterclass conserva un recorrido retirado: {name}")
    return {
        "author": "QRT Solutions",
        "strategies": len(identifiers),
        "errors": errors,
        "ok": not errors,
    }


def deploy(root: Path) -> None:
    result = verify(root, deployment=False)
    # Newly missing deployment targets are permitted only for generation.
    errors = result["errors"]
    if errors:
        raise LabError("El registro debe ser válido antes de generar copias.")
    for item in registry(root):
        for kind, extension, folder in (
            ("mql5_ea", ".mq5", "MT5/estrategias"),
            ("pine_script", ".pine", "TradingView/pine/strategies"),
        ):
            relative = item["artifacts"].get(kind)
            if relative:
                source = confined(root, relative)
                target = confined(root, f"{folder}/{item['strategy_id']}{extension}")
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source, target)
