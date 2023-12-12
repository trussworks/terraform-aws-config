data "aws_partition" "current" {}

#
# AWS Config Logs Bucket
#

module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 10"

  s3_bucket_name     = var.config_logs_bucket
  allow_config       = true
  config_logs_prefix = "config"
  force_destroy      = true
}

#
# SNS Topic
#

data "aws_iam_policy_document" "config" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [module.config.aws_config_role_arn]
    }
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.config.arn]
  }
}

resource "aws_sns_topic" "config" {
  name              = var.config_name
  kms_master_key_id = module.sns_key.key_arn
}

resource "aws_sns_topic_policy" "config" {
  arn    = aws_sns_topic.config.arn
  policy = data.aws_iam_policy_document.config.json
}

#
# KMS Key for SNS
#
module "sns_key" {
  source      = "terraform-aws-modules/kms/aws"
  version     = "~> 1.5.0"
  description = "Key for SNS usage"
  key_usage   = "ENCRYPT_DECRYPT"

  # Policy
  key_users = [module.config.aws_config_role_arn]

  # Aliases
  aliases = ["theydo/sns"]
}

#
# AWS Config
#

module "config" {
  source = "../../"

  config_name          = var.config_name
  config_logs_bucket   = module.config_logs.aws_logs_bucket
  config_logs_prefix   = "config"
  config_sns_topic_arn = aws_sns_topic.config.arn
  sns_kms_key_id       = module.sns_key.key_arn

  tags = {
    "Automation" = "Terraform"
    "Name"       = var.config_name
  }
}
