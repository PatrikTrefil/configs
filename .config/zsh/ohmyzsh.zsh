ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_UNICODE=true
ZSH_TMUX_CONFIG=~/.config/tmux/.tmux.conf

#sudo -n loadkeys ~/.scripts/ttykeymaps.kmap

# Enable prompt substition. Necessary to use vi_mode_status in your prompt
setopt PROMPT_SUBST

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
#DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(safe-paste zsh-syntax-highlighting zsh-vim-mode fzf npm pylint pip tmux)
source $ZSH/oh-my-zsh.sh

# User configuration
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
