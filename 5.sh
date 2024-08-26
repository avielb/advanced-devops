docker run --name master -d ubuntu sleep 1000000
docker exec -it master bash
apt update && apt install python3-pip vim git -y
rm -rf /usr/lib/python3.12/EXTERNALLY-MANAGED
pip install ansible

# for mac run
docker run --name node1 -d avielb/ansible-demo:arm64 
docker run --name node2 -d avielb/ansible-demo:arm64 

# for windows run
docker run --name node1 -d avielb/ansible-demo:amd64 
docker run --name node2 -d avielb/ansible-demo:amd64 
