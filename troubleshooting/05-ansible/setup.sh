#!/bin/bash
docker rm -f ansible_node1  ansible_node2 ansible_server
docker build -t eg_sshd .
docker run -d -P --name ansible_server eg_sshd
docker run -d -P --name ansible_node1 eg_sshd
docker run -d -P --name ansible_node2 eg_sshd
#IP_ADDR=`ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'`
SERVER_PORT=`docker port ansible_server 22 | awk -F ':' '{print $2}'`
NODE1=`docker port ansible_node1 22 | awk -F ':' '{print $2}'`
NODE2=`docker port ansible_node2 22 | awk -F ':' '{print $2}'`
#ssh root@$IP_ADDR -p $SERVER_PORT " apt-get update && apt-get install ansible vim -y "
docker exec -it ansible_server " apt-get update && apt-get install ip ansible vim -y "
> hosts
echo '[servers]'  >> hosts
echo "node1 ansible_host=$IP_ADDR ansible_port=$NODE1" >> hosts
echo "node2 ansible_host=$IP_ADDR ansible_port=$NODE2" >> hosts
docker cp hosts ansible_server:/etc/ansible/hosts
FolderLocation=`pwd`
echo $FolderLocation
docker cp $FolderLocation  ansible_server:/root/
> Instances
echo "----------------------------" >> Instances
echo -e "- Ansible Port is $SERVER_PORT \n- Node 1 Port is $NODE1\n- Node 2 Port is $NODE2" >> Instances
echo "----------------------------" >> Instances
cat Instances
echo "ssh root@$IP_ADDR -p $SERVER_PORT"

