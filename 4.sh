kubectl get storageclass
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pvc.yaml
kubectl get pvc
kubectl get pv
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd /usr/share/nginx/html/
echo hello from experts > index.html
kubectl port-forward svc/svc-to-pvc 9090:80
kubectl delete -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pod-with-pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/config-map.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/game-config.yaml
