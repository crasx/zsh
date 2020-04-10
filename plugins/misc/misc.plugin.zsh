#!/bin/bash

setup(){
  git config --global push.default current
  git config --global alias.co checkout
  git config --global core.autocrlf input
  brew install autojump
}
