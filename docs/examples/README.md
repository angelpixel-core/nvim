# LSP Smoke Test Fixtures

Open these files to quickly verify attach, completion, hover, definition, references, rename, and diagnostics.

Environment setup details per technology:

- `docs/examples/LSP_ENVIRONMENTS.md`

- `docs/examples/lua/example.lua` -> `lua_ls`
- `docs/examples/ruby/example.rb` -> `ruby_lsp`
- `docs/examples/python/example.py` -> `pyright`
- `docs/examples/rust/main.rs` -> `rust_analyzer`
- `docs/examples/typescript/example.ts` -> `ts_ls`
- `docs/examples/html/example.html` -> `html`, `emmet_ls`, `tailwindcss`
- `docs/examples/css/example.css` -> `cssls`, `emmet_ls`
- `docs/examples/svelte/App.svelte` -> `svelte`, `tailwindcss`
- `docs/examples/graphql/schema.graphql` -> `graphql`
- `docs/examples/markdown/lsp-check.md` -> `marksman`
- `docs/examples/bash/example.sh` -> `bashls`
- `docs/examples/docker/Dockerfile` -> `dockerls`
- `docs/examples/json/example.json` -> `jsonls`
- `docs/examples/yaml/example.yaml` -> `yamlls`
- `docs/examples/solidity/example-contract.sol` -> `solidity_ls`

Quick check in Neovim:

```vim
:LspInfo
```

Use `K`, `gd`, `gr`, `<leader>rn` in each file.

For each folder, read its local `README.md` for runtime version and binary location.

Bootstrap all mini environments and generate a binary report:

```bash
./docs/examples/bootstrap-all.sh
```
