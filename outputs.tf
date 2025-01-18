output "required_tags_rule_arn" {
  description = "The ARN of the required-tags config rule."
  value       = one(aws_config_config_rule.required-tags[*].arn)
}

output "aws_config_role_arn" {
  description = "The ARN of the AWS config role."
  value       = one(aws_iam_role.main[*].arn)
}

output "aws_config_role_name" {
  description = "The name of the IAM role used by AWS config"
  value       = one(aws_iam_role.main[*].name)
}
