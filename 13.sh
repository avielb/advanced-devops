kubectl get nodes
kubectl describe node docker-desktop
kubectl run example-pod --image=nginx:alpine --restart=Never
kubectl describe pod example-pod
kubectl create deployment example-deployment --image=nginx:alpine --replicas=3
kubectl describe deployment example-deployment
kubectl scale deployment example-deployment --replicas=10
