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

locals {
  books = toset([
    "c80", "c81", "c84", "c86", "c87", "c89",
    "c91", "c92", "c93", "c94", "c95", "c97", "c99",
    "c100", "c101", "c102", "c104",
    "TechBookFes01", "TechBookFes02", "TechBookFes06"
  ])
}

resource "github_repository" "books" {
  for_each               = local.books
  name                   = each.key
  visibility             = "public"
  has_issues             = true
  has_discussions        = false
  has_projects           = false
  has_wiki               = false
  is_template            = false
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false
  allow_auto_merge       = true
  delete_branch_on_merge = true
  has_downloads          = false
  vulnerability_alerts   = true
  allow_update_branch    = true
}


resource "github_repository_ruleset" "books-master-ruleset" {
  for_each    = local.books
  name        = "master"
  repository  = github_repository.books[each.key].name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true
    pull_request {

    }
    required_status_checks {
      strict_required_status_checks_policy = true
      required_check {
        context        = "build"
        integration_id = 15368
      }
      required_check {
        context        = "CodeQL"
        integration_id = 57789
      }
    }
    required_code_scanning {
      required_code_scanning_tool {
        alerts_threshold          = "errors"
        security_alerts_threshold = "high_or_higher"
        tool                      = "CodeQL"

      }
    }
  }
}
