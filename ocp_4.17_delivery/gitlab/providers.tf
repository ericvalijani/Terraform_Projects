# HashiCorp Vault Provider
provider "vault" {
  address         = var.vault_addr
  token           = var.vault_token
  skip_tls_verify = true
}

data "vault_generic_secret" "k8s_ocp" {
  path = "kv/k8s"
}

provider "gitlab" {
  base_url = data.vault_generic_secret.k8s_ocp.data["gitlab_url"]
  token    = data.vault_generic_secret.k8s_ocp.data["gitlab_token"]
  insecure = var.gitlab_ssl
}
