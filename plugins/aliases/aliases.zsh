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

alias dr='drush'