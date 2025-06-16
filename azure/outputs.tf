output "storage_account_id" {
  value       = module.storage.storage_account_id
  description = "The ID of the storage account"
}

output "storage_account_primary_endpoint" {
  value       = module.storage.primary_blob_endpoint
  description = "The primary blob endpoint of the storage account"
}
