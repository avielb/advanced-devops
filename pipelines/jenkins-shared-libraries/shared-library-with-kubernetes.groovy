@Library('jenkins-shared-library@master') _

def podLabel = "worker-${UUID.randomUUID()}"
centosRunner(podLabel){
	node(podLabel){
		stage("test"){
			container("centos"){
				sh "echo Hello from CentOS!"
			}
		}
	}
}