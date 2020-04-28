export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git sudo fasd fzf)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:"$HOME/scripts"
export PATH=$PATH:"$HOME/.local/bin"

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
export PATH=$PATH:$TOOLS_DIR/ghidra_9.0.4
export PATH=$PATH:$TOOLS_DIR/llvm-FileCheck
export PATH=$PATH:/usr/lib/llvm-8/bin/
export FZF_BASE=$HOME/Tools/fzf

# Variscite
export ARMGCC_DIR=~/workspace/Secubit/var-som-mx7_m4-freertos/gcc-arm-none-eabi-5_4-2016q3
export MACHINE=var-som-mx7
export MX7_BASE_DIR=/home/itayg/workspace/Secubit/var_som_mx7_debian

source $ZSH/oh-my-zsh.sh

## ENV VARS
export EDITOR='emacs'

## ALIASES
alias q="exit"
alias bd="bg && disown"
alias b="bat"
alias c="bat"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/itayg/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/home/itayg/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/itayg/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/itayg/Tools/google-cloud-sdk/completion.zsh.inc'; fi

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
source /home/itayg/Tools/subrepo/.rc
fpath=('/home/itayg/Tools/subrepo/share/zsh-completion' $fpath)

alias py=python
function pye () {
	python -c "print($1:q)"
}

alias nb="python3 /home/itayg/workspace/NextSilicone/omp-playground/nextsilicon_build.py"
. /home/itayg/.nix-profile/etc/profile.d/nix.sh

fpath+=${ZDOTDIR:-~}/.zsh_functions
