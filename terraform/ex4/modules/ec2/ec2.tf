data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  subnet_id = data.aws_subnet.subnet.id
  instance_type = "t2.micro"
  security_groups = [
    aws_security_group.servers-sg.id, data.aws_security_group.default-sg.id]
  tags = {
    Name = var.cluster-name
  }
  user_data = var.user_data
}