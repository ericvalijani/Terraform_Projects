# Project Configuration
project_name = "autoapp"
clusters     = ["kumoprd1"]

# Resource Quotas for Dev/UAT (ClusterResourceQuota)
dev_uat_cpu_limit       = "30"
dev_uat_memory_limit    = "150Gi"
dev_uat_storage_request = "1Ti"

# Resource Quotas for PRD Cluster
prd_cpu_limit       = "60"
prd_memory_limit    = "300Gi"
prd_storage_request = "2Ti"

# Users for Project Group
project_users = [
  "salehmiri"
]

environments = ["prd"]
#environments = ["dev", "uat"]
#environments = ["dev", "uat", "prd"]

# Cluster Configuration (optional - can use KUBECONFIG env var instead)
# kubeconfig_path_siteA = "/path/to/ocp-kumoDev-kubeconfig"
# kubeconfig_path_siteB = "/path/to/ocp-kumoPRD1-kubeconfig"
