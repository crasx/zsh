# About

## Theme
Shout out to zsh geometry for a beautiful zsh theme.

https://github.com/geometry-zsh/geometry

# Setup
- Install [oh my zsh](https://ohmyz.sh/) and set zsh as default shell.
- Clone the repository to ~/zsh
```
cd ~ && git clone git@github.com:crasx/zsh.git --recurse-submodules
# Or https
cd ~ && git clone https://github.com/crasx/zsh.git --recurse-submodules
```
- Symlink zsh RC
```
ln -s zsh/.zshrc 
```
- Add your customizations on top
```
git clone git@github.com:[your user]/zsh_private.git zsh/plugins/zsh_private
```

# Drush Aliases
* `dc` for `docker compose`
* `dr` for `drush`
* `composer1` for `composer self-update --1`
* `composer2` for `composer self-update --2`
* `c` for `composer`

# System Aliases
* `h` for `history`
* `ll` for `ls -altr`
* `rezsh` for `source ~/.zshrc`


# Git Aliases
The first few aliases define shortcuts for the following git commands:

-   `gs`  for  `git status`
-   `gd`  for  `git diff`
-   `gds`  for  `git diff --staged`
-   `ga`  for  `git add`
-   `gl`  for  `git log --oneline --graph`

The `gitsetup` function sets some git config defaults, such as the default branch to use when creating a new repository, the default push behavior, and the alias for the `checkout` command.

The `deletemergedbranches` function deletes any branches that have been merged into the current branch. This can be useful for cleaning up old branches that are no longer needed.

The `deletesandboxbranches` and `deletesandboxbranchesforced` functions delete any branches that start with the word "sandbox". The `deletesandboxbranchesforced` function is more destructive, as it does not prompt for confirmation before deleting the branches.

The `gpo` function pushes the current branch to the remote origin repository. This is useful for keeping your local changes synchronized with the remote repository.

The `gcfd` function deletes all untracked files and directories from the current working directory. This can be useful for cleaning up your working directory before committing changes.

The `grhh` function resets all tracked files in the current working directory to the HEAD commit. This is useful for undoing changes that you have made to your local repository.

The `gcr` function combines the `gcfd` and `grhh` functions to reset all git changes in the current working directory. This is a quick way to undo any changes that you have made to your local repository.