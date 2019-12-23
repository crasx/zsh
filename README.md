Matthew Ramir's (crasx) dotfiles based off of zsh. This was originally a custom bash setup based off of learnings from u/josephdpurcell and u/yesct. Convered to zsh for standardization.

## Use case
- On OSX I use [iterm2](https://iterm2.com/)
- On WIN I use [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- I do a lot of Drupal development
- I currently use nano over vim
- I have difficulty typing, so many decisions are made around what is easier for me instead of what is faster.
- Using a mouse is more difficult for me than typing, so I prefer to touch the mouse as little as possible.


## Setup
```
cd ~ && git clone git@github.com:crasx/zsh.git
ln -s zsh/.zshrc 
git clone git@github.com:[your user]/zsh_private.git zsh/plugins/zsh_private
```

- Install [oh my zsh](https://ohmyz.sh/) and set zsh as default shell.

### WSL Setup
- Install microsoft terminal following instructions from https://github.com/microsoft/terminal
- Launch Terminal, edit settings 
- Copy setting from consoleconfig/WindowsTerminal.json into settings file

#### Custom windows setup
- Homedir located at e:/crasx
- Update /etc/passwd to use /mnt/e/crasx as homedirectory
- [Remount e with metadata flag](https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/)
```
 cd /
 sudo umount /mnt/e
 sudo mount -t drvfs E: /mnt/e -o metadata
```

- Fix owner
```
sudo chown crasx:crasx ~/. -R
```
- [Reset directory permissions](https://unix.stackexchange.com/questions/249845/reset-permissions-back-to-default)

```
 cd ~
 sudo chown crasx:crasx . -R
 umask 027 # Make sure umask is set (optional, mine defaulted to 000)
 # I am assuming a umask of 027 here.
 find . -type d -exec chmod 750 {} \;
 chmod 700 .ssh
 chmod 600 .ssh/*
```

## Project goals
- Migrate away from custom bashrc to a common supported platform. Allows for quicker setup time and community maintained platform. 
- Move my configuration to git for tracking and reusability.
- Marginally make my life easier, every bit helps.

## Plugin reasoning
- cp copydir git history - basic improvements
- sublime - feature I can use, lightweight
- autojump - Uses a binary to jump around instead of bash logic.

## Other reasoning
- Not everything needs an alias. I would rather tab-complete `drush-vagrant-alias` than remember `dva`
- [umask 027](https://blogs.gentoo.org/mgorny/2011/10/18/027-umask-a-compromise-between-security-and-simplicity/)
  - I like the idea of security by default, and this makes it extremely easy to give people permissions. For example if I want to give `mary` access to `~/secret/a` but not `~/secret/b` I can add the group `mary` to `~/secret/a`. If a user needs write, I can `g+x` that directory.
  - Unknowns - What would the permissions for `~/secret` need to be? Can I use an ACL?
  

## Private files
I have a few aliases for sshing to servers that I want to keep private. To accomplish this I add a secondary custom plugin directory.

### TODO:
- Clean git aliases
- Setup script
- Drush aliases.
- Make fixdrupalperms generic