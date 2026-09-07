import gzip
import io
import subprocess
import zipfile

import pytest

from seminario_lab.publication import inspect, scan


@pytest.mark.parametrize("encoding", ["utf-8", "utf-16-le"])
def test_personal_paths_and_tokens_detected_without_echo(encoding):
    path = "/" + "Users/" + "fixture/private"
    credential = "Bear" + "er " + "example" * 5
    findings = inspect((path + "\n" + credential).encode(encoding), "fixture")
    assert any("personal-home" in f for f in findings)
    assert any("literal-authorization" in f for f in findings)
    assert credential not in str(findings)


def test_dynamic_auth_is_not_a_literal_secret():
    data = b'headers = {"Authorization": f"Bear' + b'er {token}"}'
    assert not inspect(data, "fixture")


def test_nested_container_scan():
    payload = ("/" + "Users/" + "fixture/private").encode()
    stream = io.BytesIO()
    with zipfile.ZipFile(stream, "w") as archive:
        archive.writestr("nested.gz", gzip.compress(payload))
    assert inspect(stream.getvalue(), "fixture")


def test_history_only_secret_is_detected(project):
    def git(*args):
        return subprocess.run(["git", "-C", str(project), *args], check=True, capture_output=True)

    git("init", "-b", "main")
    git("config", "user.name", "QRT Solutions")
    git("config", "user.email", "fixture@example.invalid")
    file = project / "fixture.txt"
    file.write_text("Bear" + "er " + "example" * 5)
    git("add", ".")
    git("commit", "-m", "Synthetic history fixture")
    file.write_text("clean")
    git("add", ".")
    git("commit", "-m", "Clean working tree")
    assert not scan(project, history=False)
    assert any("history:" in finding for finding in scan(project))
