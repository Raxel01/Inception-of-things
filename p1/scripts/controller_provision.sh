#!/bin/bash 

# curl -sfL https://get.k3s.io | sh -

# sudo chmod 644  /etc/rancher/k3s/k3s.yaml

# curl -sfL https://get.k3s.io  | INSTALL_K3S_EXEC="--disable=agent" sh -

# securely connect without certificate warnings.

# -tls-san $1

# curl -sfL https://get.k3s.io  |  sh -


# # sudo k3s server 

# # sudo apt install net-tools
# # sudo systemctl status k3s


# echo "===========> K3s Controller  is  UP  < "
# echo "===========> End Controller Provision <"


sudo  apt-get update && apt-get install -y curl

curl -sfL https://get.k3s.io/ | sh -
