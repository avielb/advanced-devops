# test
docker rm -vf my-jenkins
docker network create jenkins
docker run -d --name my-jenkins -p 8080:8080 -p 50000:50000 --network jenkins jenkins/jenkins:lts
docker logs my-jenkins
docker run -d --name avielb  --network jenkins -e JENKINS_URL=http://my-jenkins:8080   -e JENKINS_SECRET=064e87128f8d933e18dae53ef8bdc482a78f79c9353ba2f6e356a9f9ca37de63   jenkins/inbound-agent -name avielb



node { 
    stage("aviel"){
        sh "date"
    }
}

github actions
gitlab ci
circle ci
codefresh
jfrog pipelines
codebuild / codepipeline - dont touch


node("avielb") { 
    stage("aviel"){
        sh("date; ls -ltr")
    }
    stage("wait"){
        sleep 3
    }
    stage("blabla"){
        echo env.NAME
    }
    
    
}



pipeline {
    agent any  
    environment {
        
        MY_VAR = 'some_value'
    }
    stages { 
        stage("one"){
            steps{
                echo "wow: ${MY_VAR}"
                
            }
        }
    }
}
