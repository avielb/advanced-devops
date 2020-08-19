provider "aws" {
  region = "us-east-1"
}
module "ec2-instance" {
  source  = "cloudposse/ec2-instance/aws"
  version = "0.21.1"
  # insert the 4 required variables here
  name            = "aviel"
  ssh_key_pair    = ""
  subnet          = "subnet-8d2bc2bc"
  vpc_id          = "vpc-1510e668"
  user_data       = ""
  security_groups = []
}

module "ec2-instance2" {
  source  = "cloudposse/ec2-instance/aws"
  version = "0.21.1"
  # insert the 4 required variables here
  name         = "buskila"
  ssh_key_pair = ""
  subnet       = "subnet-8d2bc2bc"
  vpc_id       = "vpc-1510e668"
  user_data    = ""
}

output "result" {
  value = "${module.ec2-instance.public_dns} ${module.ec2-instance2.public_dns}"
}