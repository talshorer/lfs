#! /bin/bash

TARGET_IP=$1
FILE=$2
TARGET_PATH=/tmp/.run.sh

scp $FILE $TARGET_IP:$TARGET_PATH > /dev/null
ssh $TARGET_IP "chmod u+x $TARGET_PATH && $TARGET_PATH"
