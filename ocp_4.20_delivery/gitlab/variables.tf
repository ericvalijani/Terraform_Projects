### General Section ####
variable "project_name" {
  type        = string
  description = "Name of the project"
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
  default     = "hvs.s6jitXoZR0gvdfvdfbtHUMejbmjmjfhbnHMggJtj"
  sensitive   = true
}

#######################################
### Section for GitLab Info ###
variable "gitlab_ssl" {
  type        = bool
  description = "if you are using self sign certificate, set to true"
  default     = true
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

