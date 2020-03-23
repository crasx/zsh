#!/bin/bash

sudo apt install zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/1a880fdb9b88c0c98a23d7b2ed2ddb42caef6662/tools/install.sh

# Check md5 for security

if md5sum --status -c <(echo c4bc4d38832d7e0066a1f35d184d39ae install.sh); then
  sh install.sh
else
  print "Oh my zsh hash did not match."
   exit 1;
fi

rm install.sh

cd ~ && git clone git@github.com:crasx/zsh.git --recurse-submodules
ln -s zsh/.zshrc