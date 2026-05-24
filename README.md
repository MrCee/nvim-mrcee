# nvim-mrcee

A personal Neovim configuration built from a maintained Lazy.nvim-style setup and adapted for cross-machine use.

## Goals

- Keep the config small enough to understand.
- Keep plugin management explicit through Lazy.nvim.
- Support local macOS use.
- Support remote SSH editing on Linux and Synology using OSC52 clipboard.
- Provide a clean base for terminal, Git, LSP, Treesitter, and future AI/Codex workflows.

## Clipboard behaviour

Local desktop sessions use the normal system clipboard.

SSH, Linux, and Synology sessions automatically enable OSC52 clipboard support so yanks can reach the local terminal clipboard when the terminal supports OSC52.

## Upstream reference

This configuration was initially seeded from the public Neovim config in:

- josean-dev/dev-environment-files

It is maintained here as an independent configuration.

## Codex workflow

This config includes a Codex terminal workflow and handover helper.

See:

- `docs/CODEX-WORKFLOW.md`
- `scripts/codex-handover`

## Attribution

This configuration was initially seeded from the public Neovim setup in `josean-dev/dev-environment-files`, then adapted and maintained independently as `nvim-mrcee`.

See `ATTRIBUTION.md` for details.
