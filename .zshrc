# See https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template for defaults

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/zsh

HYPHEN_INSENSITIVE="true"
# ZSH_THEME="geometry"

plugins=(git cp copydir history profiles autojump composer)


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/contrib/geometry/geometry.zsh

GEOMETRY_PROMPT=(geometry_status geometry_path ) # redefine left prompt
GEOMETRY_RPROMPT+=(geometry_exec_time pwd)      # append exec_time and pwd right prompt
GEOMETRY_STATUS_SYMBOL="▲"             # default prompt symbol
GEOMETRY_STATUS_SYMBOL_ERROR="△"       # displayed when exit value is != 0
GEOMETRY_STATUS_COLOR_ERROR="magenta"  # prompt symbol color when exit value is != 0
GEOMETRY_STATUS_COLOR="default"        # prompt symbol color
GEOMETRY_STATUS_COLOR_ROOT="red"       # root prompt symbol color
GEOMETRY_STATUS_COLOR_HASH=true        # color status symbol based on hostname
