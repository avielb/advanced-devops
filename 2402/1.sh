docker run --name devops2402 -d ubuntu:latest sleep 10000000
docker exec -it devops2402 bash
export COURSE=DevOps2402
echo $?
echo $COURSE
mkdir -p a/b/c/d/e
mkdir -p a/b/c/f
echo $COURSE > name.txt
cat name.txt
cp -r a /tmp/moshe
mv file1 /tmp/david2
cd /tmp/DevOps2402
tar -cvf artifact.tar .
apt update 
apt install less
cd /var/log
less dpkg.log
cat dpkg.log | grep "status installed"
cat dpkg.log | grep "status installed" | awk '{print $5}'
