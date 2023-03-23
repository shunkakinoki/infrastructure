terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shunkakinoki"
    workspaces {
      name = "main"
    }
  }
  required_providers {
    aws    = "~> 4.59.0"
    github = "~> 4.31.0"
  }
  required_version = "=1.0.2"
}
