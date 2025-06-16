include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/azure/storage"
}

inputs = {
  azure_region         = "eastus"
  environment          = "prod"
  storage_account_name = "prodmystorageacct"
  container_name       = "prodcontainer"
  account_tier         = "Standard"
  replication_type     = "LRS"
  location            = "West US"
  resource_group_name  = "Azure-Test-RG"
  common_tags          = {
    Environment = "prod"
    Project     = "my-multi-cloud-project"
  }
}
