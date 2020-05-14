#!/bin/bash

setup(){
  git config --global push.default current
  git config --global alias.co checkout
  git config --global core.autocrlf input
  git config --global alias.amend 'commit --amend --no-edit'
  brew install autojump
}
