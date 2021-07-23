#!/bin/bash

source /home/ide/zsh/plugins/aliases/functions/git.zsh


  git config --global push.default current
  git config --global alias.co checkout
  git config --global core.autocrlf input
  git config --global pager.branch cat
  git config --global alias.amend 'commit --amend --no-edit'
