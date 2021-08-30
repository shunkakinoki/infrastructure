data "github_repository" "shunkakinoki" {
  full_name = "shunkakinoki/shunkakinoki"
}

resource "github_actions_secret" "ACCESS_TOKEN" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "ACCESS_TOKEN"
}

resource "github_actions_secret" "AWS_ACCESS_KEY_ID" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "AWS_ACCESS_KEY_ID"
}

resource "github_actions_secret" "AWS_SECRET_ACCESS_KEY" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "AWS_SECRET_ACCESS_KEY"
}

resource "github_actions_secret" "CARGO_REGISTRY_TOKEN" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "CARGO_REGISTRY_TOKEN"
}

resource "github_actions_secret" "DOCKER_PASSWORD" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "DOCKER_PASSWORD"
}

resource "github_actions_secret" "NOTION_API_KEY" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "NOTION_API_KEY"
}

resource "github_actions_secret" "NPM_TOKEN" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "NPM_TOKEN"
}
