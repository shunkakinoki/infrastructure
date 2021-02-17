resource "github_repository" "config" {
  name           = "config"
  description    = "My Personal Configurations :computer::bulb::memo:"
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

  topics = ["config", "eslint", "prettier"]
}
