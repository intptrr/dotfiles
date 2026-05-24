# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for syncing configuration across machines.

## What's Included

- **zsh** — `oh-my-zsh` with the `ys` theme, `zsh-autosuggestions`, and `zsh-syntax-highlighting` plugins (auto-installed on first shell start). Includes safety aliases (`rm -I`, `cp -i`, `mv -i`), shortcuts, and `nvm` loader.
- **git** — sane defaults (rebase on pull, autosquash, `zdiff3` conflict style, histogram diffs, `rerere`), handy aliases (`st`, `lg`, `wip`, `undo`, …), and includes `~/.gitconfig.local` for machine-specific overrides (e.g. user name/email).
- **neovim** — Lua config bootstrapped with [lazy.nvim](https://github.com/folke/lazy.nvim) and the [tokyonight](https://github.com/folke/tokyonight.nvim) colorscheme (night variant, transparent background).
- **ghostty** *(macOS only)* — Tokyonight theme, semi-transparent background with blur, block cursor, 100k scrollback, option-as-alt, and transparent titlebar.
- **yabai** *(macOS only)* — bsp tiling layout, 11pt gaps/padding, `fn` as the mouse modifier.
- **skhd** *(macOS only)* — hotkeys for iTerm, window float/zoom toggles, and space focus/move bindings (`cmd+alt+<n>`, `shift+cmd+<n>`).

The macOS-only configs (`ghostty`, `yabai`, `skhd`) are skipped automatically on other platforms via `.chezmoiignore`.

## Requirements

Install the following before applying the dotfiles:

```
git
zsh
neovim

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
chezmoi init --apply $GITHUB_USERNAME
```

Or, on a new machine without chezmoi installed, bootstrap everything in one step (downloads the binary, then initializes and applies):

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
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
