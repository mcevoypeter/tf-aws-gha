terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

import {
  to = aws_iam_openid_connect_provider.this
  id = var.gh_idp_arn
}
