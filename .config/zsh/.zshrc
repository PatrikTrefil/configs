source ~/.bwsession
source ~/.config/zsh/ohmyzsh.zsh
source ~/.config/zsh/alias.zsh

function cheat(){
  xdg-open "$(du -a /home/patriktrefil/Mega/Documents/Other/cheatsheets | fzf | awk '{print $2}')"
}

# History
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="dd.mm.yyyy"

# Basic Auto-completion
autoload -U compinit
zstyle 'completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options_+=(globdots) # auto-complete hidden files

# Reduce esc delay
export KEYTIMEOUT=1

# Set indicators, if not already set
: "${VI_NORMAL_MODE_INDICATOR="%(?.%F{blue}•%f%F{cyan}•%f%F{green}•%f.%F{red}•••%f) "}"
: "${VI_INSERT_MODE_INDICATOR="%(?.%F{blue}❯%f%F{cyan}❯%f%F{green}❯%f.%F{red}❯❯❯%f) "}"

# Keybindings
bindkey -s '^o' 'search-open\n'

fzf-edit() { 
  file=$(fzf); 
  [[ -d $file || -f $file || -h $file ]] && $EDITOR $file
}

bindkey -s '^n' 'search-edit --term\n'

bindkey -s '^h' 'search-edit --term --home\n'
bindkey -s '^q' 'search-edit --gui\n'

cf() { cd "$(find . -type d 2>/dev/null | fzf)" }
bindkey -s '^d' 'cf\n'

# rga - recursive ripgrep
# files-with-matches - only print file paths with matches
# -uu - hidden
# pretty context - colors
# phony - not a finder, but a selector
# bind - on change of the query reload the rga
rga-fzf() {
  RG_PREFIX="rga --files-with-matches -uu"
  local file
  file="$(
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
      fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
        --phony -q "$1" \
        --bind "change:reload:$RG_PREFIX {q}" \
        --preview-window="60%:wrap"
  )" &&
  echo "opening $file" &&
  $EDITOR "$file"
}

cleanup() { rm -f *.dvi *.log *.aux }

bindkey -s '^p' 'rga-fzf\n'

## Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
