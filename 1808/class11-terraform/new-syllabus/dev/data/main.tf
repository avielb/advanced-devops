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

output "subnets" {
  value = data.aws_subnets.vpc_subnets.filter
}