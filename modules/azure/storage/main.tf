terraform {
  backend "s3" {}
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}


resource "azurerm_resource_group" "my_resource_group" {
  name     = "${var.environment}-rg"
  location = var.location
}

resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "my_storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private"
}
