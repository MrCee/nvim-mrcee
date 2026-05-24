# AGENTS.md

## Project

This repository contains the nvim-mrcee Neovim configuration.

## Rules

- Keep the config portable across macOS, Linux, and Synology.
- Do not commit personal names, local usernames, emails, tokens, keys, or machine-specific secrets.
- Keep OSC52 support available for SSH/Linux/Synology sessions.
- Keep local macOS clipboard behaviour normal.
- Prefer small plugin modules under `lua/mrcee/plugins/`.
- Do not replace the whole config with a distro.
- When changing plugin behaviour, include a headless startup test.
- When changing keymaps or commands, document them in `docs/CODEX-WORKFLOW.md`.

## Validation

Use:

```zsh
NVIM_APPNAME=nvim-mrcee command nvim --headless "+Lazy! sync" +qa
NVIM_APPNAME=nvim-mrcee command nvim --headless "+lua print('nvim-mrcee ok')" +qa
NVIM_APPNAME=nvim-mrcee command nvim --headless '+lua print(vim.g.clipboard and vim.g.clipboard.name or "normal-local-clipboard")' +qa
```

Expected local macOS clipboard result:

```text
normal-local-clipboard
```

Expected SSH/Linux/Synology clipboard result:

```text
OSC52
```
