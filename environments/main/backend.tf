terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shunkakinoki"
    workspaces {
      name = "main"
    }
  }
  required_providers {
    aws    = "~> 3.56.0"
    github = "~> 4.13.0"
  }
  required_version = "=1.0.2"
}
