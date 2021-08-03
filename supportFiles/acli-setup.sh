#!/bin/bash
## Setuo script for acquia cloud ide

rm -f ~/.theia/keymap.json
ln -s ~/zsh/consoleConfig/theia-keymap.json ~/.theia/keymap.json

rm -f ~/.bash_aliases
ln -s ~/zsh/.bash_aliases ~/.bash_aliases

