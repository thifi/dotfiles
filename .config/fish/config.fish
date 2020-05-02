set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cF forward-word
bind -M insert \cB backward-word
bind -M insert \cJ end-of-line
bind -M insert \cA beginning-of-line
bind -M insert \cP history-search-backward
bind -M insert \cN history-search-forward

## ALIASES
alias q="exit"
alias bd="bg && disown"
alias b="bat"
alias c="bat"
alias nb="python3 /home/itayg/workspace/NextSilicone/omp-playground/nextsilicon_build.py"
