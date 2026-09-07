"""QRT Solutions: fail-closed publication checks; never display matching content."""

import argparse
import gzip
import io
import json
import re
import subprocess
import zipfile
from pathlib import Path

from .config import LabError, project_root

RULES = {
    "personal-home": re.compile(
        rb"/" + rb"Users/|/home/[A-Za-z][^/\s]+/|[A-Za-z]:\\\\Users\\\\", re.I
    ),
    "literal-authorization": re.compile(
        rb"\b(?:bearer|basic)[ \t]+[A-Za-z0-9._~+/-]{8,}={0,2}", re.I
    ),
    "private-key": re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----"),
    "provider-token": re.compile(
        rb"(?:gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{30,}|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9_-]{24,})"
    ),
    "credential-assignment": re.compile(
        rb"""(?i)(?:api[_-]?key|access[_-]?token|secret[_-]?key|password|auth[_-]?token)\s*[=:]\s*["'][A-Za-z0-9_+/=.-]{12,}["']"""
    ),
    "retired-infrastructure": re.compile(rb"10[.]211[.]55[.]4|185[.]56[.]138[.]170"),
    "unrelated-project": re.compile(
        rb"Grupo[ _]de[ _]Inteligencia|GI[F]/|Proyectos[_]Desarrollo/", re.I
    ),
}
MAX_BYTES = 512 * 1024 * 1024
SKIP = {
    ".git",
    ".venv",
    ".pytest_cache",
    ".mypy_cache",
    ".ruff_cache",
    "__pycache__",
    "artifacts",
    "site",
    "dist",
    "build",
    ".local",
}


def inspect(data: bytes, label: str, depth: int = 0) -> list[str]:
    if len(data) > MAX_BYTES or depth > 4:
        raise LabError("El artefacto excede el límite de inspección.")
    findings = [
        f"{key}: {label}"
        for key, rule in RULES.items()
        if any(rule.search(view) for view in (data, data.replace(b"\0", b"")))
    ]
    if data.startswith(b"\x1f\x8b"):
        with gzip.GzipFile(fileobj=io.BytesIO(data)) as source:
            unpacked = source.read(MAX_BYTES + 1)
        findings += inspect(unpacked, label + ":gzip", depth + 1)
    elif data.startswith(b"PK\x03\x04"):
        with zipfile.ZipFile(io.BytesIO(data)) as archive:
            if sum(e.file_size for e in archive.infolist()) > MAX_BYTES:
                raise LabError("El contenedor excede el límite de inspección.")
            for index, entry in enumerate(archive.infolist()):
                if not entry.is_dir():
                    findings += inspect(entry.filename.encode(), label + ":entry-name", depth + 1)
                    findings += inspect(archive.read(entry), f"{label}:zip:{index}", depth + 1)
    return findings


def scan(root: Path, *, history: bool = True, artifacts: list[Path] | None = None) -> list[str]:
    findings: list[str] = []
    tracked = subprocess.run(
        ["git", "-C", str(root), "ls-files", "-z", "--cached", "--others", "--exclude-standard"],
        capture_output=True,
        check=True,
    ).stdout
    for raw in filter(None, tracked.split(b"\0")):
        relative = raw.decode("utf-8")
        findings += inspect(raw, "path")
        path = root / relative
        if path.is_symlink():
            findings.append(f"symlink-not-portable: {relative}")
            continue
        if path.is_file():
            if path.suffix.lower() in {".ex5", ".pyc"}:
                findings.append(f"unreviewed-binary: {relative}")
            findings += inspect(path.read_bytes(), relative)
    for artifact in artifacts or []:
        findings += inspect(artifact.read_bytes(), "release-artifact")
    if history:
        process = subprocess.run(
            ["git", "-C", str(root), "rev-list", "--objects", "--all", "--no-object-names"],
            capture_output=True,
            check=True,
        )
        for oid in process.stdout.splitlines():
            kind = (
                subprocess.check_output(["git", "-C", str(root), "cat-file", "-t", oid.decode()])
                .strip()
                .decode()
            )
            if kind in {"blob", "commit", "tag"}:
                data = subprocess.check_output(
                    ["git", "-C", str(root), "cat-file", kind, oid.decode()]
                )
                findings += inspect(data, f"history:{oid.decode()}")
    return sorted(set(findings))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project")
    parser.add_argument("--no-history", action="store_true")
    parser.add_argument("--artifact", action="append", type=Path, default=[])
    args = parser.parse_args()
    try:
        findings = scan(
            project_root(args.project), history=not args.no_history, artifacts=args.artifact
        )
        print(json.dumps({"ok": not findings, "findings": findings}, indent=2))
        return 1 if findings else 0
    except Exception as error:
        print(json.dumps({"ok": False, "error_class": type(error).__name__}))
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
