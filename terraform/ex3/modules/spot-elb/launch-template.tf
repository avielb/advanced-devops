resource "aws_launch_template" "my-lc" {
  name = "${var.project-name}-lc"

  image_id = "ami-0b898040803850657"
  key_name = "DevOps"

  vpc_security_group_ids = [
    aws_security_group.servers-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data  = base64encode(var.user-data)
  depends_on = [aws_security_group.servers-sg]
}