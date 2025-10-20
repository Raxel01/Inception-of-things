#!/bin/bash

curl -sfL https://get.k3s.io | sh -

cd /vagrant

sudo bash -c 'echo "192.168.56.110 app1.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.56.110 app2.com" >> /etc/hosts'
sudo apt install net-tools -y

kubectl apply -f confs/deployment.yaml
kubectl apply -f confs/service.yaml
kubectl apply -f confs/Ingress.yaml


echo "===========> K3s Server  is  UP  < "
echo "===========> End Server Provision "