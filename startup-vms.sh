#!/bin/sh

kvm -m 2G -hda vm/debian1.qcow -name “DEB1-GATEWAY” \
-netdev user,id=net0 -device e1000,netdev=net0 \
-netdev tap,id=net1,ifname=ktap1,script=no,downscript=no \
-device e1000,netdev=net1,mac=de:ad:be:ef:00:01 \
-machine ubuntu -cpu host -nographic &

sleep 2

kvm -m 2G -hda vm/debian2.qcow -name “DEB2” \
-netdev tap,id=net0,ifname=ktap2,script=no,downscript=no \
-device e1000,netdev=net0,mac=de:ad:be:ef:00:02 \
-machine ubuntu -cpu host -nographic &

sleep 2

kvm -m 2G -hda vm/debian3.qcow -name “DEB3” \
-netdev tap,id=net0,ifname=ktap3,script=no,downscript=no \
-device e1000,netdev=net0,mac=de:ad:be:ef:00:03 \
-machine ubuntu -cpu host -nographic &

sleep 2

echo 'Booting up VMs'
