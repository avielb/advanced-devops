provider "aws" {
  region = "us-east-1"
}
resource "aws_network_acl" "bar" {
  vpc_id     = data.aws_vpc.defult_vpc.id
  subnet_ids = data.aws_subnet_ids.example.ids
}

resource "aws_network_acl_rule" "bar" {
  network_acl_id = aws_network_acl.bar.id
  rule_number    = 1
  egress         = false
  protocol       = "tcp"
  from_port      = 22
  to_port        = 22
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "baz" {
  network_acl_id = aws_network_acl.bar.id
  rule_number    = 2
  egress         = true
  protocol       = "all"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
}