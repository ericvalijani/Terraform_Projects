# Project Configuration
variable "project_name" {
  description = "Base project name (e.g., 'autoapp')"
  type        = string
}

variable "clusters" {
  type        = list(string)
  description = "List of clusters to deploy to (e.g. kumoDev, kumoPRD1)"
}

# Resource Quotas for Dev/UAT (ClusterResourceQuota)
variable "dev_uat_cpu_limit" {
  description = "CPU limit for dev/uat ClusterResourceQuota"
  type        = string
  default     = "2"
}

variable "dev_uat_memory_limit" {
  description = "Memory limit for dev/uat ClusterResourceQuota"
  type        = string
  default     = "10Gi"
}

variable "dev_uat_storage_request" {
  description = "Storage request for dev/uat ClusterResourceQuota"
  type        = string
  default     = "50Gi"
}

# Resource Quotas for PRD
variable "prd_cpu_limit" {
  description = "CPU limit for prd ResourceQuota"
  type        = string
  default     = "4"
}

variable "prd_memory_limit" {
  description = "Memory limit for prd ResourceQuota"
  type        = string
  default     = "16Gi"
}

variable "prd_storage_request" {
  description = "Storage request for prd ResourceQuota"
  type        = string
  default     = "100Gi"
}

# Users for Groups
variable "project_users" {
  description = "List of users to be added to the project group"
  type        = list(string)
  default     = []
}

# Environment Configuration
variable "environments" {
  description = "List of environments to create"
  type        = list(string)
  default     = ["dev", "uat", "prd"]
}

# Vault Configuration
variable "vault_addr" {
  description = "vault url"
  type        = string
  default     = "https://vault.salehmiri.ir:8200"
  sensitive   = true
}

variable "vault_token" {
  description = "vault token located in environment"
  type        = string
  default     = "hvs.CAESINaFXGplWBicHlFd0JDVmM4OVc"
  sensitive   = true
}
