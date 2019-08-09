resource "aws_elb" "elb" {
  name = "${var.project-name}-elb"
  listener {
    instance_port     = 80
    instance_protocol = "TCP"
    lb_port           = 80
    lb_protocol       = "TCP"
  }
  subnets         = data.aws_subnet_ids.subnets.ids
  security_groups = [aws_security_group.servers-sg.id, data.aws_security_group.default-sg.id]
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.elb.id
}