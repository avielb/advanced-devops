locals {
  user_data = <<EOF
#!/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -itd -p 80:80 nginx
EOF
}

resource "aws_launch_template" "my-lc" {
  name = "my-lc"

  image_id = "ami-0b898040803850657"
  key_name = "DevOps"

  vpc_security_group_ids = [
    aws_security_group.servers-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data  = base64encode(local.user_data)
  depends_on = [aws_security_group.servers-sg]
}