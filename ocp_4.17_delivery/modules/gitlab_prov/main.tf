# Saleh Miri #
### Section for Gitlab ###

provider "gitlab" {
  base_url = var.gitlab_url
  token    = var.gitlab_token
  insecure = var.gitlab_ssl
}

resource "gitlab_group" "group" {
  name        = "${var.project_name}-group"
  path        = "${var.project_name}-group"
  description = "Specific group for ${var.project_name} project"
}

resource "gitlab_project" "project" {
  name             = var.project_name
  namespace_id     = gitlab_group.group.id
  description      = "This project is provided for ${var.project_name} project"
  visibility_level = var.gitlab_visibility
}

data "gitlab_user" "user" {
  for_each = toset(var.gitlab_members)
  username = each.key
}

data "gitlab_user" "admin" {
  for_each = toset(var.gitlab_admins)
  username = each.key
}

resource "gitlab_group_membership" "member" {
  for_each     = data.gitlab_user.user
  group_id     = gitlab_group.group.id
  user_id      = each.value.id
  access_level = var.gitlab_access_level
  expires_at   = null
}

resource "gitlab_group_membership" "admin" {
  for_each     = data.gitlab_user.admin
  group_id     = gitlab_group.group.id
  user_id      = each.value.id
  access_level = "owner"
  expires_at   = null
}

