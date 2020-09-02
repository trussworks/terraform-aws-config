terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.0"
    }
  }
}
