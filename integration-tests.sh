#!/bin/sh

if [ $(/usr/bin/id -u) -ne 0 ]; then
    echo "Not running as root"
    exit
fi

sudo -u user echo 'Spinning up infastructure'

./ifup.sh

sudo -u user echo 'Dispatching VMs'

sudo -u user ./startup-vms.sh

sudo -u user sleep 15

sudo -u user echo 'VMs ready, running integration tests'

sudo -u user ./kill-vms.sh

sudo -u user echo 'All integration tests passed'

sleep 2

sudo -u user echo 'Tearing down infastructure'

./ifdown.sh
