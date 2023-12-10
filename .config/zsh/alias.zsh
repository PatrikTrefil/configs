# Aliases
alias weather="curl wttr.in"
alias ccat="highlight --out-format=ansi" # Syntax highlighting for cat
alias speed="speedometer -r wlp0s20f3" # Internet Spped
alias yt="youtube-dl --add-metadata -ic" # Video
alias yta="youtube-dl --add-metadata -xic --audio-format mp3" # Audio
alias wget="wget --hsts-file ~/.cache/wget/wget-hsts"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias manf='man -k . | fzf'
alias c='vscodium'
alias config='git --git-dir=$HOME/configs.git/ --work-tree=$HOME'
# Shortcodes
alias g="git"
alias p="sudo pacman"
alias p3="python3"
alias cl="clear"
alias t="nvim ~/Mega/Other/Todo/todo.txt"
# Editors
alias em="emacs"
alias v="nvim"
alias e="nvim"
alias gnvim="gnvim --disable-ext-cmdline"
alias r="ranger"
alias tmux="tmux -u"
alias mv="mv -i"
alias rm="rm -i"
alias la="ls -lAhv --color=auto --group-directories-first"
alias cp="cp -i" # Confirm before overwriting
# Default Options
alias ls="ls -Av --color=auto --group-directories-first"
alias mkdr="mkdir -pv" # make parent directory if non-existent, and give visual feedback
alias less="less -x2R"
# Controls
alias internet="nmtui"
alias audio="pulsemixer" # pavucontrol
alias music="ncmpcpp"
