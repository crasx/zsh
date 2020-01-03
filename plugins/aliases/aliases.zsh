#!/bin/bash

deletemergedbranches(){
	git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

gcfd(){
	git clean -fd
}

grhh(){
	git reset --hard HEAD
}


gcr(){
	gcfd
	grhh
}

gits(){
	git status
}

gs(){
	git status
}

gl(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  else
    git log --pretty=oneline
  fi
}
alias dr='drush'