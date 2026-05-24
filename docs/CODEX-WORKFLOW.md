# Codex Workflow

This config treats Neovim as the local control room and Codex as a project-aware terminal agent.

## Neovim commands

| Command | Purpose |
|---|---|
| `:Codex` | Open Codex CLI in the current project |
| `:CodexYolo` | Open Codex CLI with `--yolo` |
| `:CodexHandover` | Run `scripts/codex-handover` for the current project |
| `:LazyGit` | Open lazygit in the current project |

## Keymaps

| Keymap | Purpose |
|---|---|
| `<leader>tt` | Floating terminal |
| `<leader>tg` | lazygit |
| `<leader>tc` | Codex |
| `<leader>ty` | Codex `--yolo` |
| `<leader>th` | Codex handover |

## Handover flow

1. Work locally in Neovim.
2. Run Codex from inside the project.
3. Review changes.
4. Run `:CodexHandover`.
5. The handover is written to a local `codex-sync` checkout.
6. Push `codex-sync`.
7. In ChatGPT Web UI, use the connected GitHub handover file to continue.

## Privacy

The handover script redacts common local paths, emails, GitHub tokens, and API-key-like strings. Do not paste secrets into handover notes.
