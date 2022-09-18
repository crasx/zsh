#!/bin/zsh

for f in $ZSH_CUSTOM/plugins/aliases/functions/*.zsh; do source $f; done ;

alias dc='docker-compose'

alias dr='drush'

alias rezsh='source ~/.zshrc'

alias v='vagrant'
alias vup='vagrant up'

alias composer1='composer self-update --1'
alias composer2='composer self-update --2'
alias c='composer'

alias h="history"