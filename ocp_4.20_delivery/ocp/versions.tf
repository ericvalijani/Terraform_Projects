terraform {
  required_version = ">= 1.8.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.2.0"
    }
  }
}
