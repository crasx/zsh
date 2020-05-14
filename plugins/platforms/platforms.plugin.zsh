#!/bin/zsh


case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  for f in $ZSH_CUSTOM/plugins/platforms/osx/*.zsh; do source $f; done ;;
  linux*)   for f in $ZSH_CUSTOM/plugins/linux/*.zsh; do source $f; done ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac