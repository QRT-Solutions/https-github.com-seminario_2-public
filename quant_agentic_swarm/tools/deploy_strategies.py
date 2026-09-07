"""QRT Solutions: generate research source copies or verify their integrity."""

import argparse

from seminario_lab.config import project_root
from seminario_lab.validation import deploy, verify


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--project")
    args = parser.parse_args()
    root = project_root(args.project)
    if not args.check:
        deploy(root)
    result = verify(root)
    for error in result["errors"]:
        print(error)
    print(f"{result['strategies']} estrategias; sincronía: {result['ok']}")
    return 0 if result["ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
