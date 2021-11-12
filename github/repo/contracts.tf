resource "github_repository" "contracts" {
  name           = "contracts"
  description    = "My Personal Contracts :notebook::whale::partly_sunny:"
  homepage_url   = ""
  default_branch = "main"

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

  topics = ["contracts", "eth", "solidity"]
}
