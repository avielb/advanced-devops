git clone https://github.com/avielb/ansible-demo
cd ansible-demo
docker compose up -d
docker exec -it ansible-demo-ansible-1 bash
git clone https://github.com/avielb/ansible-demo
cd ansible-demo
ssh-keygen
ssh-copy-id node1
ssh-copy-id node2
# password is screencast

mkdir /etc/ansible
cp hosts /etc/ansible/hosts
ansible servers -m ping
