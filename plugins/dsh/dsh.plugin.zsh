#!/bin/zsh

source "$ZSH_CUSTOM/plugins/aliases/functions/git.zsh"


alias dr='drush'

# Xdebug for drush commands when using the drush launcher.
alias drushx='DRUSH_ALLOW_XDEBUG=1 drush '
export XDEBUG_CONFIG="idekey=PHPSTORM"

export COMPOSER_MEMORY_LIMIT=-1