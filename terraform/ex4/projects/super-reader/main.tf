provider "aws" {
  region = "us-east-1"
}
locals {
  user_data = <<EOF
#!/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -itd -p 80:80 nginx
EOF
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  hash_key = "Id"
  hash_key_type = "N"
  table_name = "ProductCatalog"
}

module "ec2" {
  source = "../../modules/ec2"
  cluster-name = "super-reader"
  user_data = local.user_data
}