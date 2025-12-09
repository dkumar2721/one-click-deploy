#!/bin/bash
echo "🚀 Deploying infrastructure..."

cd ../terraform
terraform init
terraform apply -auto-approve

echo "✅ Deployment complete!"
echo "🧪 Test your API at: http://$(terraform output -raw alb_dns_name)"
