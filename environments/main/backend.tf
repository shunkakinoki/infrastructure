terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shunkakinoki"
    workspaces {
      name = "main"
    }
  }
  required_providers {
    aws    = "~> 4.61.0"
    github = "~> 5.18.3"
  }
  required_version = "1.4.4"
}
