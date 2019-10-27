podTemplate(yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven
    image: maven:3.3.9-jdk-8-alpine
    command: ['cat']
    tty: true
  - name: golang
    image: golang:1.8.0
    command: ['cat']
    tty: true
"""
) {

	node(POD_LABEL) {
		stage('Build a Maven project') {
			git 'https://github.com/jenkinsci/kubernetes-plugin.git'
			container('maven') {
				sh 'mvn --version'
			}
		}

		stage('Build a Golang project') {
			git url: 'https://github.com/terraform-providers/terraform-provider-aws.git'
			container('golang') {
				sh """
go version
        """
			}
		}

	}
}