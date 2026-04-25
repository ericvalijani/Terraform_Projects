# Project Information
output "project_name" {
  description = "project name"
  value       = var.project_name
}

output "group_name" {
  description = "Name of the group created for all clusters"
  value       = "${var.project_name}-group"
}

output "cluster_resource_quota_name" {
  description = "Name of the ClusterResourceQuota for dev/uat"
  value       = "crq-${var.project_name}"
}

output "prd_resource_quota_name" {
  description = "Name of the ResourceQuota for prd"
  value       = "rq-${var.project_name}-prd"
}

output "project_users" {
  description = "Name of the ResourceQuota for prd"
  value       = var.project_users
}

# Resource Quota Values
output "resource_quotas" {
  description = "Resource quota configuration"
  value = {
    dev_uat = {
      cpu_limit       = var.dev_uat_cpu_limit
      memory_limit    = var.dev_uat_memory_limit
      storage_request = var.dev_uat_storage_request
    }
    prd = {
      cpu_limit       = var.prd_cpu_limit
      memory_limit    = var.prd_memory_limit
      storage_request = var.prd_storage_request
    }
  }
}
