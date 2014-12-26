#! /bin/bash

NETIFACE=$1

ifconfig $NETIFACE down
