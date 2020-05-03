#!/bin/sh

set -x

# create the tap devices
tunctl -u user -t ktap1
tunctl -u user -t ktap2
tunctl -u user -t ktap3

# bring up the tap devices
ip link set ktap1 up
ip link set ktap2 up
ip link set ktap3 up

# create the bridge and link the tap devices
brctl addbr kbr0
brctl addif kbr0 ktap1
brctl addif kbr0 ktap2
brctl addif kbr0 ktap3

# addign an IP address to the bridge
ifconfig kbr0 192.168.2.1 netmask 255.255.255.0 broadcast 192.168.2.255

# bring up the bridge
ip link set kbr0 up
