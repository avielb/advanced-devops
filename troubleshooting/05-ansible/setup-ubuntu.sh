#!/bin/bash
docker rm -f ansible_node1  ansible_node2
#docker build -t aviel/ansible-demo .
docker run -d -P --name ansible_node1 avielb/ansible-demo
docker run -d -P --name ansible_node2 avielb/ansible-demo
IP_ADDR=localhost
NODE1=`docker port ansible_node1 22 | awk -F ':' '{print $2}'`
NODE2=`docker port ansible_node2 22 | awk -F ':' '{print $2}'`
apt-get update && apt-get install ansible vim -y
> hosts
echo '[servers]'  >> hosts
echo "node1 ansible_host=$IP_ADDR ansible_port=$NODE1" >> hosts
echo "node2 ansible_host=$IP_ADDR ansible_port=$NODE2" >> hosts
cp hosts /etc/ansible/hosts
FolderLocation=`pwd`
echo $FolderLocation
> Instances
echo "----------------------------" >> Instances
echo -e "- Ansible Port is $SERVER_PORT \n- Node 1 Port is $NODE1\n- Node 2 Port is $NODE2" >> Instances
echo "----------------------------" >> Instances
cat Instances
