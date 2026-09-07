"""QRT Solutions: install a release tool from exact URLs and checked SHA-256."""

import hashlib
import io
import json
import os
import platform
import tarfile
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main() -> None:
    metadata = json.loads((ROOT / "tools/gitleaks-manifest.json").read_text())
    system = platform.system().lower()
    machine = "arm64" if platform.machine().lower() in {"arm64", "aarch64"} else "x64"
    name = f"gitleaks_{metadata['version']}_{system}_{machine}.tar.gz"
    entry = metadata["assets"][name]
    with urllib.request.urlopen(entry["url"], timeout=30) as response:
        payload = response.read(32 * 1024 * 1024 + 1)
    if len(payload) > 32 * 1024 * 1024 or hashlib.sha256(payload).hexdigest() != entry["sha256"]:
        raise SystemExit("Gitleaks checksum mismatch")
    output = ROOT / ".local/tools/gitleaks"
    output.parent.mkdir(parents=True, exist_ok=True)
    with tarfile.open(fileobj=io.BytesIO(payload)) as archive:
        member = archive.extractfile("gitleaks")
        if member is None:
            raise SystemExit("Missing executable")
        output.write_bytes(member.read())
    os.chmod(output, 0o755)
    print("Verified Gitleaks installed under .local/tools")


if __name__ == "__main__":
    main()
