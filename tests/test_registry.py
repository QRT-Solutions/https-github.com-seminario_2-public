import json

import pytest

from seminario_lab.config import LabError
from seminario_lab.platforms import BacktestWorkspace
from seminario_lab.validation import deploy, verify


def mutate_registry(root, callback):
    p = root / "quant_agentic_swarm/STRATEGY_REGISTRY.json"
    rows = json.loads(p.read_text())
    callback(rows)
    p.write_text(json.dumps(rows))


def test_seventeen_contracts_and_sources(strategy_project):
    assert verify(strategy_project) == {
        "author": "QRT Solutions",
        "strategies": 17,
        "errors": [],
        "ok": True,
    }


def test_duplicate_ids_fail(strategy_project):
    mutate_registry(strategy_project, lambda rows: rows.append(rows[0]))
    assert not verify(strategy_project)["ok"]


def test_deployer_repairs_copy_and_detects_drift(strategy_project):
    target = next((strategy_project / "MT5/estrategias").glob("*.mq5"))
    original = target.read_bytes()
    target.write_bytes(b"drift")
    assert not verify(strategy_project)["ok"]
    deploy(strategy_project)
    assert target.read_bytes() == original
    assert verify(strategy_project)["ok"]


def test_deployer_rejects_path_escape(strategy_project, tmp_path):
    outside = tmp_path / "do-not-change.mq5"
    outside.write_text("untouched")
    mutate_registry(
        strategy_project, lambda rows: rows[0]["artifacts"].update(mt5_ea="../do-not-change.mq5")
    )
    with pytest.raises(LabError):
        deploy(strategy_project)
    assert outside.read_text() == "untouched"


def test_schema_donchian_has_no_sentinel(strategy_project):
    p = next(
        (strategy_project / "quant_agentic_swarm/strategies").glob(
            "*DONCHIAN_DBL-M30-v1.1_specification.json"
        )
    )
    spec = json.loads(p.read_text())
    assert spec["profit_exit"] == {"kind": "donchian_trailing", "channel_period": 10}
    assert spec["triple_barrier_exits"]["barrier_1_profit_atr_d1_multiplier"] is None
    spec["triple_barrier_exits"]["barrier_1_profit_atr_d1_multiplier"] = 50
    p.write_text(json.dumps(spec))
    assert not verify(strategy_project)["ok"]


def test_workspace_never_reuses_unmarked_directory(project):
    directory = project / "artifacts/mt5/existing"
    directory.mkdir(parents=True)
    with pytest.raises(LabError):
        BacktestWorkspace(project, "existing")
    with pytest.raises(LabError):
        BacktestWorkspace(project, "../other")


def test_preparation_only_copies_to_isolated_workspace(strategy_project):
    workspace = BacktestWorkspace(strategy_project, "test-fixture")
    source = workspace.prepare(
        strategy_project,
        "STRAT-20260903-DONCHIAN_DBL-M30-v1.1",
        "XAUUSD",
        "2022-02-01",
        "2024-02-01",
    )
    assert source.is_relative_to(strategy_project / "artifacts/mt5")
    config = (workspace.path / "tester.ini").read_text()
    assert "ShutdownTerminal=1" in config and "Login=" not in config


def test_date_time_format_is_actually_validated(strategy_project):
    path = next((strategy_project / "quant_agentic_swarm/strategies").glob("*_specification.json"))
    document = json.loads(path.read_text())
    document["timestamp"] = "not-a-timestamp"
    path.write_text(json.dumps(document))
    assert not verify(strategy_project)["ok"]


def test_deferred_masterclass_data_cannot_return(strategy_project):
    directory = strategy_project / "masterclass/data"
    directory.mkdir(parents=True)
    (directory / "fixture.csv").write_text("synthetic fixture,not market data\n")
    assert not verify(strategy_project)["ok"]
