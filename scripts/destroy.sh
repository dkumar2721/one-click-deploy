#!/bin/bash
set -e
echo "🗑️ Destroying..."
cd terraform  # ✅ NOT ../terraform
terraform destroy -auto-approve
echo "✅ Cleaned up!""
