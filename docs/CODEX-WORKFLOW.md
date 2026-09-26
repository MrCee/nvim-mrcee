# Codex Workflow

This config treats Neovim as the local control room and Codex as a project-aware terminal agent.

## Neovim commands

| Command | Purpose |
|---|---|
| `:Codex` | Open Codex CLI in the current project |
| `:CodexYolo` | Open Codex CLI with `--yolo` |
| `:LazyGit` | Open lazygit in the current project |

## Keymaps

| Keymap | Purpose |
|---|---|
| `<leader>tt` | Floating terminal |
| `<leader>tg` | lazygit |
| `<leader>tc` | Codex |
| `<leader>ty` | Codex `--yolo` |
