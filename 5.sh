docker run --name master -d ubuntu sleep 1000000
docker exec -it master bash
apt update && apt install python3-pip vim git -y
rm -rf /usr/lib/python3.12/EXTERNALLY-MANAGED
pip install ansible

# for mac run
docker rm -vf node1 
docker run --name node1 -d avielb/ansible-demo:arm64 
docker rm -vf node2
docker run --name node2 -d avielb/ansible-demo:arm64 

# for windows run
docker rm -vf node1 
docker run --name node1 -d avielb/ansible-demo:amd64 
docker rm -vf node2
docker run --name node2 -d avielb/ansible-demo:amd64 
ssh-copy-id node1
ssh-copy-id node2
screencast

git clone https://github.com/avielb/ansible-demo
cd ansible-demo
docker compose up -d

docker exec -it ansible-demo-ansible-1 bash
