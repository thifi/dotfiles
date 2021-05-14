## Overview
These are my personal dotfiles.

You are welcome to take a look,
and make any suggestion for improvements !

## Dependencies

- [GNU Stow](https://www.gnu.org/software/stow/)

### Shell
- [Zsh](http://www.zsh.org/)
- fish (oh-my-fish: fzf, fasd and robbyrussell-theme)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [fasd](https://github.com/clvv/fasd)
- [Terminator](https://wiki.archlinux.org/index.php/Terminator)
- Alacritty (rust) + alacritty-theme (Their is vi mode is awesome!!)
- [fzf](https://github.com/junegunn/fzf)
- exa (rust)
- bat (rust)
- delta (rust)
- Nix

### Emacs
- [Emacs](https://www.gnu.org/software/emacs/) 24.5
- [spacemacs](https://github.com/syl20bnr/spacemacs)
- [emacs-launcher](https://github.com/ItayGarin/emacs-launcher)

### i3 Window Manager
- [i3](https://i3wm.org/)
- [i3blocks](https://github.com/vivien/i3blocks)
- [jumpapp](https://github.com/mkropat/jumpapp)
- [compton](https://github.com/chjj/compton)
- [scrot](https://github.com/dreamer/scrot)
- [Albert](https://albertlauncher.github.io/docs/installing/)

## Install

```shell
sudo apt-get install stow
git clone https://github.com/ItayGarin/dotfiles ~/dotfiles
./dotfiles/setup.sh
```

## home-manager

I had to add this to `~/.profile` for nix desktop files to register on Ubuntu.

```shell
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$HOME/.share:"${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
```
