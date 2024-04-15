#!/bin/zsh

for f in $ZSH_CUSTOM/plugins/aliases/functions/*.zsh; do source $f; done ;

alias dc='docker compose'
alias rezsh='source ~/.zshrc'

alias h="history"

alias ll="ls -altr"

hr() {
  echo "------------------------------------------------------------"
}

mkcd() {
  mkdir -p $1
  cd $1
}

aptupgrade() {
  sudo apt update
  sudo apt upgrade
}