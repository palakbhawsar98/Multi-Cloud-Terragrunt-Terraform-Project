#!/bin/bash
set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "Usage: $0 <environment>"
  echo "Example: $0 dev"
  exit 1
fi

echo "Planning changes for environment: $ENV"

terragrunt run-all plan --terragrunt-working-dir "envs/$ENV/aws"
terragrunt run-all plan --terragrunt-working-dir "envs/$ENV/azure"

echo "Plan complete for $ENV."
