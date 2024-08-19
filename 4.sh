kubectl get storageclass
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pvc.yaml
kubectl get pvc
kubectl get pv
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pod-with-pvc.yaml
