docker run --name devops2402 -d ubuntu:latest sleep 10000000
docker exec -it devops2402 bash
export COURSE=DevOps2402
echo $?
echo $COURSE
mkdir -p a/b/c/d/e
mkdir -p a/b/c/f
