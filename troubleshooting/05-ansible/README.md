# Ansible
Before this session, open a terminal in the `05-ansible` folder and run the following commands to start the Docker containers and set up SSH keys for passwordless authentication:
```aiignore
docker compose up -d
docker exec -it 05-ansible-ansible-1 bash
ssh-keygen
ssh-copy-id node1 # password is screencast
ssh-copy-id node2 # password is screencast
cd /ansible/playbooks
ansible-playbook -i hosts common.yml
```