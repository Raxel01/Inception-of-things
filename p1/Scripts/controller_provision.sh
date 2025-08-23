#!/bin/bash

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable-agent --write-kubeconfig-mode=644 --tls-san $1" sh -

sudo usermod -aG sudo vagrant

echo "===========> K3s Controller  is  UP  < "
echo "===========> End Controller Provision <"
