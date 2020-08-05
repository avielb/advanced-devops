pipeline {
	agent {
		kubernetes {
			yamlFile 'KubernetesPod.yaml'
		}
	}
	stages {
		stage('Run maven') {
			steps {
				container('maven') {
					sh 'mvn -version'
				}
				container('busybox') {
					sh '/bin/busybox'
				}
			}
		}
	}
}
