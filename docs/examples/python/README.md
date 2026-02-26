# Python LSP Environment

## Runtime

- asdf: `python 3.14.3`, `nodejs 20.17.0`
- package managers: `pip`/`uv` for Python packages, `pnpm` for `pyright-langserver`

## Install

```bash
corepack enable
pnpm install
python -m pip install ruff
```

## Expected local binary

- `./node_modules/.bin/pyright-langserver`

## Fixture

- `example.py`
