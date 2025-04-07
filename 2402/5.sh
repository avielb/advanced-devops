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
# to create a token:
https://app.docker.com/settings/personal-access-tokens
helm push mychart-0.1.0.tgz oci://registry-1.docker.io/avielb


in Chart.yaml, edit from:
version: 0.1.0
to 
version: 0.2.0

helm upgrade -i adamapp oci://registry-1.docker.io/adamlor/mychart --set replicaCount=1

helm fetch --untar  oci://registry-1.docker.io/adamlor/mychart
helm history adamapp
helm rollback adamapp
helm rollback adamapp 2
helm get values adamapp --all
helm get manifest adamapp
helm plugin install https://github.com/databus23/helm-diff

https://artifacthub.io/


helm uninstall adamapp my-release
Chart.yaml 
###########################################
apiVersion: v2
appVersion: 1.16.0
description: A Helm chart for Kubernetes
name: mychart
type: application
version: 0.2.0
dependencies:
  - name: redis
    version: 20.11.4
    repository: oci://registry-1.docker.io/bitnamicharts
