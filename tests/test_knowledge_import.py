"""QRT Solutions: preserve imported sources without hiding new broken links."""

import hashlib
import importlib.util
import json
import sys
from pathlib import Path

from seminario_lab.publication import PUBLIC_BIBLIOGRAPHY_URL, inspect


def test_basic_auth_detected_but_ordinary_prose_allowed():
    import base64

    assert not inspect(b'basic principles and basic technical concepts', 'prose')
    auth = b'Ba' + b'sic ' + base64.b64encode(b'fixture:synthetic-password')
    assert any('literal-authorization' in hit for hit in inspect(auth, 'fixture'))
    assert any('literal-authorization' in hit for hit in inspect(auth.replace(b'=', b''), 'fixture'))


def test_public_bibliography_url_does_not_hide_a_personal_path():
    assert not inspect(PUBLIC_BIBLIOGRAPHY_URL, 'bibliography')
    personal = b'/' + b'home/fixture/private'
    assert any('personal-home' in hit for hit in inspect(PUBLIC_BIBLIOGRAPHY_URL + personal, 'mixed'))


def test_imported_reference_baseline_invalidates_on_edits(tmp_path, monkeypatch):
    spec = importlib.util.spec_from_file_location(
        'check_links', Path(__file__).resolve().parents[1] / 'tools/check_links.py'
    )
    assert spec and spec.loader
    checker = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(checker)
    monkeypatch.setattr(checker, 'ROOT', tmp_path)
    monkeypatch.setattr(sys, 'argv', ['check_links.py'])
    corpus = tmp_path / 'base_de_conocimientos'
    corpus.mkdir()
    document = corpus / 'cafe\u0301.md'
    document.write_text('![Legacy figure](assets/missing.png)', encoding='utf-8')
    digest = hashlib.sha256(document.read_bytes()).hexdigest()
    (tmp_path / 'docs').mkdir()
    (tmp_path / 'docs/knowledge-import.json').write_text(json.dumps({'files': [{
        'path': 'base_de_conocimientos/caf\u00e9.md',
        'source_sha256': digest, 'published_sha256': digest,
    }]}), encoding='utf-8')
    assert checker.main() == 0
    document.write_text(document.read_text() + '\n[New link](new-missing.md)', encoding='utf-8')
    assert checker.main() == 1
    document.write_text('![Legacy figure](assets/missing.png)', encoding='utf-8')
    (corpus / 'README.md').write_text('[Index link](missing.md)', encoding='utf-8')
    assert checker.main() == 1
