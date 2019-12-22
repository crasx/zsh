# See https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template for defaults

export PATH="$HOME/.composer/vendor/bin:/srv/tools/composer/vendor/bin/:$PATH"

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/zsh

HYPHEN_INSENSITIVE="true"
# ZSH_THEME="geometry"

plugins=(cp copydir history profiles autojump composer)


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


source $ZSH/oh-my-zsh.sh

for f in $ZSH_CUSTOM/contrib/*/*.plugin.zsh; do source $f; done
for f in $ZSH_CUSTOM/plugins/*/*.zsh; do source $f; done



GEOMETRY_PROMPT=(whoami geometry_status geometry_path ) # redefine left prompt
GEOMETRY_RPROMPT=(pwd geometry_git )      # append exec_time and pwd right prompt
GEOMETRY_STATUS_SYMBOL="▲"             # default prompt symbol
GEOMETRY_STATUS_SYMBOL_ERROR="△"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="magenta"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR="default"        # prompt symbol color
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color
GEOMETRY_STATUS_COLOR_HASH=true        # color status symbol based on hostname
GEOMETRY_PATH_COLOR="cyan"

DISABLE_AUTO_TITLE="true"
# clear title after command ends
customtitle() { print -n "\e]0;${PWD##*/}\a"; }
add-zsh-hook -d precmd geometry::clear_title
add-zsh-hook precmd customtitle



export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0 idekey=PHPSTORM"
export XDEBUG_CONFIG="idekey=PHPSTORM"

HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
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
