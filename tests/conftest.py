"""QRT Solutions: temporary projects and synthetic edge-case fixtures only."""

import shutil
from pathlib import Path

import pytest


@pytest.fixture
def project(tmp_path):
    root = tmp_path / "project with spaces"
    root.mkdir()
    (root / "pyproject.toml").write_text('[tool.seminario]\nproject = "qrt-seminario-lab"\n')
    return root


@pytest.fixture
def strategy_project(project):
    source = Path(__file__).resolve().parents[1]
    for folder in ("quant_agentic_swarm", "MT5", "TradingView"):
        shutil.copytree(
            source / folder, project / folder, ignore=shutil.ignore_patterns("__pycache__")
        )
    return project
