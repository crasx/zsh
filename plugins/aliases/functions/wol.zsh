#!/bin/zsh

# Function to wake a device using a MAC address
wake_device() {
    # Check if a valid MAC address is provided as an argument
    if [ $# -ne 1 ]; then
        echo "Usage: wake_device <MAC_ADDRESS>"
        return 1
    fi

    MAC_ADDRESS=$(echo $1 | tr '[:upper:]' '[:lower:]')  # Convert to lowercase
    BINARY_MAC=$(echo $MAC_ADDRESS | sed 's/://g' | sed 's/\(..\)/\\x\1/g')

    # Create the magic packet
    MAGIC_PACKET=$(printf '\xff%.0s' {1..6})
    MAGIC_PACKET="$MAGIC_PACKET$BINARY_MAC"

    # Send the magic packet to the broadcast address
    echo -n -e $MAGIC_PACKET | nc -w1 -u 255.255.255.255 9
}