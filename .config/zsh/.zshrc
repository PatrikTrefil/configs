# General
## Imports
source "${XDG_CONFIG_HOME}/zsh/ohmyzsh.zsh"
source "${XDG_CONFIG_HOME}/zsh/alias.zsh"
source "${XDG_CONFIG_HOME}/zsh/functions.zsh"
source "${XDG_CONFIG_HOME}/zsh/keybindings.zsh"

## History
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="dd.mm.yyyy"

## Basic Auto-completion
autoload -U compinit
zstyle 'completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options_+=(globdots) # auto-complete hidden files

## Reduce esc delay
export KEYTIMEOUT=1

# to prevent nested sessions
if [ "$TMUX" = "" ]; then tmux; fi
