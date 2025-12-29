#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose
sudo apt install gnupg2 pass -y
systemctl enable docker
systemctl start docker
sudo usermod -aG docker ubuntu
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
runuser -l  ubuntu -c 'minikube start'
echo 'alias kubectl="minikube kubectl --"' >> ~ubuntu/.bashrc
runuser -l  ubuntu -c 'minikube kubectl -- get pods'

