output "required_tags_rule_arn" {
  description = "The ARN of the required-tags config rule."
  value       = concat(aws_config_config_rule.required-tags.*.arn, [""])[0]
}

output "aws_config_role_arn" {
  description = "The ARN of the AWS config role."
  value       = aws_iam_role.main.arn
}

output "aws_config_role_name" {
  description = "The name of the IAM role used by AWS config"
  value       = aws_iam_role.main.name
}
