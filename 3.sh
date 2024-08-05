kubectl get pods 
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl run redis --image=redis:5.0.4-alpine
kubectl logs redis
kubectl create deployment hello-node --image=nginx:alpine --replicas=5
kubectl scale deploy/hello-node --replicas=10
kubectl set image deploy/hello-node nginx=nginx:16-alpine
kubectl rollout undo deployment/hello-node --to-revision=1
kubectl set image deploy/hello-node nginx=nginx:1.16-alpine
kubectl expose deploy/hello-node --type ClusterIP --port 80
kubectl scale deploy/hello-node --replicas=1
kubectl get pods -l app=hello-node
kubectl describe svc hello-node
kubectl delete svc hello-node
kubectl expose deploy/hello-node --type NodePort --port 80
