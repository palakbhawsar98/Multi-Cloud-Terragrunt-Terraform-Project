include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/azure/storage"
}

inputs = {
  azure_region         = "eastus"
  environment          = "test"
  storage_account_name = "testmystorageacct"
  container_name       = "testcontainer"
  account_tier         = "Standard"
  replication_type     = "LRS"
  location            = "East US"
  resource_group_name  = "Azure-Test-RG"
  common_tags          = {
    Environment = "test"
    Project     = "my-multi-cloud-project"
  }
}
