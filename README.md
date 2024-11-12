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

Installing [tpm](https://github.com/tmux-plugins/tpm) as packages manager:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Note that we install it into `~/.config/`, instead default directory `~/.tmux/`.

```sh
cp -r ./tmux ~/.config/
```

## Zsh

Instruction for installing zsh is [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Run the following command to install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Nvim-diff

### Svn

If you are using [svn](https://subversion.apache.org/) and want to enter diff mode of nvim when executing `svn diff`, we can:

```sh
# copy the script to /bin
cp ./diff/svn-diff /bin

# grants execute mode to it
chmod +x /bin/svn-diff

# edit you global subversion configure file
nvim ~/.subversion/config
```

Set the value of key `diff-cmd` to `svn-diff`:

```conf
diff-cmd = svn-diff
```

### Git

Note that you can consult this [answer](https://stackoverflow.com/questions/7669963/how-can-i-get-a-side-by-side-diff-when-i-do-git-diff) for more information.

```sh
# copy the script to /bin
cp ./diff/nvim-diff /bin

# grants execute mode to it
chmod +x /bin/nvim-diff
```

Using `git config` to let git knows this external script:

```sh
git config --global diff.external /bin/nvim-diff
```
