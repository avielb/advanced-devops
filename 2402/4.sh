kubectl get pods 
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pv.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pvc.yaml
kubectl describe persistentvolumeclaim/task-pv-claim
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd usr/share/nginx/html/
echo 1 > index.html
exit
kubectl debug node/docker-desktop -it --image=busybox -- sh
kubectl delete -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
