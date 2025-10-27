# General Configuration
variable "environment" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "resource_prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "resource_group_name" {
  description = "Existing resource group name"
  type        = string
}

# Network Configuration
variable "subnet_config" {
  description = "Subnet configuration"
  type = map(object({
    name           = string
    address_prefix = string
    nsg_name       = string
  }))
  default = {
    my_zone = {
      name           = "myzoneSnt"
      address_prefix = "10.1.2.0/27"
      nsg_name       = "myzoneSntNSG"
    }
  }
}

# VM Configuration
variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "admin_username" {
  description = "Administrator username for VMs"
  type        = string
  default     = "azureadmin"
  sensitive   = true
}

variable "admin_password" {
  description = "Administrator password for VMs"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.admin_password) >= 12 && can(regex("[A-Z]", var.admin_password)) && can(regex("[a-z]", var.admin_password)) && can(regex("[0-9]", var.admin_password)) && can(regex("[^A-Za-z0-9]", var.admin_password))
    error_message = "Password must be at least 12 characters long and contain uppercase, lowercase, numeric, and special characters."
  }
}

# Tags
variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
}