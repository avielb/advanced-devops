locals {
  user_data = <<EOF
#!/usr/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d -p 80:80 --name dokuwiki bitnami/dokuwiki:latest
EOF
}

resource "aws_instance" "dokuwiki" {
  ami                    = "ami-0b898040803850657"
  key_name               = "DevOps"
  instance_type          = "t2.micro"
  user_data              = base64encode(local.user_data)
  vpc_security_group_ids = [aws_security_group.servers-sg.id, data.aws_security_group.default-sg.id]
  depends_on             = [aws_security_group.servers-sg]
}