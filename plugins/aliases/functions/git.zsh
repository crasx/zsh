#!/bin/zsh

##
deletemergedbranches() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

# Git push origin
gpo() {
  branch=$(git branch | awk '/^\* / { print $2 }')
  git push --set-upstream origin $branch
}

# Delete untracked files and directories
gcfd() {
  git clean -fd
}

# Reset tracked files to HEAD
grhh() {
  git reset --hard HEAD
}

# Reset all git changes
gcr() {
  gcfd
  grhh
}

# Git status
gs() {
  git status
}

# Git diff
gd() {
  git diff
}

# Git diff of staged files
gds() {
  git diff --staged
}

# Add files to git.
ga() {
  git add "$@"
}

# Git log but pretty
gl() {
  if ! [ -z $1 ]; then
    git log --pretty=$1
  else
    git log --pretty=oneline
  fi
}
