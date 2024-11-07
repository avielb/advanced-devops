# test
docker rm -vf my-jenkins
docker network create jenkins
docker run -d --name my-jenkins -p 8080:8080 -p 50000:50000 --network jenkins jenkins/jenkins:lts
