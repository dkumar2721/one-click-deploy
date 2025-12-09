resource "aws_launch_template" "api" {
  name_prefix   = "api-"
  image_id      = "ami-0e86e58725bfbe893"  # Amazon Linux 2023 (us-east-1)
  instance_type = "t3.micro"

  vpc_security_group_ids = [var.ec2_sg_id]
  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(templatefile("${path.module}/userdata.sh.tftpl", {
    port = var.app_port
  }))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "api-instance"
    }
  }
}
