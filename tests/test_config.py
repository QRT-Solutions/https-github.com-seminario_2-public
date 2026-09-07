import pytest

from seminario_lab.config import LabError, confined, project_root


@pytest.mark.parametrize("relative", ["../escape", "/absolute", "C:\\private\\file", "..\\escape"])
def test_confined_rejects_escape(project, relative):
    with pytest.raises(LabError):
        confined(project, relative)


def test_root_with_spaces_and_explicit_project(project, monkeypatch):
    child = project / "seminar"
    child.mkdir()
    monkeypatch.chdir(child)
    assert project_root() == project
    monkeypatch.chdir(project.parent)
    with pytest.raises(LabError, match="--project"):
        project_root()
    assert project_root(project) == project
