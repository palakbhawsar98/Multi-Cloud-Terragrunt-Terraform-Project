output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.my_resource_group.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.my_storage_account.name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.my_storage_container.name
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.my_storage_account.id
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = azurerm_storage_account.my_storage_account.primary_blob_endpoint
}
