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

resource "github_repository_ruleset" "np-complete-infra-master-ruleset" {
  name        = "master"
  repository  = github_repository.np-complete-infra.name
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
        context        = "tflint"
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

resource "github_repository" "publish-book-action" {
  name                   = "publish-book-action"
  description            = "github action to publish book"
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
