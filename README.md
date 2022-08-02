# AWS SSO Permission Set Roles

AWS SSO will create an IAM role in each account for each permission set, but the
role name includes a random string, making it difficult to refer to these roles
in IAM policies.

This module provides a map of each permission set by name to the role
provisioned for that permission set.

## Example

```
module "permission_set_roles" {
  source = "git@github.com:thoughtbot/terraform-aws-sso-permission-set-roles.git?ref=v0.2.0"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = [module.permission_set_roles.by_name.PowerUserAccess]
      type        = "AWS"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_roles.sso](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_roles) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arns"></a> [arns](#output\_arns) | ARNs for SSO-provisioned roles |
| <a name="output_arns_without_path"></a> [arns\_without\_path](#output\_arns\_without\_path) | ARNs for SSO-provisioned roles without paths (for aws-auth) |
| <a name="output_by_name"></a> [by\_name](#output\_by\_name) | Role ARN for each permission set name |
| <a name="output_by_name_without_path"></a> [by\_name\_without\_path](#output\_by\_name\_without\_path) | Role ARN for each permission set name |
| <a name="output_names"></a> [names](#output\_names) | Names of permission sets with provisioned roles |
<!-- END_TF_DOCS -->

## Contributing

Please see [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

This module is Copyright © 2022 Joe Ferris and thoughtbot. It is free
software, and may be redistributed under the terms specified in the [LICENSE]
file.

[LICENSE]: ./LICENSE

About thoughtbot
----------------

![thoughtbot](https://thoughtbot.com/brand_assets/93:44.svg)

This module is maintained and funded by thoughtbot, inc. The names and logos
for thoughtbot are trademarks of thoughtbot, inc.

We love open source software! See [our other projects][community] or [hire
us][hire] to design, develop, and grow your product.

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com/hire-us?utm_source=github
