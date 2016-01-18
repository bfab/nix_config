#!/bin/bash

set -e

[ $1 ] || { echo "Needs as first argument the email address to generate keys for." ; exit 1; }

EMAIL=$1

read -p "Going to generate new encrypted rsa key for $EMAIL and move the existing ~/.ssh folder; press enter to continue..."

SSH_BACKUP=".ssh_old_as_of_`date +%s`"

mv ~/.ssh ~/"$SSH_BACKUP"

ssh-keygen -t rsa -b 4096 -C "$EMAIL"

PUBLIC_KEY=~/.ssh/id_rsa.pub
echo "The previous ~/.ssh folder has been moved to $SSH_BACKUP ; you may want to copy over some files from it."
echo "The new public key is below (and in $PUBLIC_KEY ); copy it wherever you need to."
echo
cat $PUBLIC_KEY