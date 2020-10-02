terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shunkakinoki"
    workspaces {
      name = "main"
    }
  }
  required_providers {
    aws    = "~> 3.3.0"
    github = "~> 3.0.0"
  }
  required_version = "=0.13.4"
}
