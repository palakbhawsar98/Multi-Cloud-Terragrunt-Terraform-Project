#!/bin/bash
set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "Usage: $0 <environment>"
  echo "Example: $0 dev"
  exit 1
fi

echo "Validating terraform for environment: $ENV"

terragrunt validate --terragrunt-working-dir "envs/$ENV/aws"
terragrunt validate --terragrunt-working-dir "envs/$ENV/azure"

echo "Validation successful for $ENV."
