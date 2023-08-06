#!/bin/bash

if command -v lando &> /dev/null; then
    # Aliases for Lando projects
    alias ldr='lando drush'
    alias lblt='lando blt'

    alias lnd='lando'
    alias l='lando'
fi

if command -v ddev &> /dev/null; then
    # Aliases for ddev projects
    alias dd='ddev'
    alias ddr='ddev exec drush'
    alias dblt='ddev exec vendor/bin/blt'
fi


if command -v vagrant &> /dev/null; then
    # Aliases for vagrant projects
    alias v='vagrant'
    alias vup='vagrant up'

    # Shutdown all vagrant vms
    vagrantshutdownall(){
    vagrant global-status  | grep running | awk '{print $1}' | xargs -n1 echo vagrant halt | bash
    }
fi