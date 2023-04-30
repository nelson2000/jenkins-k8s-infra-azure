Non-HA:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.7/manifests/install.yaml
HA:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.7/manifests/ha/install.yaml

wget https://github.com/argoproj/argo-cd/releases/download/v2.6.7/argocd-linux-amd64
sudo mv argocd-linux-amd64 argo
sudo cp argo /usr/local/bin

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# port forward
kubectl port-forward svc/argocd-server -n argocd 8080:443

argocd admin initial-password -n argocd

# application example

git clone https://github.com/argoproj/argocd-example-apps.git