docker run -d --name gitlesson  ubuntu:latest sleep 40000000
docker exec -it gitlesson bash
apt update && apt install -y git
mkdir devops && cd devops
