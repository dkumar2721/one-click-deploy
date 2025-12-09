 resource "aws_autoscaling_group" "api_asg" {
  min_size         = 2
  max_size         = 2
  desired_capacity = 2

  vpc_zone_identifier = var.private_subnets

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "api-asg-instance"
    propagate_at_launch = true
  }
} 
