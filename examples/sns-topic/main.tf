data "aws_partition" "current" {}

#
# AWS Config Logs Bucket
#

module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 9"

  s3_bucket_name     = var.config_logs_bucket
  region             = var.region
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
  name = var.config_name
}

resource "aws_sns_topic_policy" "config" {
  arn    = aws_sns_topic.config.arn
  policy = data.aws_iam_policy_document.config.json
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

  tags = {
    "Automation" = "Terraform"
    "Name"       = var.config_name
  }
}
