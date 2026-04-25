### General Section ####
variable "project_name" {
  type        = string
  description = "Name of the project"
}

#######################################
### Section for GitLab Info ###
variable "gitlab_visibility" {
  type        = string
  description = "choose if your project is public or private"
}

variable "gitlab_members" {
  type        = list(string)
  description = "List of GitLab usernames to add as members"
}

variable "gitlab_admins" {
  type        = list(string)
  description = "List of GitLab admins to add as members"
}

variable "gitlab_access_level" {
  type        = string
  description = "Choose user's access level"
  default     = "maintainer"
}
