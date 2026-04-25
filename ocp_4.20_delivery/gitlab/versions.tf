terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
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

