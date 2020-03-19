#!/bin/bash

# Jede node
mkfs.xfs -f -i size=512 /dev/sda3
echo "/dev/sda3 /export/sda3 xfs defaults 0 0"  >> /etc/fstab
mkdir -p /export/sda3 && mount -a && mkdir -p /export/sda3/brick

# Master Node
gluster volume create gv0 replica 4 k8sm1.home:/export/sda3/brick k8sn1.home:/export/sda3/brick k8sn2.home:/export/sda3/brick k8sn3.home:/export/sda3/brick 

gluster volume start gv0

# jede node:
mount -t glusterfs 127.0.0.1:/gv0 /mnt
echo "127.0.0.1:/gv0 /data glusterfs defaults,_netdev 0 0" >> /etc/fstab


exit 0
