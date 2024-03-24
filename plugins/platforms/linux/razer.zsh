#!/bin/zsh
# Description: Razer mouse settings
# Check for xinput
if command -v xinput &> /dev/null; then
  if [[ $(xinput list | grep "Razer Razer DeathAdder") ]]; then
    xinput --set-prop "Razer Razer DeathAdder" "libinput Accel Speed" -0.75
    xinput --set-prop "Razer Razer DeathAdder" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    xinput --set-prop "Razer Razer DeathAdder" "libinput Accel Profile Enabled" 0, 1
  fi
fi
