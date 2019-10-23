@Library('jenkins-shared-library@master') _

pipeline {
	agent any
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