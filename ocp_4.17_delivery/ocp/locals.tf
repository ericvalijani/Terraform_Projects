locals {
  dev_uat_environments = ["dev", "uat"]
  prd_environments     = ["prd"]
  dev_uat_namespaces   = [for env in local.dev_uat_environments : "${var.project_name}-${env}"]
  prd_namespaces       = [for env in local.prd_environments : "${var.project_name}-${env}"]
}
