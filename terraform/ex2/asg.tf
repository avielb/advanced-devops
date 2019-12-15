resource "aws_autoscaling_group" "asg" {
  max_size            = 2
  min_size            = 0
  desired_capacity    = 2
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  mixed_instances_policy {
    instances_distribution {
      spot_allocation_strategy = "lowest-price"
    }
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.my-lt.id
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