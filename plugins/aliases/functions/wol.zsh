#!/bin/zsh

# Function to wake a device using a MAC address
wake_device() {
    # Check if a valid MAC address is provided as an argument
    if [ $# -ne 1 ]; then
        echo "Usage: wake_device <MAC_ADDRESS>"
        return 1
    fi

    # https://stackoverflow.com/questions/31588035/bash-one-line-command-to-send-wake-on-lan-magic-packet-without-specific-tool
    MAC_ADDRESS=$(echo $1 | tr '[:upper:]' '[:lower:]')  # Convert to lowercase
    Broadcast=255.255.255.255
    PortNumber=4000
    echo $MAC_ADDRESS
    echo -e $(echo $(printf 'f%.0s' {1..12}; printf "$(echo $MAC_ADDRESS | sed 's/://g')%.0s" {1..16}) | sed -e 's/../\\x&/g') | nc -w1 -u -b $Broadcast $PortNumber
}
