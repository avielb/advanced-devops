provider "aws" {
  region = "us-east-1"
}

module "ec2-rds" {
  source       = "../../modules/ec2-rds"
  cluster_name = "coolapps"
}