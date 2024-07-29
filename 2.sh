docker pull nginx:alpine
docker run -d -p 8080:80 --name my-nginx nginx:alpine
docker exec -it my-nginx sh
docker rm -vf my-nginx
docker run -d -p 8082:80 --name my-nginx2 nginx:1.26-alpine
docker build -t test .
docker run -d --name moshe test
