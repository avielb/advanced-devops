provider "aws" {
  region = "us-east-1"
}

module "spot-elb" {
  source           = "../../modules/spot-elb"
  desired-capacity = "1"
  max-size         = "1"
  min-size         = "0"
  project-name     = "jenkins"
  user-data        = local.user-data

}

locals {
  user-data = <<EOF
#!/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -p 80:8080 jenkins
EOF
}

output "url" {
  value = module.spot-elb.url
}