def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: '/bin/sh')]) {
	node(label) {
		stage("Checkout") {
			git "https://github.com/web3j/sample-project-maven.git"
		}
		stage("Build") {
			container('maven'){
				sh "mvn clean install"
			}
		}
	}
}
