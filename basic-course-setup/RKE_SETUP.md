# RKE on EC2 
1. Setup an EC2 `t2.medium` 
2. Connect as root and install docker and configure it as follows:
```sh
yum install -y docker 
systemctl enable docker 
systemctl start docker 
usermod -aG docker ec2-user 
```

3. Enable all traffic for the EC2 instance
4. sed -ie 's/IP_ADDRESS/'${EC2_IP_ADDRESS}'/' cluster.yml
5. rke up 
6. export KUBECONFIG=$(pwd)/kube_config_cluster.yml
