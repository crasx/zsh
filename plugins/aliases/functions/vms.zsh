#!/bin/bash

# Aliases for Lando projects
alias ldr='lando drush'
alias lblt='lando blt'

alias lnd='lando'
alias l='lando'

# Aliases for ddev projects
alias dd='ddev'
alias ddr='ddev exec drush'
alias ddr='ddev exec vendor/bin/blt'



# I often have multiple VM's running at once. This helps shut them all down.
vagrantshutdownall(){
 vagrant global-status  | grep running | awk '{print $1}' | xargs -n1 echo vagrant halt | bash
}