#!/bin/bash
echo "🗑️ Destroying infrastructure..."

cd ../terraform
terraform destroy -auto-approve

echo "✅ All resources deleted."
