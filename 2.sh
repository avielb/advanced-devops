docker pull nginx:alpine
docker run -d -p 8080:80 --name my-nginx nginx:alpine
docker exec -it my-nginx sh
