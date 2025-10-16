# #!/bin/bash

CONTROLLER_IP=$1

K3S_TOKEN=$(cat /vagrant/token_file 2>/dev/null) || K3S_TOKEN=''

K3S_URL="https://${CONTROLLER_IP}:6443"

sudo apt install net-tools

curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -

echo "========= K3s Agent joined the cluster ========"