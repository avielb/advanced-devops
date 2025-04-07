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
helm list
helm uninstall myrelease
# in a new file called `values-prod.yaml` write
replicaCount: 5


helm upgrade -i myrelease -f values-prod.yaml ./
helm package ./mychart
helm registry login registry-1.docker.io -u avielb
https://app.docker.com/settings/personal-access-tokens
