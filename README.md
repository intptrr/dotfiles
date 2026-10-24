# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for syncing configuration across machines.

## Tools

- **zsh** — zinit plugins, starship prompt, `eza`/`bat`/`zoxide` aliases, and mise activation.
- **starship** — prompt with directory, git status, and time.
- **mise** — Python, Node.js, Go, Rust, and CLI tools (`uv`, `pnpm`, `kubectl`, OpenTofu, `ripgrep`, `fd`, `tree-sitter`).
- **git** — sane defaults, aliases, and [delta](https://github.com/dandavison/delta) as the pager.
- **lazygit** — diffs rendered with delta.
- **neovim** — [LazyVim](https://www.lazyvim.org/) with the tokyonight colorscheme.
- **ghostty** *(macOS only)* — Tokyonight theme with a translucent, blurred background.
- **zellij** — Tokyonight theme and Unlock-First keybindings (`Ctrl g` to unlock).
- **opencode** — config, MCP servers, and global `AGENTS.md`; tokens come from `~/.secrets` (see [Local Overrides](#local-overrides)).
- **yabai** *(macOS only)* — bsp tiling with 10pt gaps.
- **skhd** *(macOS only)* — hotkeys for yabai windows and spaces ([keybindings](dot_config/yabai/README.md)).

macOS-only configs are skipped on other platforms via `.chezmoiignore`.

## Requirements

Install the following before applying the dotfiles:

```
git
zsh
neovim
mise

# optional
starship
eza
bat
zoxide
opencode
zellij
git-delta
lazygit

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
