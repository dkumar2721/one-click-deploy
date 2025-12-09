variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app_port" {
  description = "Port the app runs on"
  type        = number
  default     = 8080
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (must be in the same region)"
  type        = string
  # Optional: you can set a default for us-east-1
  default     = "ami-0e40a51a932d22a6f"
}
