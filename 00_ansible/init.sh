#!/bin/bash

# Create Ansible SSH key
[ ! -d keys ] && mkdir keys
[ ! -f keys/id_rsa ] && ssh-keygen -f keys/id_rsa -t rsa -N '' -C 'ansible-provision'

exit 0
