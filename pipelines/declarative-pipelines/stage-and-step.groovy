pipeline {
    agent none
    stages {
        stage('Example') {
            steps { 
                echo 'Hello World'
            }
        }
    }
}

