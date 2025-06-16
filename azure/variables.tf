variable "environment" {
  description = "Deployment environment (dev/test/prod)"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
}

variable "account_tier" {
  description = "The storage account tier (Standard/Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type (LRS, GRS, etc.)"
  type        = string
  default     = "LRS"
}
