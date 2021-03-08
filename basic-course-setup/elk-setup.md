yum install docker -y
systemctl enable docker
systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
git clone git@github.com:deviantony/docker-elk.git
yum install git -y
git clone git@github.com:deviantony/docker-elk.git
git clone https://github.com/deviantony/docker-elk.git
cd docker-elk/
docker-compose up -d
docker ps
cat /var/log/messages | nc localhost 5000
