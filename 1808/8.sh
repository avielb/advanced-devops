# test
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get all -n argocd

kubectl get applications -A
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" -n argocd| base64 -d; echo
[System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}')))
kubectl port-forward svc/argocd-server -n argocd 8080:443

create new repo called: 1808-argocd
https://github.com/new
add this: 
https://github.com/avielb/advanced-devops/blob/master/gitops/argocd/new/deployment.yaml
https://github.com/avielb/advanced-devops/blob/master/gitops/argocd/new/svc.yaml

https://github.com/avielb/advanced-devops.git
./gitops/argocd/mychart


apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myrelease
spec:
  project: default
  source:
    repoURL: https://github.com/avielb/advanced-devops.git
    path: gitops/argocd/mychart
    targetRevision: HEAD
    helm:
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true



https://github.com/avielb/1808-argocd/tree/main

https://app.docker.com/settings/personal-access-tokens/create - Read, Write, Delete





apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: 'myrelease'
spec:
  project: default
  source:
    repoURL: https://github.com/avielb/1808-argocd.git
    path: mychart
    targetRevision: HEAD
    helm:
      valueFiles:
        - values.yaml
        - values-image.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true

https://github.com/avielb/1808-first-repo/blob/main/.github/workflows/06.yaml
