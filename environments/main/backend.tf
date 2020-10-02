terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shunkakinoki"

    workspaces {
      name = "main"
    }
  }
}
