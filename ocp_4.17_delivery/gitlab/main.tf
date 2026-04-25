# Saleh Miri #
### Section for Gitlab ###

module "gitlab" {
  #source              = "${path.module}/modules/gitlab_prov/"
  source              = "/opt/terraform/modules/gitlab_prov/"
  project_name        = var.project_name
  gitlab_visibility   = var.gitlab_visibility
  gitlab_members      = var.gitlab_members
  gitlab_admins       = var.gitlab_admins
  gitlab_access_level = var.gitlab_access_level
}

