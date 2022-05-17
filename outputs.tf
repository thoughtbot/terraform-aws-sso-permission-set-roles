output "arns" {
  description = "ARNs for SSO-provisioned roles"
  value       = local.arns
}

output "arns_without_path" {
  description = "ARNs for SSO-provisioned roles without paths (for aws-auth)"
  value       = local.arns_without_path
}

output "by_name" {
  description = "Role ARN for each permission set name"
  value       = zipmap(local.names, local.arns)
}

output "by_name_without_path" {
  description = "Role ARN for each permission set name"
  value       = zipmap(local.names, local.arns_without_path)
}

output "names" {
  description = "Names of permission sets with provisioned roles"
  value       = local.names
}
