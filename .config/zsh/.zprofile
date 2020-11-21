export BROWSER="firefox"
export TERMINAL="alacritty"
export LOCK="$HOME/.scripts/xlock"
export PAGER='less'
export EDITOR='nvim'
export GEDITOR='code'
export READER='zathura'

export MUSIC='/home/patriktrefil/Mega/Music/'

export BW_SESSION="8R1SrdlsttDkEi3VPYInyLbotEs8cAmOc0l1NflSataIcSPkA+yuBikVMPPNo/kqPjCYQHmDVrvJZL4JzZov2A=="

export TZ='Europe/Prague'
# ZSH config
export ZDOTDIR="$HOME/.config/zsh"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# NPM permissions
export PATH=~/.npm-global/bin:$PATH
# HomeBrew
export PATH="/usr/local/sbin:$PATH"
# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Pip
export PATH=/Users/Patrik/Library/Python/2.7/bin:$PATH
# Go
export PATH=/usr/share/go/bin:$PATH
# Custom scripts
export PATH=~/.scripts:$PATH
# Status bar scripts
export PATH=~/.scripts/status-scripts:$PATH
# GO Path
export GOPATH=/usr/share/go

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Cache
export MYPY_CACHE_DIR="${XDG_CACHE_HOME}/mypy"

# Data
export PYLINTHOME="${XDG_DATA_HOME}/pylint"
export AUDACITY_PATH="${XDG_DATA_HOME}/audacity"

# History files
export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/lesshst"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

# Configs
export MYVIMRC="${XDG_CONFIG_HOME}/vim/vimrc"
export VIMINIT='source $MYVIMRC'
export VIFM="${XDG_CONFIG_HOME}/vifm"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"

export QT_QPA_PLATFORMTHEME="gtk2" # make qt use gtk2 (was qt5ct)
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/.gtkrc-2.0"

export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

export LANG=en_US.UTF-8

export CLICOLOR=1
export FZF_DEFAULT_COMMAND='find .'

export FZF_DEFAULT_OPTS='--multi --reverse --preview="([[ -f {} ]] && ([[ {} = ".*\.pdf" ]] && (pdftotext {} -)) || (bat --style=numbers --color=always {} 2>/dev/null || cat {} 2>/dev/null)) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200"'

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/tty.map 2>/dev/null

tdm
