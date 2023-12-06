data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${var.account_id}:oidc-provider/${var.gh_idp}"]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${var.gh_idp}:aud"
      values   = [var.gh_idp_aud]
    }
    condition {
      test     = "StringEquals"
      variable = "${var.gh_idp}:sub"
      values   = ["repo:${var.owner}/${var.repo}:environment:${var.environment}"]
    }
  }
}

resource "aws_iam_role" "this" {
  name                = "GitHubActions-${var.owner}-${var.repo}-${var.environment}"
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = var.policy_arns
  dynamic "inline_policy" {
    for_each = var.inline_policies
    content {
      name   = inline_policy.value["name"]
      policy = inline_policy.value["policy"]
    }
  }
}
