#!/bin/zsh
DRUSHPATH=$HOME/.drush

drush-vagrant-alias(){
echo "<?php

\$aliases['l'] = array (

   'root' => '/var/www/html/docroot',
   'uri' => '"`grep "hostentry" ansible/vars/common.yml | sed 's/hostentry\: \(.*\)/\1/' | sed -e 's/^[ \t]*//'`"',
   'remote-host' => '"`grep "hostentry" ansible/vars/common.yml | sed 's/hostentry\: \(.*\)/\1/' | sed -e 's/^[ \t]*//'`"',
   'remote-user' => 'vagrant',
   'ssh-options' => '-i "`pwd`"/.vagrant/machines/default/virtualbox/private_key'
 );" > $DRUSHPATH/$1.aliases.drushrc.php

}

