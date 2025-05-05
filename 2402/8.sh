# test
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get all -n argocd

kubectl get applications -A
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" -n argocd| base64 -d; echo
kubectl port-forward svc/argocd-server -n argocd 8080:443
