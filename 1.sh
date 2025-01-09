sudo -i 
yum install docker -y 
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx:alpine
