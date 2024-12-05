docker run -d -p 8080:80 nginx:alpine
FROM python:3-alpine
COPY app.py /app.py
CMD ["python", "/app.py"]
