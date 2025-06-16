locals {
  project_name          = "my-multi-cloud-project"
  default_aws_region    = "us-east-1"
  default_azure_region  = "eastus"
  aws_account_id        = "aws-account-id"
  azure_subscription_id = "azure-subscription-id"

  common_tags = {
    Project   = local.project_name
    ManagedBy = "Terragrunt"
  }


  path_parts  = split("/", replace(path_relative_to_include(), "envs/", ""))
  environment = length(local.path_parts) > 0 ? local.path_parts[0] : "dev"
  provider    = length(local.path_parts) > 1 ? local.path_parts[1] : "aws"
}


remote_state {
  backend = "s3"
  config = {
    bucket  = "multi-cloud-multi-env-bucket"
    key     = "${local.environment}/shared.tfstate"
    region  = local.default_aws_region
    use_lockfile = true
  }
}

generate "aws_provider" {
  path      = "provider_aws.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.default_aws_region}"
}
EOF
}

generate "azure_provider" {
  path      = "provider_azure.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = "${local.azure_subscription_id}"
}
EOF
}

# Common inputs passed to all modules
inputs = {
  environment           = local.environment
  aws_region            = local.default_aws_region
  azure_region          = local.default_azure_region
  aws_account_id        = local.aws_account_id
  azure_subscription_id = local.azure_subscription_id
  project_name          = local.project_name
  common_tags           = merge(local.common_tags, { Environment = local.environment })
}
