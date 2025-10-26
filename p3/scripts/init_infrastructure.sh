#!/bin/bash

sudo k3d cluster create part-three-cluster -p "30443:30443@server:0"

cd /vagrant

sudo kubectl create -f confs/namespaces.yaml

sudo kubectl apply  -f confs/go-app-deployment.yaml -n dev

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 

sudo kubectl apply -f confs/argocdNodeportService.yaml -n argocd

sudo kubectl apply -f confs/argocd-config.yaml 
