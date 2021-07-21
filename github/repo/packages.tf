resource "github_repository" "packages" {
  name           = "packages"
  description    = "My Personal Packages :notebook::whale::partly_sunny:"
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

  topics = ["docker", "personal", "packages"]
}
