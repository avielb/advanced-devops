resource "aws_autoscaling_group" "asg" {
  name                = "${var.project-name}-asg"
  max_size            = var.max-size
  min_size            = var.min-size
  desired_capacity    = var.desired-capacity
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  mixed_instances_policy {
    instances_distribution {
      spot_allocation_strategy = "lowest-price"
    }
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.my-lc.id
      }
      override {
        instance_type = "t2.nano"
      }
      override {
        instance_type = "t2.micro"
      }
    }
  }

}