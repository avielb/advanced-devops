kubectl get pods
kubectl describe node docker-desktop
kubectl run nginx --image=nginx:1.15.12-alpine
kubectl describe pod nginx
kubectl create deployment hello-node --image=nginx:alpine --replicas=5
kubectl delete pod nginx
kubectl scale deployment hello-node --replicas=20
kubectl set image deploy/hello-node nginx=nginx:latest
kubectl describe deployment hello-node
kubectl expose deploy/hello-node --type ClusterIP --port 80
kubectl describe service hello-node
kubectl scale deployment hello-node --replicas=2
kubectl delete service hello-node
kubectl delete service hello-node
kubectl delete deployment hello-node
kubectl expose deploy/hello-node --type NodePort --port 80
https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
kubectl expose deploy/hello-node --type LoadBalancer --port 80
kubectl delete pod nginx
kubectl apply -f https://raw.githubusercontent.com/avielb/k8s-demo/refs/heads/master/pod-with-service.yaml
----------
apiVersion: v1
kind: Service
metadata:
  name: fe-gate
spec:
  selector:
    name: nginx
  type: NodePort
  ports:
  - name: foo # Actually, no port is needed.
    port: 80
    targetPort: 80
  - name: bar # Actually, no port is needed.
    port: 8081
    targetPort: 8081
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    name: nginx
spec:
  #hostname: frontend001
  containers:
  - image: nginx
    name: nginx-container
---
apiVersion: v1
kind: Pod
metadata:
  name: debian
  labels:
    name: debian
spec:
  containers:
  - image: debian
    name: debian-container
    command:
      - sleep
      - "3600"
-------


https://github.com/avielb/k8s-demo/tree/master/guestbook
