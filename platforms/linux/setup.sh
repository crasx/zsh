#!/bin/bash

setup_zsh(){
  echo "ZSH install:"
  if [ ! `command -v zsh` ]; then
    sudo apt install zsh -y && echo "Completed." || echo "Failed."
  else
    echo "Skipped"
  fi
}

setup_ohmyzsh(){
  echo "Oh My ZSH install:"

  if [ ! -d .oh-my-zsh ]; then
    wget -O /tmp/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/1a880fdb9b88c0c98a23d7b2ed2ddb42caef6662/tools/install.sh

    # Check md5 for security
    if md5sum --status -c <(echo c4bc4d38832d7e0066a1f35d184d39ae /tmp/install.sh); then
      sh /tmp/install.sh --unattended --keep-zshrc && echo "Completed." || echo "Failed."
    else
      echo "Failed - Oh my zsh hash did not match."
    fi
  else
    echo "Skipped"
  fi

}

setup_zsh_profile() {
  echo "Symlink zshrc"
  ln -sf ~/zsh/.zshrc ~/.zshrc
  echo "Set sh env to zsh"
  sudo chsh `whoami` -s `which zsh`
}


setup_zsh
setup_ohmyzsh
setup_zsh_profile
