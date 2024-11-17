docker rm -vf gitlesson
docker run -d --name gitlesson  ubuntu:latest sleep 40000000
docker exec -it gitlesson bash
apt update && apt install -y git
mkdir devops && cd devops
mkdir 1909-first-repo && cd 1909-first-repo
echo 1 > 1.txt
git config --global user.email "you@example.com"
git config --global user.name "avielb"
git commit -am "init commit"
cd ~/devops && mkdir branches && cd branches
echo 1 > 1.txt 
git add . && git commit -am "init commit"
git clone https://github.com/avielb/advanced-devops.git
# kukuku
