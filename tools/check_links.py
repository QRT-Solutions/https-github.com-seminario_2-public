"""QRT Solutions: validate repository Markdown/HTML targets; optional HTTP checks."""

import argparse
import hashlib
import json
import re
import urllib.error
import urllib.request
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
SKIP = {".git", ".venv", ".local", "artifacts", "site", "dist", "build"}


def imported_reference_baseline(root: Path) -> dict[str, str]:
    """Keep legacy references only for the exact, documented corpus snapshots."""
    manifest = root / "docs/knowledge-import.json"
    if not manifest.exists():
        return {}
    entries = json.loads(manifest.read_text(encoding="utf-8"))["files"]
    return {
        entry["path"]: entry["published_sha256"]
        for entry in entries
        if entry["path"].startswith("base_de_conocimientos/")
        and Path(entry["path"]).name not in {"README.md", "LLM_INDEX.md"}
        and entry["path"].endswith(".md")
        and entry["source_sha256"] == entry["published_sha256"]
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--external", action="store_true")
    args = parser.parse_args()
    failures = []
    external = set()
    baseline = imported_reference_baseline(ROOT)
    historical_references = 0
    for source in ROOT.rglob("*"):
        if not source.is_file() or any(part in SKIP for part in source.relative_to(ROOT).parts):
            continue
        if source.suffix not in {".md", ".html"}:
            continue
        text = source.read_text(encoding="utf-8")
        imported_unchanged = baseline.get(source.relative_to(ROOT).as_posix()) == (
            hashlib.sha256(source.read_bytes()).hexdigest()
        )
        if source.suffix == ".md":
            # Fenced examples are not navigation targets.
            text = re.sub(r"```[\s\S]*?```", "", text)
            targets = re.findall(r"!?\[[^\]]*\]\(([^)]+)\)", text)
        else:
            targets = re.findall(r"""(?:href|src)=["']([^"']+)["']""", text)
        for target in targets:
            url = target.strip().strip("<>").split(' "')[0]
            parsed = urlsplit(url)
            if parsed.scheme in {"https", "http"}:
                external.add(url)
                continue
            if parsed.scheme or not parsed.path:
                continue
            path = (source.parent / unquote(parsed.path)).resolve()
            if not path.is_relative_to(ROOT) or not path.exists():
                if imported_unchanged:
                    historical_references += 1
                else:
                    failures.append(f"{source.relative_to(ROOT)}: {url}")
    if args.external:
        for url in sorted(external):
            try:
                request = urllib.request.Request(
                    url, headers={"User-Agent": "QRT-Seminar-link-check/1.0"}
                )
                with urllib.request.urlopen(request, timeout=20) as response:
                    if response.status >= 400:
                        failures.append(f"HTTP {response.status}: {url}")
            except (urllib.error.URLError, TimeoutError):
                failures.append(f"HTTP unavailable: {url}")
    for failure in failures:
        print(failure)
    if historical_references:
        print(f"Imported corpus: {historical_references} historical references unavailable; "
              "source hashes unchanged (see docs/knowledge-import.json)")
    print(
        f"Links: {len(failures)} failures; {len(external)} external targets {'checked' if args.external else 'not requested'}"
    )
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
