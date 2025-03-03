docker run -d -p 80:80 nginx:alpine
mkdir DevOps2402
cd DevOps2402
-----

1.py
print("Hello world!")


Dockerfile
FROM python:alpine
COPY 1.py /app
CMD ["python", "/app/1.py"]
