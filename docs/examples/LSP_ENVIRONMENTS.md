# LSP Environments by Technology

This guide maps each warning executable to a mini environment under `docs/examples`.

## Missing executables from WARNINGS.lsp.log

- `bash-language-server`
- `vscode-css-language-server`
- `docker-langserver`
- `emmet-ls`
- `graphql-lsp`
- `vscode-html-language-server`
- `vscode-json-language-server`
- `lua-language-server`
- `marksman`
- `pyright-langserver`
- `svelteserver`
- `tailwindcss-language-server`
- `typescript-language-server`
- `yaml-language-server`

## Mini environments

- `docs/examples/typescript` -> `typescript-language-server`, `pyright-langserver`
- `docs/examples/html` -> `vscode-html-language-server`, `emmet-ls`, `tailwindcss-language-server`
- `docs/examples/css` -> `vscode-css-language-server`, `emmet-ls`
- `docs/examples/json` -> `vscode-json-language-server`
- `docs/examples/yaml` -> `yaml-language-server`
- `docs/examples/graphql` -> `graphql-lsp`
- `docs/examples/svelte` -> `svelteserver`, `tailwindcss-language-server`
- `docs/examples/bash` -> `bash-language-server`
- `docs/examples/docker` -> `docker-langserver`
- `docs/examples/lua` -> `lua-language-server` (external binary)
- `docs/examples/markdown` -> `marksman` (standalone binary)

## Workflow

1. Enter a folder.
2. Ensure versions via `.tool-versions`.
3. Install dependencies with the listed package manager.
4. Open the fixture file and run `:LspInfo`.

For Node-based servers, launch Neovim from that folder with local binaries on PATH:

```bash
PATH="$PWD/node_modules/.bin:$PATH" nvim <fixture-file>
```
