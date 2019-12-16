Matthew Ramir's (crasx) dotfiles based off of zsh. This was originally a custom bash setup based off of learnings from u/josephdpurcell and u/yesct. Convered to zsh for standardization.

## Use case
- On OSX I use [iterm2](https://iterm2.com/)
- On WIN I use [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- I do a lot of Drupal development
- I currently use nano over vim
- I have difficulty typing, so many decisions are made around what is easier for me instead of what is faster.
- Using a mouse is more difficult for me than typing, so I prefer to touch the mouse as little as possible.


## Setup
- Clone repo in your home directory (repo root exists at ~/zsh)

```
ln -s zsh/.zshrc 
git clone git@github.com:[your user]/zsh_private.git plugins/zsh_private
```

- Install [oh my zsh](https://ohmyz.sh/) and set as default shell. Relogin.

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

## Private files
I have a few aliases for sshing to servers that I want to keep private. To accomplish this I add a secondary custom plugin directory.

### TODO:
- Clean git aliases
- Setup script
- Drush aliases.
- Make fixdrupalperms generic