docker pull nginx:alpine
docker run -d -p 8080:80 --name my-nginx nginx:alpine
docker exec -it my-nginx sh
docker rm -vf my-nginx
docker run -d -p 8082:80 --name my-nginx2 nginx:1.26-alpine
docker build -t test .
docker run -d --name moshe test

docker network create my-network
docker run -d --name nginx1 --network my-network nginx:alpine
docker run -d --name nginx2 --network my-network nginx:alpine
docker network inspect  my-network


version: '3'

services:
  nginx55:
    image: nginx:alpine
    container_name: nginx55
    networks:
      - my-network

  nginx56:
    image: nginx:alpine
    container_name: nginx56
    networks:
      - my-network

networks:
  my-network:
    driver: bridge



docker tag test avielb/0306repo:v0.1
