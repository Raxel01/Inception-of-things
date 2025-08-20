#!/bin/bash

CONTROLLER_URL = "http://$1:6443"

# get the token from the machine of the controller
MY_K3S_TOKEN = ${curl -s $MY_K3S_URL}

# and then run this line: 
curl -sfL https://get.k3s.io | K3S_URL=$CONTROLLER_URL K3S_TOKEN=$MY_K3S_TOKEN sh -

sudo systemctl enable k3s-agent
sudo systemctl start k3s-agent

echo "========= K3s Agent joined the cluster ========"
echo "############# End Agent Provision #############"
