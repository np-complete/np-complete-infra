resource "github_repository" "np-complete-infra" {
  name                   = "np-complete-infra"
  visibility             = "public"
  has_downloads          = false
  has_discussions        = false
  has_projects           = false
  has_wiki               = false
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  allow_update_branch    = true
}

resource "github_repository" "build-book-action" {
  name                   = "build-book-action"
  description            = "github action to build book"
  visibility             = "public"
  has_downloads          = false
  has_discussions        = false
  has_projects           = false
  has_wiki               = false
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  allow_update_branch    = true
}
