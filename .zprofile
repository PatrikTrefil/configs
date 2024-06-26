export TZ='Europe/Prague'
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
# User
export BROWSER="firefox"
export TERMINAL="alacritty"
export PAGER='less'
export EDITOR='nvim'
export GEDITOR='vscodium'
export READER='zathura'
export NOTES_DIR="${HOME}/Mega/Documents/Other/Notes"
export SCRIPTS="${HOME}/.scripts/"
export MUSIC="${HOME}/Mega/Music/"
export LOCK="${HOME}/.scripts/xlock"
export WALL="${HOME}/Mega/Other/Wallpapers"
# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
# NPM permissions
export PATH="${HOME}/.npm-global/bin:$PATH"
# Ruby Bundler
export PATH="${HOME}/.local/share/gem/ruby/3.0.0/bin:$PATH"
# HomeBrew
# export PATH="/usr/local/sbin:$PATH"
# MacPorts
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Pip
# export PATH=/Users/Patrik/Library/Python/2.7/bin:$PATH
# Go
export PATH="/usr/share/go/bin:$PATH"
# Custom scripts
export PATH="${HOME}/.scripts:$PATH"
# Status bar scripts
export PATH="${HOME}/.scripts/status-scripts:$PATH"
export PATH="${HOME}/.scripts/nmcli-dmenu/:$PATH"
# GO Path
export GOPATH="/usr/share/go"
# Cache mypy
export MYPY_CACHE_DIR="${XDG_CACHE_HOME}/mypy"
# Data
export PYLINTHOME="${XDG_DATA_HOME}/pylint"
export AUDACITY_PATH="${XDG_DATA_HOME}/audacity"
# History files
export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/lesshst"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
# Configs
export MYVIMRC="${XDG_CONFIG_HOME}/nvim/init.vim"
export VIMINIT="source ${MYVIMRC}"
export VIFM="${XDG_CONFIG_HOME}/vifm"
# GUI
export QT_QPA_PLATFORMTHEME="gtk2" # make qt use gtk2 (was qt5ct)
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/.gtkrc-2.0"
# Colors in Less
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# Colors in terminal
export CLICOLOR=1
# ssh
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
# FZF
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS='--multi --reverse --preview="([[ -f {} ]] && ([[ {} = ".*\.pdf" ]] && (pdftotext {} -)) || (bat --style=numbers --color=always {} 2>/dev/null || cat {} 2>/dev/null)) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200"'
# gpg
export GPG_TTY=$(tty)
# Switch escape and caps if tty and no passwd required (linux only)
# sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/tty.map 2>/dev/null
# Console display manager on linux
# tdm --silent
