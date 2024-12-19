kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pv.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pvc.yaml
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pod-with-pvc.yaml
kubectl exec -it task-pv-pod -- bash
cd /usr/share/nginx/html
exit
kubectl debug node/docker-desktop -it --image=ubuntu
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/config-map.yaml
git clone https://github.com/avielb/k8s-demo.git 
cd k8s-demo/volumes
kubectl create configmap game-config --from-file=configs/
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/volumes/pod-with-config-map.yaml
