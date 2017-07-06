#!/bin/bash

# Add user
useradd $SESSION_USER -s /bin/bash -m && echo "$SESSION_USER:$SESSION_PASSWORD" | chpasswd && usermod -aG sudo $SESSION_USER

# Add instructions
cat > /home/$SESSION_USER/instructions.txt << EOL
Name: ScapyHunt

Description:

A series of Network Security puzzles and challenges designed to educate users on packet manipulation and common network attacks.

Instructions:

Instructions can be found here https://github.com/JamesSullivan1/scapyHunt/blob/master/HowToPlay.txt. Github here https://github.com/JamesSullivan1/scapyHunt.
EOL

# Start SSH in foreground
exec /usr/sbin/sshd -D
