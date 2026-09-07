"""QRT Solutions: stage an explicit offline documentation tree for MkDocs."""

import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def on_config(config, **kwargs):
    config["docs_dir"] = str(ROOT / ".local/site-source")
    return config


def on_pre_build(config, **kwargs):
    destination = Path(config["docs_dir"])
    if not destination.resolve().is_relative_to(ROOT / ".local"):
        raise ValueError("Documentation staging must remain inside .local")
    if destination.exists():
        shutil.rmtree(destination)
    destination.mkdir(parents=True)
    for name in (
        "README.md",
        "README.en.md",
        "LICENSE",
        "SECURITY.md",
        "CONTRIBUTING.md",
        "CODE_OF_CONDUCT.md",
        "THIRD_PARTY_NOTICES.md",
        "CHANGELOG.md",
    ):
        shutil.copyfile(ROOT / name, destination / name)
    (destination / "README.md").rename(destination / "index.md")
    for name in ("docs", "licenses", "quant_agentic_swarm", "TradingView", "MT5"):
        shutil.copytree(
            ROOT / name, destination / name, ignore=shutil.ignore_patterns("__pycache__", "*.pyc")
        )
    masterclass = destination / "masterclass"
    masterclass.mkdir()
    for name in ("index.html", "styles.css", "app.js", "guion.md", "QRT-LOGO.png"):
        shutil.copyfile(ROOT / "masterclass" / name, masterclass / name)
    html = masterclass / "index.html"
    html.write_text(html.read_text().replace("../docs/methodology.md", "../docs/methodology.html"))
    if (ROOT / "masterclass/vendor").exists():
        shutil.copytree(ROOT / "masterclass/vendor", masterclass / "vendor")
    for page in destination.rglob("*.md"):
        page.write_text(
            page.read_text(encoding="utf-8").replace("README.md)", "index.md)"), encoding="utf-8"
        )
