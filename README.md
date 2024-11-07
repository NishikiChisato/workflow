# workflow

## Neovim

### Usage

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

### Prerequisite

#### Herd Font

1. Download

We can go to the [Nerd Fonts releases page](https://github.com/ryanoasis/nerd-fonts/releases) to download the font we want.

For example, we can download `Hack` Nerd Font using the following command:

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/Hack.zip
```

2. Unzip and Create local fonts directory

Unzip the downloaded fonts archive:

```bash
unzip Hack.zip -d Hack
```

Create local fonts directory

```bash
mkdir -p ~/.local/share/fonts
```

3. Move the fonts to the local fonts directory

```bash
mv Hack/*.ttf ~/.local/share/fonts
```

4. Update the fonts cache

```bash
fc-cache -fv
```

5. Verify Installation

```bash
fc-list | grep "Hack"
```

#### ripgrep

`Telescope live_grep` relies on `ripgrep` for searching, we can install it using:

```bash
sudo apt-get install ripgrep
```

#### fd-find

`Telescope find_files` relies on `fd-find` for searching, we can install it using:

```bash
sudo apt-get install fd-find
```

## Tmux

### Usage

```sh
cp -r ./tmux ~/.config/
```

## Zsh

Instruction for installing zsh is [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Run the following command to install ohmyzsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

