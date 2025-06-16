module "storage" {
  source = "../modules/azure/storage"

  environment              = var.environment
  storage_account_name     = var.storage_account_name
  location                 = var.location
  container_name           = var.container_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

}
