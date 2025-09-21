plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.43.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_required_version" {
  enabled = false
}
