data aws_vpc defult_vpc {
  default = true
}

data "aws_subnet_ids" "example" {
  vpc_id = data.aws_vpc.defult_vpc.id
}

