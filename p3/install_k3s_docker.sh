apt install -y vim
apt install -y docker
apt install -y curl

curl -sfL https://get.k3s.io | sh -

sleep 10

kubectl get nodes
