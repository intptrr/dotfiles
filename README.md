# Dotfiles

The `dotfiles` have been migrated from manual scripts to `chezmoi` for managing configuration files across different machines.

## Requirements

Ensure following tools are installed before proceeding with the setup:

```
# required tools
git
zsh
neovim

# make sure the default shell is switched to zsh
chsh -s $(which zsh)
```

## Setup

To initialize all configs on the new machine:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```