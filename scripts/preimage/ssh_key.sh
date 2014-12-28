#! /bin/bash

TARGET=$1
TARGET_DIR="$TARGET/root/.ssh"
TARGET_FILE="$TARGET_DIR/authorized_keys"
SSH_KEY_FILE="/home/$USER/.ssh/id_rsa.pub"
if [[ ! -e "$SSH_KEY_FILE" ]]; then
	echo "$SSH_KEY_FILE not found"
	exit 0
fi
mkdir -p $TARGET_DIR
chmod 700 $TARGET_DIR -v
cp -fv $SSH_KEY_FILE $TARGET_FILE
chmod 600 $TARGET_DIR/* -v
