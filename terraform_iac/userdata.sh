#!/bin/bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa  -N "" -q
touch ~/.ssh/authorized_keys
chmod 400 ~/.ssh/authorized_keys

cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOsRS7dyOWU2PES4lvtKf//KPxI2qnD1cwBkivA65gT1XQPqKSs0psaWXfFgen+M4vqNSjjGFpFOhryHS4KdRYJ71sjEMpWBfKWM6H53l4lqTEOGIQwdgja7S6TZa3SFJfZ0ONcYgPbcZ8DPP5ptCrnA8+P+tuLrzUUly44anPNTxbaHUfNUd158TbeJGGSXqh07apKvP+BT+1fVdIq1J6lKGWg3VwoyRXO9vEaEI78r9l9iWVKvJm/0D2vZ5zE1cEf2wHnm7cq1XZYo13ab0deEJJJgINGsBZ+FQTCYG4MpCIFTtXRGBVJcii0sLwsQoUYDnl/p4YnV4DSucMlE0L root@ip-172-31-23-143.ec2.internal
EOF

