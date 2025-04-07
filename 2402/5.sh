# test
new pycharm project called DevOps2402 
right click on the project and "Open In" , "Terminal"
in the terminal:
kubectl get pods 
helm list
helm create mychart
cd mychart
helm template mychart ./
helm upgrade -i myrelease ./
# change replicaCount to 3
helm upgrade -i myrelease ./
