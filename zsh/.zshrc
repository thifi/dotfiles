export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git sudo fasd fzf)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:"$HOME/scripts"

# Rust PATH Settings
export PATH=$PATH:"$HOME/.cargo/bin"

# Go PATH Settings
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Tools PATH Settings
export TOOLS_DIR=$HOME/Tools
export PATH=$PATH:$TOOLS_DIR/
export PATH=$PATH:$TOOLS_DIR/baudline_1.08_linux_x86_64
export PATH=$PATH:$TOOLS_DIR/hackrf-spectrum-analyzer/src/hackrf-sweep/build
export FZF_BASE=$HOME/Tools/fzf

source $ZSH/oh-my-zsh.sh

## ENV VARS
export EDITOR='emacs'

## ALIASES
alias q="exit"
alias bd="bg && disown"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/itayg/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/itayg/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/itayg/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/itayg/Tools/google-cloud-sdk/completion.zsh.inc'; fi

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
