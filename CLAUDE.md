# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Kickstart is intentionally a *single-file, read-every-line* starting point rather than a distribution: the bulk of the config lives in one large `init.lua`, and customizations are layered on top of it. Preserve that philosophy — prefer editing the relevant section of `init.lua` in place over introducing new abstractions or splitting things up, unless a change clearly belongs in the modular directories described below.

## Layout

- `init.lua` — the entire core config: options, keymaps, autocommands, and the full `require('lazy').setup({...})` plugin table (Telescope, LSP/Mason, blink.cmp completion, conform formatting, treesitter, mini.nvim, gitsigns, which-key). This is where most plugin config lives inline.
- `lua/plugins/` — user plugin specs pulled in explicitly from `init.lua` (e.g. `require 'plugins.colorscheme'`). `colorscheme.lua` sets rose-pine (with several alternative colorschemes kept commented out).
- `lua/kickstart/plugins/` — optional kickstart-provided plugin modules. Only the ones `require`d in `init.lua` are active. Currently **only `neo-tree` is enabled**; `debug`, `lint`, `autopairs`, `indent_line`, and `gitsigns` exist here but are commented out in `init.lua`.
- `lua/custom/plugins/` — drop-in directory for additional plugins. Currently empty (`return {}`); wiring it up requires uncommenting the `{ import = 'custom.plugins' }` line in `init.lua`.
- `lazy-lock.json` — pinned plugin versions, committed (it is deliberately *un*-gitignored). Updating plugins changes this file.
- `pack/nvim/start/nvim-lspconfig/` — a vendored native-package copy of nvim-lspconfig, loaded outside lazy.nvim via Neovim's built-in `:packadd` mechanism.

## Customizations layered onto stock kickstart

When reasoning about behavior, note these deviations from upstream kickstart:

- **LSP servers** (in the `servers` table inside the `nvim-lspconfig` config): `ts_ls`, `phpactor` (with explicit `cmd`/`root_markers`/`workspace_required`), and `lua_ls`. Add new language servers here — they are auto-installed via mason-tool-installer.
- **Treesitter** `ensure_installed` adds `typescript`, `javascript`, `php` on top of the defaults.
- **Indentation**: `softtabstop`/`shiftwidth` set to `4` (spaces).
- **Custom keymaps** beyond kickstart defaults: `öö` exits insert mode (German-keyboard-friendly `<Esc>`); `<C-e>` toggles neo-tree (alongside `\`).
- Leader key is `<space>`; `vim.g.have_nerd_font = true`.

## Working in this config

There is no build/test/lint pipeline — this is runtime Lua config for Neovim. To validate changes, the config must be loaded by Neovim itself.

- **Format Lua**: `stylua .` (config in `.stylua.toml`: 2-space indent, 160 column width, single quotes preferred, no call parentheses). `stylua` is also auto-installed via Mason and runs on save via conform.nvim. Match this style when editing Lua.
- **Check health / diagnose**: run `:checkhealth` inside Neovim.
- **Plugin management**: `:Lazy` (status/update/sync), `:Mason` (LSP/tool installs). Plugins are declared in the `lazy.setup` table in `init.lua`.
- **Verify a change**: open Neovim (`nvim`) and watch for startup errors; use `:Lazy` and `:checkhealth` to confirm plugins loaded. Because config is loaded at startup, a syntax or runtime error in `init.lua` can break the whole editor — check startup output after edits.
