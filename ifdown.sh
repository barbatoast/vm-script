#!/bin/sh

set -x

# bring down the bridge
ifconfig kbr0 down

# delete the bridge
brctl delbr kbr0

# delete the tap devices
tunctl -d ktap1
tunctl -d ktap2
tunctl -d ktap3
