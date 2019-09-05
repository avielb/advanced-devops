data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet" "subnet" {
  availability_zone_id = "use1-az3"
}

data "aws_security_group" "default_sg" {
  name = "default"
}
variable "cluster_name" {}
variable "user_data" {}
variable "table_arn" {}