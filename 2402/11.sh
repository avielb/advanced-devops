# create folder in the pycharm project called "class11"
provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "example" {}

variable "server_name" {
  type = string
  default = "moshe"
  description = "the name of the server"
}

output "name" {
  value = var.server_name
}
----------------------------------------------
variable "server_name" {
  type = string
  default = "moshe.example.com"
  description = "the name of the server"
}

output "name" {
  value = "ssh myuser@${var.server_name}"
}
--------------------------------------------------
variable "var1" {}
variable "var2" {}
-------------------------------------------
output "result" {
  value = "${var.var1} --- ${var.var2}"
}
-------------------------------------------
module "myapp" {
  source = "../../modules/myapp"
  var1 = "moshe"
  var2 = "david"
}

output "myapp" {
  value = module.myapp.result
}

-------------------------------------------
https://registry.terraform.io/browse/modules
-------------------------------------------
variables.tf
----
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
---------------------------------------------
main.tf
-----
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0" # Use the latest version

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

data "aws_availability_zones" "available" {}
--------------------------------
main.tf
---
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["my-existing-vpc"]
  }
}

# Find all subnets in the VPC
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}
------------------------------
in class11/dev
docker-compose.yaml
---
version: '3.8'

services:
  localstack:
    image: localstack/localstack:latest
    container_name: localstack_main
    ports:
      - "4566:4566"   # LocalStack Gateway
    environment:
      - DOCKER_HOST=unix:///var/run/docker.sock
      - LOCALSTACK_SERVICES=s3,lambda,dynamodb # List any other services you want to enable here

volumes:
  localstack_volume:
    driver: local
---
in class11/dev/localstack/main.tf
---
provider "aws" {

  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3             = "http://s3.localhost.localstack.cloud:4566"
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-local-bucket"
}
