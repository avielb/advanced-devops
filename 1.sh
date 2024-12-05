docker run -d -p 8080:80 nginx:alpine
FROM python:3-alpine
COPY app.py /app.py
CMD ["python", "/app.py"]
docker run -d --name nginx1 --network test nginx:alpine
docker run -d --name nginx2 --network test nginx:alpine

---------------------------
docker-compose.yaml

services:
  nginx:
    image: nginx:latest
    container_name: nginx
    ports:
      - "8083:80"
    
