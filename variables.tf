variable "account_id" {
  description = "AWS account ID"
  type        = number
}

variable "gh_idp" {
  description = "GitHub OIDC provider name"
  type        = string
  default     = "token.actions.githubusercontent.com"
}

variable "gh_idp_aud" {
  description = "GitHub OIDC provider audience"
  type        = string
  default     = "sts.amazonaws.com"
}

variable "owner" {
  description = "GitHub user that owns var.repo"
  type        = string
}

variable "repo" {
  description = "GitHub repository the GitHub Actions workflows are running in"
  type        = string
}

variable "branch_patterns" {
  description = "Git branch patterns that can access resources in var.account_id"
  type        = set(string)
}

variable "tag_patterns" {
  description = "Git tag patterns that can access resources in var.account_id"
  type        = set(string)
}

variable "policy_arns" {
  description = "ARNs of permissions policies to grant to GitHub Actions workflows"
  type        = set(string)
  default     = []
}

variable "inline_policies" {
  description = "Inline policies to grant to GitHub Actions workflows"
  # See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role#inline_policy.
  type    = set(object({ name = string, policy = string }))
  default = []
}
