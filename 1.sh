docker rm -vf my-ubuntu
docker run -d --name  my-ubuntu ubuntu:latest sleep 1000000
docker exec -it my-ubuntu bash

apt update
apt install less -y
