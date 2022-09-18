#!/bin/zsh


alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gl="git log --oneline --graph"

# Set git config defaults
gitsetup(){
  git config --global push.default current
  git config --global alias.co checkout
  git config --global core.autocrlf input
  git config --global pager.branch cat
  git config --global alias.amend 'commit --amend --no-edit'

}

## DESTRUCTIVE - deletes branches thay have been merged into the current one
deletemergedbranches() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

deletesandboxbranches() {
 git branch | grep sandbox | xargs git branch -d
}
deletesandboxbranchesforced() {
 git branch | grep sandbox | xargs git branch -D
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
