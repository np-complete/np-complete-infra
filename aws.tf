terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "masarakki-infra"
    key            = "terraform/np-complete-infra.fstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_locks"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
