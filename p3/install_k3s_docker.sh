sudo apt install -y vim
sudo apt install -y docker
sudo apt install -y curl

sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644" sh -

sleep 10

kubectl get nodes
