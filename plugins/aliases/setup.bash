#!/bin/bash

setup(){
  git config --global push.default current
  brew install autojump
  zplug install  zplug install "geometry-zsh/geometry"
}
