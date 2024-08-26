git clone https://github.com/avielb/ansible-demo
cd ansible-demo
docker compose up -d
docker exec -it ansible-demo-ansible-1 bash
ssh-keygen
ssh-copy-id node1
screencast
ssh-copy-id node2
screencast

git clone https://github.com/avielb/ansible-demo
cd ansible-demo
ansible servers -m ping -i hosts

ansible servers -m shell -a "echo hello world" -i hosts
ansible servers -m apt -a "name=nginx state=present" -i hosts
ansible-playbook vars.yml -i hosts
ansible-playbook vars.yml -i hosts --tags=tag1
ansible-playbook demo.yml -i hosts
ansible-playbook -i hosts common.yml
https://galaxy.ansible.com/ui/standalone/roles/
ansible-galaxy role install geerlingguy.nginx
