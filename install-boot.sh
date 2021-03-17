#!/bin/sh

# configure huge mem
cp 80-vpp.conf /etc/sysctl.d/

# insmod vfio-pci when boot
echo vfio-pci >> /etc/modules

# set parameter
