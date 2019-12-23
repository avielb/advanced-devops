def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
		containerTemplate(name: 'centos', image: 'centos:7', ttyEnabled: true),
		containerTemplate(name: 'ubuntu', image: 'ubuntu', ttyEnabled: true)]) {
	node(label) {
		stage('Run CentOS') {
			container('centos'){
				sh "cat /etc/*-release"
			}
		}
		stage('Run Ubuntu') {
			container('ubuntu'){
				sh "cat /etc/*-release"
			}
		}
	}
}
