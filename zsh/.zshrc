export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
plugins=(lein git zsh-256color history-substring-search zsh-syntax-highlighting sudo fasd)

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:"$HOME/scripts"

# Nim PATH Settings
export PATH=$PATH:"/opt/Nim/bin"
export PATH=$PATH:"$HOME/.nimble/bin"

# Rust PATH Settings
export PATH=$PATH:"$HOME/.multirust/toolchains/stable/cargo/bin"
export PATH=$PATH:"$HOME/.multirust/toolchains/nightly/cargo/bin"
export RUST_SRC_PATH="$HOME/.multirust/src/stable/src"

# Go PATH Settings
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

source $ZSH/oh-my-zsh.sh

## FASD
eval "$(fasd --init posix-alias zsh-hook)"

## ENV VARS
export EDITOR='emacs'

## ALIASES
alias q="exit"
alias bd="bg && disown"