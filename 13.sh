kubectl get nodes
kubectl describe node docker-desktop
kubectl run example-pod --image=nginx:alpine --restart=Never
kubectl describe pod example-pod
kubectl create deployment example-deployment --image=nginx:alpine --replicas=3
