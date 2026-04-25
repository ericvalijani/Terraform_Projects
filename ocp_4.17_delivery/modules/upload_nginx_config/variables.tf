variable "sourcefile" {
  description = "path to get source conf file and copy to destination"
  type        = string
}

variable "destination" {
  description = "path on remote servers"
  type        = string
}

variable "projectname" {
  description = "for project name"
  type        = string
}

variable "remote_user" {
  description = "remote uer for connecting to the nexus servers"
  type        = string
}

variable "remote_pass" {
  description = "password for remote user on nexus server"
  type        = string
}

variable "ssh_host" {
  description = "nexus host ip or name for connecting"
  type        = string
}
