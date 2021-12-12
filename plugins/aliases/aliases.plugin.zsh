#!/bin/zsh

source "$ZSH_CUSTOM/plugins/aliases/functions/git.zsh"
source "$ZSH_CUSTOM/plugins/aliases/functions/vagrant.zsh"

alias dc='docker-compose'

alias dr='drush'
alias ldr='lando drush'
alias lblt='lando blt'

alias rezsh='source ~/.zshrc'

alias v='vagrant'
alias vup='vagrant up'

alias composer1='composer self-update --1'
alias composer2='composer self-update --2'
alias c='composer'