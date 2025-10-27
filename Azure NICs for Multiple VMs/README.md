# 🌐 Azure Virtual Machine Deployment with Terraform

This repository contains Terraform configuration files to **provision multiple Windows Virtual Machines in Azure**, along with all required networking components — including a **Virtual Network**, **Subnet**, **Network Security Group**, and **Network Interface Cards (NICs)** with **static IP allocation**.

---

## 📁 Project Structure

| File | Description |
|------|--------------|
| `versions.tf` | Defines Terraform and provider versions (AzureRM and Random). |
| `network.tf` | Creates the Resource Group, Virtual Network, Subnet, NSG, and associations. |
| `compute.tf` | Creates NICs and Windows Virtual Machines, supporting multiple instances. |
| `variables.tf` | Declares all input variables for configuration, such as subnet, VM count, and tags. |

---

## 🧰 Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform ≥ 1.8.0](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An active [Azure subscription](https://portal.azure.com)

Then authenticate:
```bash
az login
```

⚙️ Configuration

Edit the variables.tf or create a terraform.tfvars file to override defaults:
```
resource_prefix   = "corp"
environment       = "dev"
location          = "East US"
vm_count          = 2
vm_size           = "Standard_D2s_v3"
admin_username    = "azureadmin"
admin_password    = "StrongP@ssw0rd!"
default_tags = {
  Owner = "SRE Team"
  Project = "Azure-VM-Terraform"
}
```

By default:

Subnet range: 10.1.2.0/27

Static IPs are calculated automatically using cidrhost()

Windows Server 2022 Datacenter image is used

🚀 Deployment Steps

Run the following commands to deploy:


```
# Initialize Terraform providers and modules
terraform init

# Review the execution plan
terraform plan

# Apply configuration to Azure
terraform apply


```

To destroy all resources later:

```
terraform destroy

```

🧩 Key Features

✅ Creates Resource Group, VNet, and Subnet
✅ Configures Network Security Groups with inbound/outbound rules
✅ Deploys multiple Windows VMs (scalable via vm_count)
✅ Each VM receives a unique static IP automatically calculated
✅ Uses cidrhost() to avoid manual IP assignment (no DHCP required)
✅ Enforces strong admin password validation
✅ Supports full tag management for cost tracking and organization

🏗️ Architecture Overview

```
+-----------------------------+
|  Azure Resource Group       |
|  (corp-dev-rg)              |
|                             |
|  +-----------------------+  |
|  | Virtual Network       |  |
|  | 10.1.2.0/25           |  |
|  |   +----------------+  |  |
|  |   | Subnet: myzone |  |  |
|  |   | 10.1.2.0/27    |  |  |
|  |   +----------------+  |  |
|  |        ↑ NICs (Static IPs)|
|  |        ↑ Windows VMs      |
|  +-----------------------+  |
+-----------------------------+

```

🧾 Example Output

After applying, you’ll see outputs like:

```
azurerm_windows_virtual_machine.vm[0].name = corp-dev-vm-1
azurerm_windows_virtual_machine.vm[1].name = corp-dev-vm-2
azurerm_network_interface.vm[0].private_ip_address = 10.1.2.5
azurerm_network_interface.vm[1].private_ip_address = 10.1.2.6


```

👨‍💻 Author

Saleh Miri -- Cloud & DevOps Engineer | Automation and Innovation
