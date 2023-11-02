variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "gh_idp_arn" {
  description = "GitHub OpenID Connect (OIDC) provider ARN"
  type        = string
}
