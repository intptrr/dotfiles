# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for syncing configuration across machines.

## What's Included

- **zsh** — `zinit`-managed setup with the `starship` prompt, `zsh-autosuggestions`, `zsh-completions`, and `fast-syntax-highlighting` (auto-installed on first shell start). Includes emacs keybindings, safety aliases (`cp -i`, `mv -i`), shortcuts, `eza`/`bat`/`zoxide` replacements for `ls`/`cat`/`cd` (when installed), and `mise` activation.
- **starship** — prompt showing user, host, directory, git branch/status (`✓` when the tree is clean and in sync with upstream), and time.
- **mise** — global tool versions: Python, Node.js (LTS), Go, Rust (stable), plus `uv`, `pnpm`, `kubectl`, and OpenTofu via the aqua backend.
- **git** — sane defaults (rebase on pull, autosquash, `zdiff3` conflict style, histogram diffs, `rerere`), handy aliases (`st`, `lg`, `wip`, `undo`, …), and includes `~/.gitconfig.local` for machine-specific overrides (e.g. user name/email).
- **neovim** — Lua config bootstrapped with [lazy.nvim](https://github.com/folke/lazy.nvim) and the [tokyonight](https://github.com/folke/tokyonight.nvim) colorscheme (night variant, transparent background).
- **ghostty** *(macOS only)* — Tokyonight theme, semi-transparent background with blur, block cursor, 100k scrollback, option-as-alt, and transparent titlebar.
- **zellij** — terminal multiplexer with the Tokyonight theme (`tokyo-night-dark`), full borders around every pane, and the Unlock-First keybinding preset so only `Ctrl g` is reserved (e.g. `Ctrl g` → `p` → `n` opens a new pane). On macOS, `Alt+h/j/k/l` and `Alt+f` go to yabai via skhd, so move between panes with `Ctrl g` → `p` → `h/j/k/l`.
- **opencode** — [opencode](https://opencode.ai/) AI coding assistant config with formatters, auto-compaction, all permissions allowed, and MCP servers (Exa, Playwright, Chrome DevTools, GitHub, Context7), plus global agent guidelines (`AGENTS.md`) and opencode v2 terminal settings (`cli.json`, system theme). The GitHub and Context7 servers read `GITHUB_TOKEN` and `CONTEXT7_API_KEY` from `~/.secrets` (see [Local Overrides](#local-overrides)).
- **yabai** *(macOS only)* — bsp tiling layout, 10pt gaps/padding, `fn` as the mouse modifier.
- **skhd** *(macOS only)* — a hotkey to open Ghostty, window focus/swap (`alt+hjkl`, `shift+alt+hjkl`), float/zoom toggles, and space focus/move bindings (`cmd+alt+<n>`, `shift+cmd+<n>`). See the [keybindings reference](dot_config/yabai/README.md).

The macOS-only configs (`ghostty`, `yabai`, `skhd`) are skipped automatically on other platforms via `.chezmoiignore`.

## Requirements

Install the following before applying the dotfiles:

```
git
zsh
neovim

# optional
starship
mise
eza
bat
zoxide
opencode
zellij

# optional, macOS only
ghostty
yabai
skhd
```

Make sure zsh is the default shell:

```shell
sudo chsh -s $(which zsh) $USER
```

## Setup

Install chezmoi (see [the docs](https://www.chezmoi.io/install/) for more options):

```shell
# macOS
brew install chezmoi

# Linux (or any platform with curl) — installs to ./bin
sh -c "$(curl -fsLS get.chezmoi.io)"

# move the binary to a directory on $PATH
sudo mv ./bin/chezmoi /usr/local/bin/
```

Initialize and apply directly:

```shell
chezmoi init --ssh --apply $GITHUB_USERNAME
```

Or, on a new machine without chezmoi installed, bootstrap everything in one step (downloads the binary, then initializes and applies):

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --ssh --apply $GITHUB_USERNAME
```

## Local Overrides

Two untracked files in `$HOME` hold machine-specific or sensitive values. Example templates are included in this repo:

- **`~/.gitconfig.local`** — git identity and any per-machine git overrides. Included from `~/.gitconfig` via the `[include]` directive. See [dot_gitconfig.local.example](dot_gitconfig.local.example).
- **`~/.secrets`** — `KEY=value` lines auto-exported as environment variables by `~/.zshrc` (e.g. `GITHUB_TOKEN`, API keys). See [dot_secrets.example](dot_secrets.example).

Copy each example into `$HOME` and fill in your values:

```shell
cp ~/.local/share/chezmoi/dot_gitconfig.local.example ~/.gitconfig.local
cp ~/.local/share/chezmoi/dot_secrets.example ~/.secrets
chmod 600 ~/.secrets
```

## Common Workflows

Edit a managed file and apply the change locally:

```shell
chezmoi edit ~/.zshrc
chezmoi diff           # preview pending changes
chezmoi apply
```

Commit and push edits back to the remote repo:

```shell
chezmoi cd             # jumps into the source repo
git add .
git commit -m "update zsh config"
git push
exit                   # leave the chezmoi shell
```

Pull the latest changes from remote and apply them:

```shell
chezmoi update
```
