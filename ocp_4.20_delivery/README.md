# OCP 4.20 Delivery - Infrastructure Automation

Terraform-based infrastructure automation for deploying OpenShift Container Platform 4.20 clusters with integrated GitLab and Nexus repository management.

## Project Structure
ocp_4.20_delivery/

├── ocp/ # OpenShift cluster configurations

├── gitlab/ # GitLab provisioning

├── nexus/ # Nexus repository setup

└── modules/

├── gitlab_prov/ # GitLab provisioning module

├── nexus_repository/ # Nexus repository module

├── nginx_template/ # NGINX configuration module

├── port_checker/ # Port availability checker

└── upload_nginx_config/ # NGINX config uploader

## Components
### OpenShift Clusters

dcdev: Development cluster configuration
dcprd: Production cluster configuration

### Supporting Services
GitLab: Source code management and CI/CD
Nexus: Artifact repository manager
NGINX: Reverse proxy and load balancing

## Prerequisites
Terraform >= 1.0
Valid cloud provider credentials
Network access to target infrastructure
Required Terraform providers configured
# Usage

## 1. OpenShift Cluster Deployment
``
cd ocp/
``

``
terraform init
``

``
terraform plan
``

``
terraform apply
``

## 2. GitLab Provisioning
``
cd gitlab/
``

``
terraform init
``

``
terraform plan
``

``
terraform apply
``


## 3. Nexus Repository Setup

``
cd nexus/
``

``
terraform init
``

``
terraform plan
``

``
terraform apply
``

## Configuration
Each component has its own `terraform.tfvars` file for environment-specific configuration:

`ocp/terraform.tfvars` - Cluster settings

`gitlab/terraform.tfvars` - GitLab configuration

`nexus/terraform.tfvars` - Nexus settings

## Modules

### port_checker
Validates port availability before service deployment using `check_available_ports.sh`.

### nginx_template
Generates NGINX configuration templates for service routing.

### upload_nginx_config
Deploys NGINX configurations to target servers.

### gitlab_prov
Automates GitLab instance provisioning and configuration.

### nexus_repository
Sets up Nexus repository manager with required repositories.

## Backend Configuration
State management is configured in `ocp/backend.tf`. Update this for your remote state storage.

### Outputs
Each component exports relevant outputs (IPs, URLs, credentials) defined in respective `output.tf` files.

## ✍ Contribution
I am confident that working together with skilled individuals like yourself can improve the functionality, efficiency, and overall quality of our projects. Therefore, I would be delighted to see any forks from this project. Please feel free to use this code and share any innovative ideas to enhance it further.

## ☎ Contact information
#### 📧 salehmiri90@gmail.com
#### [Linkedin.com/in/salehmiri](https://www.linkedin.com/in/salehmiri)