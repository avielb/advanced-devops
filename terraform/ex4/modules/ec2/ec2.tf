

resource "aws_instance" "web" {
  ami           = "ami-0b898040803850657"
  subnet_id     = data.aws_subnet.subnet.id
  instance_type = "t2.micro"
  security_groups = [
  aws_security_group.servers-sg.id, data.aws_security_group.default_sg.id]
  tags = {
    Name = var.cluster_name
  }
  user_data            = var.user_data
  iam_instance_profile = aws_iam_instance_profile.instances_iam_instance_profile.id
}