@Library('jenkins-shared-library@master') _

pipeline {
	agent none
	stages {
		stage('Git Checkout') {
			steps {
				gitCheckout(
						branch: "master",
						url: "https://github.com/spring-projects/spring-petclinic.git"
				)
			}
		}
	}
}