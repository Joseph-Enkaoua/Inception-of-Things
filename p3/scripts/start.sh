# Start docker demon
sudo service docker start (if systemctl doesnt work)

echo "Waiting for Docker to start..."

while ! docker info > /dev/null 2>&1; do
    echo -n "."
    sleep 1
done

echo "Docker is running!"

# Create k3d cluster
sudo k3d cluster create inception -p 8080:80@loadbalancer -p 8443:443@loadbalancer -p 8888:8888@loadbalancer

# Installing argocd
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo kubectl get inception > ~/.kube/config

# Install argocd CRDS
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Expose argocd API server
# sudo kubectl port-forward svc/argocd-server -n argocd 8080:443
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
sudo kubectl -n argocd rollout status deployment argocd-server

# Print argocd admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

