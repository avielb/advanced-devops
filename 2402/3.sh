kubectl get pods
kubectl describe node docker-desktop
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl describe pod nginx
kubectl create deployment hello-node --image=nginx:alpine --replicas=5
kubectl delete pod nginx
kubectl scale deployment hello-node --replicas=20
kubectl set image deploy/hello-node nginx=nginx:latest
kubectl describe deployment hello-node
kubectl expose deploy/hello-node --type ClusterIP --port 80
kubectl describe service hello-node
kubectl scale deployment hello-node --replicas=2
kubectl delete service hello-node
kubectl delete service hello-node
kubectl delete deployment hello-node
kubectl expose deploy/hello-node --type NodePort --port 80
https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
