#!/bin/bash

# User is already setup
# if getent passwd $1 > /dev/null 2>&1; then
#   echo "User already exists"
# else
#   # Create the user
#   useradd $SESSION_USER -s /bin/bash -m
#   echo "$SESSION_USER:$SESSION_PASSWORD" | chpasswd
# fi

useradd $SESSION_USER -s /bin/bash -m
echo "$SESSION_USER:$SESSION_PASSWORD" | chpasswd
# exec sleep infinity
exec /usr/sbin/sshd -D
