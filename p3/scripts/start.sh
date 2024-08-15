k3d cluster delete --all

# Start Docker daemon (Docker Desktop on Mac typically starts automatically)
echo "Checking if Docker is running..."
while ! docker info > /dev/null 2>&1; do
    echo "Docker is not running. Please start Docker Desktop."
    sleep 5
done
echo "Docker is running!"

# Create k3d cluster
k3d cluster create inception --port "8888:30000" --port "8080:30001"

# Create Namespaces
kubectl create namespace argocd
kubectl create namespace dev
# kubectl config view --raw > ~/.kube/config

# Install argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Change the argocd-server service type to LoadBalancer so we can access it
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"port": 443, "targetPort": 8080, "nodePort": 30001}]}}'
kubectl -n argocd rollout status deployment argocd-server

kubectl apply -f ../app/argocd-application.yaml

# Print argocd admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -D; echo
