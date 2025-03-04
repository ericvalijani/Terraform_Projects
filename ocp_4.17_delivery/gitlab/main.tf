# Saleh Miri #
### Section for Gitlab ###

module "gitlab" {
  source              = "../modules/gitlab_prov/"
  gitlab_url          = var.gitlab_url
  gitlab_token        = var.gitlab_token
  gitlab_ssl          = var.gitlab_ssl
  project_name        = var.project_name
  gitlab_visibility   = var.gitlab_visibility
  gitlab_members      = var.gitlab_members
  gitlab_admins       = var.gitlab_admins
  gitlab_access_level = var.gitlab_access_level
}
