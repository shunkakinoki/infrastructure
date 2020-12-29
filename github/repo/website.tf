resource "github_repository" "website" {
  name           = "shunkakinoki.com"
  description    = "My Personal Website :smirk::eyes::hotsprings:"
  homepage_url   = "https://www.shunkakinoki.com"
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

  topics = ["iaac", "website", "terraform"]
}
