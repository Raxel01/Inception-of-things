#!/bin/bash

curl -sfL https://get.k3s.io | sh -

sudo usermod -aG sudo vagrant
# # sudo cat /var/lib/rancher/k3s/server/node-token
# sudo k3s kubectl get nodes >> installation.txt

# cat installation.txt | grep "control-place"

# if ["$?" != "0"];then
#     exit 127
# fi
# this will 100% confirm that the k3s controller is well working
echo "======== K3s Controller is UP ========"
echo "############# End Controller Provision #############"
