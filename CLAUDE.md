# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Installation

Symlink configs to their expected locations using Make:

```sh
make mac    # macOS: aerospace, alacritty, nvim, sketchybar, tmux, zsh
make linux  # Linux: alacritty, bin, dunst, font, i3, mako, nvim, spotify, sway, tmux, waybar, x, zsh
```

Individual targets can also be run (e.g. `make nvim`, `make zsh`).

## Repository Structure

This is a personal dotfiles repo. Each top-level directory corresponds to one tool, and the Makefile symlinks files into their expected system paths.

**macOS-specific tools:** `aerospace/` (tiling WM), `sketchybar/` (status bar)
**Linux-specific tools:** `i3/`, `sway/`, `waybar/`, `dunst/`, `mako/`, `x/`
**Cross-platform:** `nvim/`, `zsh/`, `tmux/`, `alacritty/`

## Neovim

Config lives in `nvim/`. Structure:
- `init.lua` — entry point; loads `options`, `keymaps`, `lazy-bootstrap`, `lazy-plugins`
- `lua/lazy-plugins.lua` — plugin list using [lazy.nvim](https://github.com/folke/lazy.nvim)
- `lua/plugins/` — one file per plugin configuration
- `lazy-lock.json` — lockfile for reproducible plugin versions (symlinked to `~/.config/nvim/lazy-lock.json`)

Leader key is `<Space>`. Key plugins: LSP (lspconfig), completion (cmp), telescope, neo-tree, copilot, claudecode, treesitter, conform (formatting), catppuccin theme.

To update plugins: open nvim and run `:Lazy update`, then commit the updated `lazy-lock.json`.

## AeroSpace + Sketchybar (macOS)

`aerospace/aerospace.toml` — tiling WM config. Launches sketchybar on startup and notifies it on workspace changes.
`sketchybar/` — status bar with plugins for battery, clock, network, volume, Spotify, and AeroSpace workspace display.

## Zsh

`zsh/zshrc` uses oh-my-zsh with the `steeef` theme. Plugins: aws, git, battery, kubectl, zsh-autosuggestions, fzf, kube-ps1, asdf. Extensive kubectl aliases are defined (e.g. `k`, `pods`, `services`). `vim` is aliased to `nvim`.

## Theme

Catppuccin Mocha is used consistently across alacritty, neovim, waybar, and GTK.
