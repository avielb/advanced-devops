kubectl get nodes
kubectl describe node docker-desktop
kubectl run example-pod --image=nginx:alpine --restart=Never
kubectl describe pod example-pod
kubectl create deployment example-deployment --image=nginx:alpine --replicas=3
kubectl describe deployment example-deployment
kubectl scale deployment example-deployment --replicas=10
kubectl set image deployment example-deployment  nginx=redis:alpine
kubectl expose deployment example-deployment --port=80 --type=ClusterIP
kubectl set image deployment/example-deployment nginx=nginx:alpine
kubectl describe service example-deployment
kubectl delete service example-deployment
kubectl expose deployment example-deployment --port=80 --type=LoadBalancer
