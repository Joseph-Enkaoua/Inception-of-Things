sudo apt install -y vim
sudo apt install -y docker
sudo apt install -y curl

sudo curl -sfL https://get.k3s.io | sh -

sleep 10

kubectl get nodes
