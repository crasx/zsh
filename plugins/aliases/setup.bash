#!/bin/bash

setup(){
  git config --global push.default current
  git config --global alias.co checkout
  brew install autojump
}
