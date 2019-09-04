provider "aws" {
  region = "us-east-1"
}
locals {
  user_data = <<EOF
#!/bin/bash
yum install docker awscli -y
systemctl enable docker
systemctl start docker
aws dynamodb scan --table-name ProductCatalog > /tmp/index.html
docker run -itd -p 80:80 -v /tmp/:/usr/share/nginx/html:ro nginx
EOF
}

module "dynamodb" {
  source        = "../../modules/dynamodb"
  hash_key      = "Id"
  hash_key_type = "N"
  table_name    = "ProductCatalog"
}

module "ec2" {
  source       = "../../modules/ec2"
  cluster-name = "super-reader"
  user_data    = local.user_data
  table_arn    = "arn:aws:dynamodb:us-east-1:428552933338:table/ProductCatalog"

}

