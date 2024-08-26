docker run --name master -d ubuntu sleep 1000000
docker exec -it master bash
apt update && apt install python3-pip vim git -y
rm -rf /usr/lib/python3.12/EXTERNALLY-MANAGED
pip install ansible
docker run --name node1 avielb/ansible-demo:arm64 
docker run --name node2 avielb/ansible-demo:arm64 
