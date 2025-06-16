#!/bin/bash
set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "Usage: $0 <environment>"
  echo "Example: $0 dev"
  exit 1
fi

echo "Deploying environment: $ENV"

# Deploy AWS infra
echo "Deploying AWS infrastructure for $ENV..."
terragrunt run-all apply --terragrunt-working-dir "envs/$ENV/aws" --auto-approve

# Deploy Azure infra
echo "Deploying Azure infrastructure for $ENV..."
terragrunt run-all apply --terragrunt-working-dir "envs/$ENV/azure" --auto-approve

echo "Deployment to $ENV complete."
