provider "aws" {
  region = "us-east-1"
}

module "rds" {
  source       = "../../modules/rds"
  cluster_name = var.cluster_name
}

