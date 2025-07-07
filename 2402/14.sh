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

ssh node1
userdel avielb
exit
ansible-playbook demo.yml
ssh node1 "echo moshe > /var/tmp/aviel.txt"

ssh node1 cat /root/hostname.conf
ssh node2 cat /root/hostname.conf
