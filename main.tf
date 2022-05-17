data "aws_iam_roles" "sso" {
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

locals {
  arns = data.aws_iam_roles.sso.arns

  arns_without_path = [
    for parts in [for arn in data.aws_iam_roles.sso.arns : split("/", arn)] :
    format("%s/%s", parts[0], element(parts, length(parts) - 1))
  ]

  names = [
    for parts in [for arn in local.arns : split("_", arn)] :
    join("_", slice(parts, 1, length(parts) - 1))
  ]
}
