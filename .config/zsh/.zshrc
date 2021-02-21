# General
## Imports
source ~/.bwsession
source ~/.config/zsh/ohmyzsh.zsh
source ~/.config/zsh/alias.zsh

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

# Functions
cheat(){
  xdg-open "$(du -a /home/patriktrefil/Mega/Documents/Other/cheatsheets | awk '{print $2}' | fzf)"
}

## rga - recursive ripgrep
## files-with-matches - only print file paths with matches
## -uu - hidden
## pretty context - colors
## phony - not a finder, but a selector
## bind - on change of the query reload the rga
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


## mainly latex cleanup
cleanup() { rm -f *.dvi *.log *.aux }

## cd using fzf
cd_fzf() { cd "$(find . -type d 2>/dev/null | fzf)" }

# Keybindings
bindkey -s '^o' 'search-open\n'
bindkey -s '^n' 'search-edit --gui\n'
bindkey -s '^h' 'search-edit --gui --home\n'
bindkey -s '^u' 'search-edit --term\n'
bindkey -s '^w' 'nvim ~/Mega/Other/Todo/todo.txt\n'
bindkey -s '^d' 'cd_fzf\n'
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
