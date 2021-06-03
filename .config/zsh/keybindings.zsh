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
