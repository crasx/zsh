#!/bin/zsh

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
  git log --pretty=oneline
}
