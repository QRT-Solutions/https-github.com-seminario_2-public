"""QRT Solutions: verify source evidence and explicit publication attestation."""

import argparse
import json
import os
from pathlib import Path

from seminario_lab.provenance import revision
from seminario_lab.publication import scan
from seminario_lab.validation import verify

ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--publication", action="store_true")
    parser.add_argument("--attestation", type=Path)
    args = parser.parse_args()
    failures = list(verify(ROOT)["errors"]) + scan(ROOT)
    head = revision(ROOT)
    if not head["commit"] or head["dirty"]:
        failures.append("Candidate must have a clean, identified Git commit.")
    if args.publication:
        raw = (
            args.attestation.read_text(encoding="utf-8")
            if args.attestation
            else os.environ.get("QRT_RELEASE_ATTESTATION", "{}")
        )
        attestation = json.loads(raw)
        if attestation.get("reviewed_commit") != head["commit"] or not attestation.get("reviewer"):
            failures.append("Publication requires an identified review of this exact SHA.")
        for condition in (
            "mcp_credential_revoked",
            "gateway_credential_revoked",
            "private_security_channel_verified",
            "independent_quickstart_verified",
            "all_release_assets_reviewed",
            "presentation_accessibility_reviewed",
        ):
            if attestation.get(condition) is not True:
                failures.append(f"Pending attestation: {condition}")
        if set(attestation.get("validated_platforms", [])) != {
            "linux-x86_64",
            "windows-x86_64",
            "macos-arm64",
        }:
            failures.append("Evidence from all three platforms is required.")
        if not attestation.get("evidence_references"):
            failures.append("External checks require concrete evidence references.")
    print(json.dumps({"ok": not failures, "errors": failures}, indent=2))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
