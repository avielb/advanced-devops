@Library('jenkins-shared-library@master') _

pipeline {
	agent none
	stages {
		stage('Git Checkout') {
			steps {
				gitCheckout(
						branch: "main",
						url: "https://github.com/spring-projects/spring-petclinic.git"
				)
			}
		}
	}
}
