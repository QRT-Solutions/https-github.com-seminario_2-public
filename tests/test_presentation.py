"""Structural checks complement the still-required human visual review."""

import json
import re
from pathlib import Path

from seminario_lab.integrity import sha256

ROOT = Path(__file__).resolve().parents[1]


def test_presentation_uses_local_required_resources():
    html = (ROOT / "masterclass/index.html").read_text(encoding="utf-8")
    required = re.findall(r"""<(?:script|link|img)\b[^>]*(?:src|href)=["']([^"']+)""", html)
    assert required
    assert not any(url.startswith(("http:", "https:", "//")) for url in required)
    for url in required:
        if not url.startswith("data:"):
            assert (ROOT / "masterclass" / url.split("?")[0]).is_file()


def test_vendor_bytes_have_identified_licenses():
    manifest = json.loads((ROOT / "masterclass/vendor/manifest.json").read_text(encoding="utf-8"))
    for entry in manifest["libraries"]:
        assert sha256(ROOT / "masterclass/vendor" / entry["file"]) == entry["sha256"]
    assert len(list((ROOT / "licenses").glob("*-LICENSE"))) == 3


def test_keyboard_and_motion_accommodations_are_present():
    html = (ROOT / "masterclass/index.html").read_text(encoding="utf-8")
    css = (ROOT / "masterclass/styles.css").read_text(encoding="utf-8")
    js = (ROOT / "masterclass/app.js").read_text(encoding="utf-8")
    assert 'aria-live="polite"' in html
    assert "prefers-reduced-motion" in css and ":focus-visible" in css
    assert "slide.inert" in js and "document.createElement('button')" in js


def test_deferred_tracks_are_absent_from_masterclass():
    masterclass = ROOT / "masterclass"
    assert not any(masterclass.rglob("*.csv*"))
    assert not any(masterclass.rglob("*.ipynb"))
    for name in ("index.html", "app.js", "guion.md"):
        assert not re.search(
            r"\b(?:NQ|GC)\b|Nasdaq|XAUUSD", (masterclass / name).read_text(encoding="utf-8"), re.I
        )
