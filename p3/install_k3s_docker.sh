#! /usr/bin/bash

# Update system packages
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce

# Verify Docker installation
sudo systemctl status docker
sudo docker run hello-world

# Install k3s
curl -sfL https://get.k3s.io | sh -

# Check k3s status
sudo systemctl status k3s

# Verify k3s installation
kubectl get nodes
