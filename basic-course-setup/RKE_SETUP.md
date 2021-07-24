# RKE on EC2 
Install RKE on your workstation as described in the following link: 

https://rancher.com/docs/rke/latest/en/installation/#download-the-rke-binary


1. Setup an EC2 `t2.medium` with Amazon Linux AMI
2. Connect as root and install docker configured it as follows:
```sh
sudo su - 
yum install -y docker 
systemctl enable docker 
systemctl start docker 
usermod -aG docker ec2-user 
```

3. Enable all traffic for inbound traffic to the EC2 instance
4. Edit `IP_ADDRESS` in `cluster.yml`
5. Run the following to deploy and connect:
```sh
rke up 
export KUBECONFIG=$(pwd)/kube_config_cluster.yml
kubectl get pods
```
