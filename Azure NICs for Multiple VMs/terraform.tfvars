# Copy this file to terraform.tfvars and customize the values

# General Configuration
environment     = "dev"
location        = "East US"
resource_prefix = "secure-infra"


# VM Configuration
vm_size        = "Standard_D2s_v3"
vm_count       = 1
admin_username = "azureadmin"
admin_password = "YourSecurePassword123!" # Must meet Azure complexity requirements

# Tags
default_tags = {
  Environment = "dev"
  Project     = "TF-DEV"
  ManagedBy   = "Terraform"
  Owner       = "SalehMiri"
}
