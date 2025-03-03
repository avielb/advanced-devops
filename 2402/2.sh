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
