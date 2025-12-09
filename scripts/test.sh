#!/bin/bash
ALB=$(cd ../terraform && terraform output -raw alb_dns_name)

echo "Testing /health..."
curl -s http://$ALB/health

echo -e "\nTesting / ..."
curl -s http://$ALB/
