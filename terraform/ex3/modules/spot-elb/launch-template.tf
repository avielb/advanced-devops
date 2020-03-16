resource "aws_launch_template" "lt" {
  name = "${var.project-name}-lt"

  image_id      = "ami-0b898040803850657"
  key_name      = "DevOps"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.servers-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data  = base64encode(var.user-data)
  depends_on = [aws_security_group.servers-sg]
}