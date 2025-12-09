#!/bin/bash
set -e
echo "🚀 Deploying..."
cd terraform  # ✅ NOT ../terraform
terraform init -upgrade
terraform apply -auto-approve
echo "✅ Done! ALB: http://$(terraform output -raw alb_dns_name)"
