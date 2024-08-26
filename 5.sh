git clone https://github.com/avielb/ansible-demo
cd ansible-demo
docker compose up -d
docker exec -it ansible-demo-ansible-1 bash
ssh-copy-id node1
ssh-copy-id node2
screencast


ansible servers -m ping -i hosts

