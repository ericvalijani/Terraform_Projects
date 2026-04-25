# HashiCorp Vault Provider
provider "vault" {
  address         = var.vault_addr
  token           = var.vault_token
  skip_child_token = true
  skip_tls_verify = true
}

data "vault_generic_secret" "k8s_ocp" {
  path = "kv/k8s"
}

# Configure for dev/uat cluster (ocp-dcdev)
provider "kubernetes" {
  alias    = "kumodev"
  host     = data.vault_generic_secret.k8s_ocp.data["dcdev_host"]
  token    = data.vault_generic_secret.k8s_ocp.data["dcdev_token"]
  insecure = true
}

# Configure for prd cluster (ocp-dcprd)
provider "kubernetes" {
  alias    = "kumoprd1"
  host     = data.vault_generic_secret.k8s_ocp.data["dcprd_host"]
  token    = data.vault_generic_secret.k8s_ocp.data["dcprd_token"]
  insecure = true
}