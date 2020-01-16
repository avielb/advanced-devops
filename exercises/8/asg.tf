locals {
  user_data = <<EOF
#!/usr/bin/bash
yum install docker -y
systemctl enable docker
systemctl start docker
docker run -d \
-e DB_HOST=${aws_db_instance.default.address}:${aws_db_instance.default.port} \
-e DB_DATABASE=${aws_db_instance.default.name} \
-e DB_USERNAME=${aws_db_instance.default.username} \
-e DB_PASSWORD=${aws_db_instance.default.password} \
-p 8080:80 \
 solidnerd/bookstack:0.27.5
EOF
}

resource "aws_launch_template" "my-lt" {
  name = "my-lt"

  image_id      = "ami-0b898040803850657"
  key_name      = "DevOps"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.rds-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data  = base64encode(local.user_data)
  depends_on = [aws_security_group.rds-sg, aws_db_instance.default]
}

resource "aws_autoscaling_group" "asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  launch_template {
    name    = aws_launch_template.my-lt.name
    version = aws_launch_template.my-lt.latest_version
  }
}