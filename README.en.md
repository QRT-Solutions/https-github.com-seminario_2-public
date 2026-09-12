# QRT Quantitative Seminar — Strategy design and validation

Turn a market idea into an explicit hypothesis, a reviewable contract and source
code that others can inspect. [Español](README.md) · [Start here](docs/quickstart.en.md) · [Catalog](docs/strategies.md) · [Contribute](CONTRIBUTING.md)

> 🚀 **Institutional Update v2.0 (Pepperstone Latam & QRT Solutions):**  
> Introducing the **Quantitative Educator Agent (`QuantEducatorAgent`)**, the [**Canonical Guide of 100 Scientific Questions**](MT5/GUIA_100_PREGUNTAS_TRADING_CUANTITATIVO.md) across 4 pillars, [**20+ Year M1 Data Injection & 24/7 Session Unlock**](MT5/DATA_INJECTION_GUIDE.md) tools (resolving error 10018), and the [**3-Module Backtest Audit Manual**](MT5/BACKTEST_AUDIT_MANUAL.md).  
> 👉 Web chat & IDE students: see the [**AI System Instructions**](INSTRUCCIONES_SISTEMA_CREADOR_BOTS_IA.md).

The Spanish presentation explains hypotheses, entries, exits, sizing and evaluation.
The **17-strategy Pine/MQL5 catalog remains complete**, with canonical sources,
specifications, factsheets and checked deployment copies. Historical datasets and
the six research notebooks are deferred to a future seminar and are not distributed
in this edition.

Requirements: Git, [uv](https://docs.astral.sh/uv/getting-started/installation/) and
CPython 3.12, which uv can install.

```sh
git clone --config core.longpaths=true https://github.com/QRT-Solutions/seminario_2-public.git
uv run --directory seminario_2-public --locked --no-dev seminario doctor
uv run --directory seminario_2-public --locked --no-dev seminario quickstart
```

No market data, credentials or accounts are required for installation and catalog
verification. Open `seminario_2-public/masterclass/index.html` to view the offline
presentation. `seminario verify` checks schemas, IDs, paths, artifacts and copies.
Use `seminario --project "PROJECT PATH" verify` outside the project tree.

Optional native compilation and Strategy Tester execution require explicit isolated
workspaces. Source availability, valid contracts, compilation and numeric equivalence
are separate claims. The project does not certify strategy profitability.

Original material: **QRT Solutions**, [MIT](LICENSE). See [third-party notices](THIRD_PARTY_NOTICES.md),
[contributing](CONTRIBUTING.md), [security](SECURITY.md) and [release conditions](docs/release.md).

## Agent knowledge base

The [knowledge base](https://github.com/QRT-Solutions/seminario_2-public/tree/main/base_de_conocimientos) contains 50 Markdown documents, a catalog and an agent
routing index. Start with [LLM_INDEX.md](https://github.com/QRT-Solutions/seminario_2-public/tree/main/base_de_conocimientos/LLM_INDEX.md). Referenced images
are not present in the source folder. Original attribution is preserved.
