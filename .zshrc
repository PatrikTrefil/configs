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

## tmux
# if already in tmux, don't start nested tmux
# if [ "$TMUX" = "" ]; then tmux; fi

## node version manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval `ssh-agent >/dev/null`
