terraform {
  required_providers {
    nexus = {
      source = "datadrivers/nexus"
      version = "2.2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
    template = {
      source = "hashicorp/template"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}
