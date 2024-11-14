docker run -d --name gitlesson  ubuntu:latest sleep 40000000
docker exec -it gitlesson bash
apt update && apt install -y git
mkdir devops && cd devops
mkdir 1909-first-repo && cd 1909-first-repo
echo 1 > 1.txt
