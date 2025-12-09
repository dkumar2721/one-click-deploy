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
