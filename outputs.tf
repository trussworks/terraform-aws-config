output "role_arn" {
  value       = "${aws_iam_role.main.arn}"
  description = "The ARN of the IAM role used"
}
