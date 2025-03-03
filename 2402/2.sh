docker run -d -p 80:80 nginx:alpine
mkdir DevOps2402
cd DevOps2402
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
