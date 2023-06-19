#!/bin/zsh

##########################
# Bootstrapping
##########################
export PATH="$HOME/.composer/vendor/bin:/srv/tools/composer/vendor/bin/:$PATH"
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/zsh

ZSH_THEME="geometry"


##########################
# Plugins
##########################

# Core bash improvements
plugins=(cp history profiles)

# Command specific plugins
plugins+=(docker docker-compose composer)

# Utilities
plugins+=(jump kubectl)

# Custom plugins
plugins+=(aliases contrib dsh platforms)

# Add private zsh plugin if it exists.
if [ -d $ZSH_CUSTOM/plugins/zsh_private ]; then
    plugins+=(zsh_private)
fi


# Let oh-my-zsh do it's magic. We need to import it before defining our theme variables, but after we define our theme.
# This is because our theme variables rely on functions from the theme.
source $ZSH/oh-my-zsh.sh


########################
# Theme setup
########################

GEOMETRY_PROMPT=( geometry_hostname geometry_status geometry_path ) # redefine left prompt

if [ `whoami` != "vagrant" ]; then
    # Show helpful git status on the right, but not in vagrant.
    GEOMETRY_RPROMPT=( geometry_git geometry_exec_time )
fi

GEOMETRY_STATUS_SYMBOL="▲"             # default prompt symbol
GEOMETRY_STATUS_COLOR="default"        # prompt symbol color

GEOMETRY_STATUS_SYMBOL_ERROR="△"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="magenta"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color

# Set path color based on hash of hostname.
GEOMETRY_PATH_COLOR=`geometry::hostcolor`

# Better colors
if [ `hostname` = "hawkeye" ]; then
  GEOMETRY_PATH_COLOR=9
fi

# Docker config
export COMPOSE_DOCKER_CLI_BUILD=1;
export DOCKER_BUILDKIT=1;

DISABLE_AUTO_TITLE="true"
# clear title after command ends
customtitle() { print -n "\e]0;${PWD##*/}\a"; }
add-zsh-hook -d precmd geometry::clear_title
add-zsh-hook precmd customtitle


# export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0 idekey=PHPSTORM"
export XDEBUG_CONFIG="idekey=PHPSTORM"

# Todo: this doesnt work
HISTIGNORE="gd:gds:gs:v:c"
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|gd)"

zshaddhistory() {
  emulate -L zsh
  ## uncomment if HISTORY_IGNORE
  ## should use EXTENDED_GLOB syntax
  # setopt extendedglob
  [[ $1 != ${~HISTORY_IGNORE} ]]
}

HISTSIZE=50000
SAVEHIST=1000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
# setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Finishing touches
ssh-add 2&>/dev/null

if [ `command -v kubektl` ]; then source <(kubectl completion zsh); fi

# Great article on 027 - https://blogs.gentoo.org/mgorny/2011/10/18/027-umask-a-compromise-between-security-and-simplicity/
umask 027

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
