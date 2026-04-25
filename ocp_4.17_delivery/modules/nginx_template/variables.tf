variable "projectname" {
  description = "The name of the Nginx configuration file for that specific project"
  type        = string
}

variable "listen_port" {
  description = "The number of the listen Nginx configuration port for that specific project"
  type        = number
}

variable "proxy_port" {
  description = "The number of the proxy Nginx configuration port for that specific project"
  type        = number
}

variable "ssh_host" {
  description = "nexus host ip or name for connecting"
  type        = string
}
