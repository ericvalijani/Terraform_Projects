### General Section ####
variable "project_name" {
  type        = string
  description = "Name of the project"
}

#######################################
### Section for GitLab Info ###

variable "gitlab_url" {
  type        = string
  description = "URL to access gitlab web page"
}

variable "gitlab_token" {
  type        = string
  description = "token key to access gitlab server"
}

variable "gitlab_ssl" {
  type        = bool
  description = "if you are using self sign certificate, set to true"
}

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


