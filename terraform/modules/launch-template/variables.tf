# modules/launch-template/variables.tf
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "app_port" {
  description = "Port the app listens on"
  type        = number
}
