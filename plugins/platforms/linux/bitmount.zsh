#!/bin/bash

# Original: https://pastebin.com/jbb6X84v
# Helper for mounting a bitlocked drive using password OR key file. 
function bitmount(){


  if ! type zenity > /dev/null; then
    echo "Please install 'Zenity'";
    return 0;
  fi


  if ! type dislocker > /dev/null; then
    zenity --error --tittle="Dislocker Not Found" --text="Dislocker has not been found on your system. Please install, and retry."
    return 0;
  fi


  DFILE_LOCATION="/tmp/DFILE"
  DRIVE_MOUNTPOINT="/mnt/UnlockedDrive"
  DEFAULT_BEK=""

  lockedDrive=$(find /dev -mindepth 1 -maxdepth 1  -name "*[sh]d[a-z][0-9]"  | sort | awk '{ printf "FALSE""\0"$0"\0" }' | \
  xargs -0 zenity --list --title="Root Partition" --text="Select the locked partition to unlock." \
  --radiolist --multiple --column ' ' --column 'Partitions')

  if [ -z $lockedDrive ]; then
    return 0
  fi

  echo $lockedDrive
  #Check if exists, otherwise create a folder to mount dislocker-image

  sudo mkdir -p $DFILE_LOCATION
  sudo mkdir -p $DRIVE_MOUNTPOINT

  unlockType=$(zenity --list --title="Unlock type" --text="How do you want to unlock your drive?" --column '' password file )
  echo $unlockType

  if [ "$unlockType" = "password" ]; then
    lockedDrivePSW=$(zenity --password --title="Locked Drive" --text="Please type Locked Drive Password")
    sudo  dislocker -v -V $lockedDrive  -u$lockedDrivePSW -- $DFILE_LOCATION
  else
    lockedDriveKey=$(zenity --file-selection --title="Locked Drive" --text="Select BEK file")
    echo $lockedDriveKey
    sudo  dislocker -v -V $lockedDrive  -f$lockedDriveKey -- $DFILE_LOCATION

  fi

  if [ -f "$DFILE_LOCATION"/dislocker-file ]; then
    sudo mount -o loop $DFILE_LOCATION/dislocker-file $DRIVE_MOUNTPOINT
fi
}