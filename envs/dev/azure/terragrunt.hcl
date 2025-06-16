
include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/azure/storage"
}

inputs = {
  azure_region         = "eastus"
  environment          = "dev"
  storage_account_name = "devmystorageacct"
  container_name       = "devcontainer"
  account_tier         = "Standard"
  replication_type     = "LRS"
  location            = "East US"
  resource_group_name  = "Azure-Test-RG"
  common_tags          = {
    Environment = "dev"
    Project     = "my-multi-cloud-project"
  }
}
