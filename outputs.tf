output "required_tags_rule_arn" {
  description = "The ARN of the required-tags config rule."
  value       = concat(aws_config_config_rule.required-tags.*.arn, [""])[0]
}

output "aws_config_role_arn" {
  description = "The ARN of the AWS config IAM role."
  value       = aws_iam_role.main.arn
}
