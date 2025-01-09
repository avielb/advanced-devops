sudo -i 
yum install docker -y 
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 nginx:alpine
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
