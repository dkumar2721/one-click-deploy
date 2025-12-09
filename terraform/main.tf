# terraform/main.tf
provider "aws" {
  region = var.region
}

# VPC
module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

# Security Groups
module "security" {
  source   = "./modules/security"
  vpc_id   = module.vpc.vpc_id
  app_port = var.app_port
}

# IAM
module "iam" {
  source = "./modules/iam"
}

# ALB (needed before ASG because ASG needs target_group_arn)
module "alb" {
  source          = "./modules/alb"
  alb_sg_id       = module.security.alb_sg_id
  public_subnets  = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
  app_port        = var.app_port
}

# Launch Template
module "launch_template" {
  source                = "./modules/launch-template"
  ec2_sg_id             = module.security.ec2_sg_id
  instance_profile_name = module.iam.instance_profile_name
  app_port              = var.app_port
}

# ASG
module "asg" {
  source               = "./modules/asg"
  private_subnets      = module.vpc.private_subnets
  launch_template_id   = module.launch_template.launch_template_id
  target_group_arn     = module.alb.target_group_arn
}
