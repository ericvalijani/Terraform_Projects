terraform {
  required_providers {
    nexus    = {
      source = "datadrivers/nexus"
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

