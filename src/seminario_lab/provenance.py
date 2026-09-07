"""QRT Solutions: identify the exact local source revision without private metadata."""

import subprocess
from pathlib import Path
from typing import Any


def revision(root: Path) -> dict[str, Any]:
    def git(*args: str) -> str | None:
        process = subprocess.run(
            ["git", "-C", str(root), *args], capture_output=True, text=True, check=False
        )
        return process.stdout.strip() if process.returncode == 0 else None

    status = git("status", "--porcelain")
    return {
        "commit": git("rev-parse", "HEAD"),
        "dirty": bool(status) if status is not None else None,
    }
