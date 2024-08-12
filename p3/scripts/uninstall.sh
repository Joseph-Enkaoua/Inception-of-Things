kubectl delete namespace dev
kubectl delete namespace argocd
kubectl delete crd argocds.argoproj.io

# Remove k3s
sudo /usr/local/bin/k3s-uninstall.sh

# Uninstall K3d
k3d cluster delete --all
sudo rm -f /usr/local/bin/k3d

# Stop Docker
echo "Stopping Docker..."
sudo systemctl stop docker

# Remove docker resources
echo "Cleaning up Docker resources..."
docker container prune -f
docker image prune -a -f
docker volume prune -f
docker network prune -f
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo apt-get autoremove -y

# Remove docker
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf ~/.docker

# Remove Docker's APT repository and GPG key
sudo rm /etc/apt/sources.list.d/docker.list
sudo apt-key del $(apt-key list | grep -B1 'Docker' | head -n 1 | cut -d '/' -f 2 | cut -d ' ' -f 1)
sudo apt-get update

sudo apt remove -y vim
sudo apt remove -y curl

echo "Cleanup complete!"
