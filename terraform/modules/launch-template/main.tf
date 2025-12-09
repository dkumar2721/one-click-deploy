# modules/launch-template/main.tf
resource "aws_launch_template" "api" {
  image_id      = var.ami_id    # ← must use the variable
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.ec2_sg_id]
  }

  iam_instance_profile {
    name = var.instance_profile_name
  }

  # Optional: user_data to start your app (via templatefile or inline)
  user_data = base64encode(templatefile("${path.module}/userdata.sh.tftpl", {}))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "api-instance"
    }
  }
}
