locals {
  user_data = <<EOF
#!/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -itd -p 80:80 nginx
EOF
}

resource "aws_launch_template" "my-lt" {
  name = "my-lt"

  image_id = "ami-0b898040803850657"

  vpc_security_group_ids = [
    aws_security_group.servers-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data  = base64encode(local.user_data)
  depends_on = [aws_security_group.servers-sg]
}