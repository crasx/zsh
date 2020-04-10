#!/bin/zsh

if [ `command -v wsl.exe` ]; then
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
  export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
  export DOCKER_HOST=unix:///var/run/docker.sock
fi