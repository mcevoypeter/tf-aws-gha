# [AWS] [IAM] Role for GitHub Actions

This [Terraform] module creates an [AWS] [IAM] role that [GitHub Actions] workflows can assume via the [configure-aws-credentials GitHub Action][aws-credentials-action] to access resources in an [AWS] account. It follows the procedure described in the [GitHub docs](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services).

## Prerequisites

This module [imports](https://developer.hashicorp.com/terraform/language/import) a [GitHub] [OpenID Connect][OIDC] provider from [AWS], which means that provider must already be created before using this module. For instructions on how to do so, consult the [GitHub docs](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-the-identity-provider-to-aws).

## Inputs

See [`variables.tf`](variables.tf).

## Outputs

See [`output.tf`](output.tf).

## Example

The following use of this module creates an [AWS] [IAM] role that [GitHub Actions] workflows in the `infra` [GitHub] repo owned by the [GitHub] user `mcevoypeter` can assume to receive full access to [Lambda] and [S3] resources and read access to [Secrets Manager] resources in the [AWS] account `012345678901`.

```terraform
module "example" {
  source          = "git@github.com:mcevoypeter/tf-aws-gha-access.git"
  account_id      = 012345678901
  gh_idp          = "arn:aws:iam::012345678901:oidc-provider/token.actions.githubusercontent.com"
  owner           = "mcevoypeter"
  repo            = "infra"
  branches        = ["main"]
  policy_arns     = [
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ]
  inline_policies = [
    {
      name = "SecretsManagerRead"
      policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = ["secretsmanager:GetSecretValue"]
            Resource = "arn:aws:secretsmanager:*"
          }
        ]
      })
    },
  ]
}
```

[AWS]: https://aws.amazon.com/
[aws-credentials-action]: https://github.com/aws-actions/configure-aws-credentials
[GitHub]: https://github.com/
[GitHub Actions]: https://docs.github.com/en/actions
[IAM]: https://aws.amazon.com/iam/
[Lambda]: https://aws.amazon.com/lambda/
[OIDC]: https://openid.net/developers/how-connect-works/
[S3]: https://aws.amazon.com/s3/
[Secrets Manager]: https://aws.amazon.com/secrets-manager/
[Terraform]: https://www.terraform.io/
