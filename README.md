# GitHub Actions Access

This [Terraform] module provides [GitHub Actions] workflows access to resources in an [AWS] account. It follows the procedure described in the [GitHub Docs](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services).

## Prerequisites

This module [imports](https://developer.hashicorp.com/terraform/language/import) a [GitHub] [OpenID Connect][OIDC] provider from [AWS], which means that provider must already be created before using this module. For instructions on how to do so, consult the [GitHub Docs](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-the-identity-provider-to-aws).

## Inputs

See [`variables.tf`](variables.tf).

## Outputs

See [`output.tf`](output.tf).

[AWS]: https://aws.amazon.com/
[GitHub]: https://github.com/
[GitHub Actions]: https://docs.github.com/en/actions
[OIDC]: https://openid.net/developers/how-connect-works/
[Terraform]: https://www.terraform.io/
