FROM python:3.9
apt-get update && apt-get install -y curl
WORKDIR /appz
COPY requirements.txt .
RUN pip install -r requirements.txt --quiet true
CMD ["python", "mainn.py"]
