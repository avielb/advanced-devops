provider "aws" {
  region = "us-east-1"
}
resource "aws_network_acl" "bar" {
  vpc_id = "${data.aws_vpc.defult_vpc.id}"
  subnet_ids = data.aws_subnet_ids.example.ids
}

resource "aws_network_acl_rule" "bar" {
  network_acl_id = aws_network_acl.bar.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "deny"
  cidr_block = "0.0.0.0/0"
  from_port      = 22
to_port        = 22
}
