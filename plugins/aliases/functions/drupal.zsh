#!/bin/zsh

alias dr='drush -Dssh.tty=0'

# Xdebug for drush commands when using the d`rush launcher.
alias drushx='DRUSH_ALLOW_XDEBUG=1 drush '
export XDEBUG_CONFIG="idekey=PHPSTORM"

export COMPOSER_MEMORY_LIMIT=-1

alias c='composer'


