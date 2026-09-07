# English quickstart

Install Git and uv; CPython 3.12 is required and can be installed by uv. Run the
three commands in the [English README](../README.en.md) from your chosen parent
directory. The pinned environment is defined by `pyproject.toml` and `uv.lock`.

```sh
uv run --locked --no-dev seminario doctor
uv run --locked --no-dev seminario verify
```

Open `masterclass/index.html` to view the presentation locally. Required scripts,
icons and styles are bundled. Its interactive examples are teaching illustrations.
This edition needs no historical datasets or notebooks; those tracks are deferred.
All 17 Pine/MQL5 catalog entries are retained.

Run from another directory with `seminario --project "PROJECT PATH" verify`.
No environment variables, credentials or broker accounts are required.

For contributors: `uv sync --locked --group dev`, `uv run pytest` and
`uv run mkdocs build --strict`. The site is built locally, not published automatically.
The [Spanish learning path](start.md) describes each exercise.
