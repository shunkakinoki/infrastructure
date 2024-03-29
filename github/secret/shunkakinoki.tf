data "aws_iam_user" "aws" {
  user_name = "github"
}

data "aws_caller_identity" "aws" {}

data "github_repository" "shunkakinoki" {
  full_name = "shunkakinoki/shunkakinoki"
}

data "aws_acm_certificate" "acl_shunkakinoki_com" {
  domain      = "shunkakinoki.com"
  most_recent = true
  statuses    = ["ISSUED"]
}

resource "aws_iam_access_key" "aws" {
  user = data.aws_iam_user.aws.user_name
}

resource "github_actions_secret" "ACCESS_TOKEN" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "ACCESS_TOKEN"
  plaintext_value = var.ACCESS_TOKEN

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "AWS_ACL_ARN" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "AWS_ACL_ARN"
  plaintext_value = data.aws_acm_certificate.acl_shunkakinoki_com.arn

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "AWS_ACCESS_KEY_ID" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.aws.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "AWS_ACCOUNT_NUMBER" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "AWS_ACCOUNT_NUMBER"
  plaintext_value = data.aws_caller_identity.aws.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "AWS_SECRET_ACCESS_KEY" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.aws.secret

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "CARGO_REGISTRY_TOKEN" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "CARGO_REGISTRY_TOKEN"

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "DOCKER_PASSWORD" {
  repository  = data.github_repository.shunkakinoki.id
  secret_name = "DOCKER_PASSWORD"

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "NOTION_API_KEY" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "NOTION_API_KEY"
  plaintext_value = var.NOTION_API_KEY

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "NPM_TOKEN" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "NPM_TOKEN"
  plaintext_value = var.NPM_TOKEN

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "VERCEL_TOKEN" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "VERCEL_TOKEN"
  plaintext_value = var.VERCEL_TOKEN

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "VERCEL_ORG_ID" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "VERCEL_ORG_ID"
  plaintext_value = var.VERCEL_ORG_ID

  lifecycle {
    create_before_destroy = true
  }
}

resource "github_actions_secret" "VERCEL_PROJECT_ID" {
  repository      = data.github_repository.shunkakinoki.id
  secret_name     = "VERCEL_PROJECT_ID"
  plaintext_value = var.VERCEL_PROJECT_ID

  lifecycle {
    create_before_destroy = true
  }
}
