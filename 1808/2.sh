docker run -d -p 80:80 nginx:alpine
mkdir DevOps1808
cd DevOps1808
-----

1.py
print("Hello world!")


Dockerfile
FROM python:alpine
ENV AAA=bbb
WORKDIR /app
COPY 1.py /app/1.py
RUN pip install requests
CMD ["python", "/app/1.py"]
# move Dockerfile.txt Dockerfile

docker build -t myimage .
docker run --name myapp -d myimage
docker logs myapp

docker run -d --name test nginx:alpine
docker exec -it test sh
exit
docker ps
docker stop test
docker start test
docker rm -vf test


docker network create example
docker run -d  --name container1 --network example nginx:alpine
docker run -d  --name container2 --network example nginx:alpine

docker network inspect example
docker exec -it container1 sh
curl http://container2
-------------------

notepad docker-compose.yaml
nano docker-compose.yaml
-----
services:
  nginx:
    environment:
      - NGINX_HOST=localhost
      - NGINX_PORT=80
      - AVIEL=moshe
    image: nginx:alpine
    container_name: my_nginx
    ports:
      - "8080:80"
  alpine:
    image: alpine:latest
    container_name: my_alpine
    command: ["sleep", "infinity"]
    environment:
      - MY_VAR=example
    restart: always


move docker-compose.yaml.txt docker-compose.yaml
https://hub.docker.com/

docker compose up -d
docker tag myimage avielb/myimage-1808:v0.1
docker push avielb/myimage-1808:v0.1


# Stage 1: Build
FROM golang:1.20 AS builder
WORKDIR /app

# Create main.go inline
RUN echo 'package main\nimport "fmt"\nfunc main() { fmt.Println("Hello, Multi-Stage Docker!") }' > main.go

# Build the Go binary
RUN go build -o myapp main.go

# Stage 2: Create lightweight runtime image
FROM alpine:latest  
WORKDIR /root/
COPY --from=builder /app/myapp .
CMD ["./myapp"]
