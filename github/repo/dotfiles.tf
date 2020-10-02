resource "github_repository" "dotfiles" {
  name           = "dotfiles"
  description    = "My Personal Dotfiles :zap::octocat::smile:"
  homepage_url   = ""
  default_branch = "master"

  archived               = true
  private                = false
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  is_template            = false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = false
  delete_branch_on_merge = true

  topics = ["dotfiles", "linux", "macos"]
}

resource "github_branch_protection" "dotfiles_alpha" {
  repository     = github_repository.dotfiles.name
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

resource "github_branch_protection" "dotfiles_beta" {
  repository     = github_repository.dotfiles.name
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

resource "github_branch_protection" "dotfiles_main" {
  repository     = github_repository.dotfiles.name
  branch         = "main"
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
