#! /bin/bash

NETIFACE=$1

ifconfig $NETIFACE 30.0.0.1
ifconfig $NETIFACE netmask 255.255.255.0
ifconfig $NETIFACE broadcast 30.0.0.255
ifconfig $NETIFACE up