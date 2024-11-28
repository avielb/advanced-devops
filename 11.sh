docker run -d --name linux  ubuntu:latest sleep 40000000
docker exec -it linux bash

mkdir -p a/b/c/d
echo 1 >  a/b/c/1.txt


apt update && apt install less -y
tail -100 bootstrap.log | grep Setting | awk '{print $4}'
apt install nano vim -y
