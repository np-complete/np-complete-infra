resource "github_repository" "book_template" {
  name                   = "book_template"
  visibility             = "public"
  has_issues             = true
  has_discussions        = false
  has_projects           = false
  has_wiki               = false
  is_template            = true
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  has_downloads          = false
  vulnerability_alerts   = true
  allow_update_branch    = true
}
