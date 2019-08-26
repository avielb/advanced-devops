data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_security_group" "default-sg" {
  name = "default"
}
variable "cluster_name" {}
