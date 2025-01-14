# Dotfiles

The `dotfiles` have been migrated from manual scripts to `chezmoi` for managing configuration files across different machines.

## Requirements

Ensure following tools are installed before proceeding with the setup:

```
zsh
neovim
```

## Setup

To initialize all configs on the new machine:

```shell
chezmoi init --apply $GITHUB_USERNAME
```