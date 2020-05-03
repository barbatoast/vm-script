#!/bin/sh

sshpass -p 'root' ssh -t root@192.168.2.102 'systemctl poweroff'
sshpass -p 'root' ssh -t root@192.168.2.103 'systemctl poweroff'
sshpass -p 'root' ssh -t root@192.168.2.254 'systemctl poweroff'
