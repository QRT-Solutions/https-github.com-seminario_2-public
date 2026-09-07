"""QRT Solutions: explicit, portable project and resource boundaries."""

import tomllib
from pathlib import Path


class LabError(Exception):
    """A safe, user-facing diagnostic authored by the laboratory."""


def project_root(explicit: str | Path | None = None) -> Path:
    """Find this project's marker, never a directory belonging to another project."""
    if explicit is not None:
        candidates = [Path(explicit).expanduser().resolve()]
    else:
        start = Path.cwd().resolve()
        candidates = [start, *start.parents]
    for candidate in candidates:
        marker = candidate / "pyproject.toml"
        if marker.is_file():
            with marker.open("rb") as stream:
                config = tomllib.load(stream)
            if config.get("tool", {}).get("seminario", {}).get("project") == "qrt-seminario-lab":
                return candidate
    raise LabError("No se encontró el seminario. Use --project RUTA.")


def confined(base: Path, relative: str) -> Path:
    """Reject absolute paths, traversal and symlink escape on every platform."""
    from pathlib import PureWindowsPath

    if Path(relative).is_absolute() or PureWindowsPath(relative).drive or "\\" in relative:
        raise LabError("La ruta debe ser relativa y utilizar separadores portables.")
    target = (base / relative).resolve()
    if not target.is_relative_to(base.resolve()):
        raise LabError("El recurso queda fuera del directorio permitido.")
    return target
