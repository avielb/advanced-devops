git clone https://github.com/avielb/ansible-demo.git
cd ansible-demo
docker compose up -d
docker exec -it ansible-demo-ansible-1 bash
ssh-keygen
ansible -i hosts servers -m ping
mkdir -p /etc/ansible
cp hosts /etc/ansible/hosts
