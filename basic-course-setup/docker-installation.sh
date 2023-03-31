yum install docker -y
systemctl enable docker
systemctl start docker
sudo wget https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
