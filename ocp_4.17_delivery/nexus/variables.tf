### General Section ####
variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "project_description" {
  type        = string
  description = "description about the project"
}

### Section for free port and Nexus ###
variable "start_port" {
  description = "Starting port number for the range"
  type        = number
}

variable "end_port" {
  description = "Ending port number for the range"
  type        = number
}

variable "bs_quota" {
  description = "quota size to set on blob store in MB"
  type        = number
}

variable "ssh_host" {
  description = "nexus host ip or name for connecting"
  type        = string
}

variable "ssh_host_port" {
  description = "nexus host port for connecting"
  type        = number
}

variable "remote_user" {
  description = "The user to connect to the remote server"
  type        = string
}

variable "remote_pass" {
  description = "nexus server password for SSH authentication"
  type        = string
}

variable "nexus_user" {
  description = "The user to connect to the nexus server web GUI"
  type        = string
}

variable "nexus_pass" {
  description = "nexus server password for web GUI"
  type        = string
}
