terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.11.1"
    }
  }

  backend "s3" {
    bucket         = "masarakki-infra"
    key            = "terraform/np-complete-infra.fstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_locks"
  }
}
