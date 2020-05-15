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
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  root_block_device {
    encrypted   = true
    volume_size = 10
  }
  tags = {
    Name = "HelloWorld"
  }
  depends_on = [aws_kms_key.key]
}