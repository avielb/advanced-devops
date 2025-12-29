```aiignore
docker compose up -d
docker exec -it ansible-demo-ansible-1 bash
ssh-keygen
ssh-copy-id node1 # password is screencast
ssh-copy-id node2 # password is screencast
cd /ansible/playbooks
ansible-playbook -i hosts common.yml
```