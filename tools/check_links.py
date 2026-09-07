"""QRT Solutions: validate repository Markdown/HTML targets; optional HTTP checks."""

import argparse
import re
import urllib.error
import urllib.request
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
SKIP = {".git", ".venv", ".local", "artifacts", "site", "dist", "build"}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--external", action="store_true")
    args = parser.parse_args()
    failures = []
    external = set()
    for source in ROOT.rglob("*"):
        if not source.is_file() or any(part in SKIP for part in source.relative_to(ROOT).parts):
            continue
        if source.suffix not in {".md", ".html"}:
            continue
        text = source.read_text(encoding="utf-8")
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
    print(
        f"Links: {len(failures)} failures; {len(external)} external targets {'checked' if args.external else 'not requested'}"
    )
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
