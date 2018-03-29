#!/bin/sh

echo "Generating host keys"
ssh-keygen -A


# Check that the ssh key variable is set
if [ -z "$SSH_KEY" ]; then
    echo "Missing SSH_KEY Variable"
    exit 1
fi;

# Add the ssh key into the authorized_keys file
echo "Adding $SSH_KEY ..."
mkdir -p "/root/.ssh/"
chmod 700 /root/.ssh
echo "$SSH_KEY" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# and start the ssh daemon
exec /usr/sbin/sshd -D -e "$@"