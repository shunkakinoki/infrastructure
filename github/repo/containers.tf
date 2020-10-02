resource "github_repository" "containers" {
  name           = "containers"
  description    = "My Personal Containers :notebook::whale::partly_sunny:"
  homepage_url   = ""
  default_branch = "master"

  archived               = false
  visibility             = "public"
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  is_template            = false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = false
  delete_branch_on_merge = true

  topics = ["iaac", "containers", "terraform"]
}

resource "github_branch_protection" "containers_alpha" {
  repository     = github_repository.containers.name
  branch         = "alpha"
  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict   = true
    contexts = ["auto-approve", "yarn"]
  }
}

resource "github_branch_protection" "containers_beta" {
  repository     = github_repository.containers.name
  branch         = "beta"
  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict   = true
    contexts = ["auto-approve", "yarn"]
  }
}

resource "github_branch_protection" "containers_main" {
  repository     = github_repository.containers.name
  branch         = "main"
  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict   = true
    contexts = ["auto-approve", "yarn", "Terraform Cloud/sentrei/sentrei-main"]
  }
}
