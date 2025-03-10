kubectl get pods
kubectl describe node docker-desktop
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl describe pod nginx
kubectl create deployment hello-node --image=nginx:alpine --replicas=5
kubectl delete pod nginx
kubectl scale deployment hello-node --replicas=20
kubectl set image deploy/hello-node nginx=nginx:latest
