kubectl get pods 
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl run redis --image=redis:5.0.4-alpine
kubectl logs redis
