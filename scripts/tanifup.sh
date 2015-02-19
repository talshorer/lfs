#! /bin/bash

# keep this script in sync with the guest's /etc/init.d/S01confnet

NETIFACE=$1

ifconfig $NETIFACE $VLAN.1
ifconfig $NETIFACE netmask 255.255.255.0
ifconfig $NETIFACE broadcast $VLAN.255
ifconfig $NETIFACE up
