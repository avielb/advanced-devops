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
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/master/volumes/pod-with-config-map.yaml
helm install my-release oci://registry-1.docker.io/bitnamicharts/nginx
https://artifacthub.io/packages/helm/bitnami/nginx
helm upgrade -i my-release oci://registry-1.docker.io/bitnamicharts/nginx --set replicaCount=4
# Default values for mychart.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: avielb/0306-first-repo
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.


helm package ./mychart
helm template moshe ./
