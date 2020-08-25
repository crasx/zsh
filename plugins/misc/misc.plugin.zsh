#!/bin/bash

setup(){
  git config --global push.default current
  git config --global alias.co checkout
  git config --global core.autocrlf input
  git config --global pager.branch cat
  git config --global alias.amend 'commit --amend --no-edit'
  brew install autojump
}

ssh64(){
  export SSH_KEYS=`tar -czvf - --directory=$HOME .ssh/ | base64`;
  echo "Wrote to SSH_KEYS"
}
