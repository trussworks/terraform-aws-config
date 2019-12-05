output "required_tags_rule_arn" {
  description = "The ARN of the required-tags config rule."
  value       = concat(aws_config_config_rule.required-tags.*.arn, [""])[0]
}

