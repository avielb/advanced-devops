def label = "docker-jenkins-${UUID.randomUUID().toString()}"
def home = "/home/jenkins"
def workspace = "${home}/workspace/build-docker-jenkins"
def workdir = "${workspace}/src/localhost/docker-jenkins/"

def ecrRepoName = "my-jenkins"
def tag = "$ecrRepoName:latest"

podTemplate(label: label,
		containers: [
				containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:alpine'),
				containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
		],
		volumes: [
				hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
		],
) {
	node(label) {
		stage('Docker Build') {
			container('docker') {
				echo "Building docker image..."
				sh "echo FROM alpine > Dockerfile ; docker build - < Dockerfile"
			}
		}
	}
}