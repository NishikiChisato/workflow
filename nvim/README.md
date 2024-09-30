## Description

The neovim configuration file

## Usage

Delete or backup `~/.config/nvim/`, `~/.local/share/nvim/` and `~/.local/state/nvim/`:

```sh
# delete
rm -rf ~/.config/nvim/*
rm -rf ~/.local/share/nvim/*
rm -rf ~/.local/state/nvim/*

# backup
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
```

Paste this `nvim` file to `~/.config/` and start `nvim`:

```sh
# assume nvim exist in current directory
cp ./nvim ~/.config
```
