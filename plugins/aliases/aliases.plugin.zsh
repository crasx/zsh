#!/bin/zsh

for f in $ZSH_CUSTOM/plugins/aliases/functions/*.zsh; do source $f; done ;

alias dc='docker compose'

alias dr='drush'
alias drx='DRUSH_ALLOW_XDEBUG=1 drush'

alias rezsh='source ~/.zshrc'


alias composer1='composer self-update --1'
alias composer2='composer self-update --2'
alias c='composer' 

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