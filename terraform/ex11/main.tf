provider "aws" {
  region = "us-east-1"
}
module "ec2-instance" {
  source  = "cloudposse/ec2-instance/aws"
  version = "0.21.1"
  # insert the 4 required variables here
}