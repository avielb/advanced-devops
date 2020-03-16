resource "aws_autoscaling_group" "asg" {
  name                = "${var.project-name}-asg"
  max_size            = var.max-size
  min_size            = var.min-size
  desired_capacity    = var.desired-capacity
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  launch_template {
    name    = aws_launch_template.lt.name
    version = aws_launch_template.lt.latest_version
  }

}