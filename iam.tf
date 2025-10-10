# Get the access to the effective Account ID in which Terraform is working.
data "aws_caller_identity" "current" {
}

# Allow the AWS Config role to deliver logs to configured S3 Bucket.
# Derived from IAM Policy document found at https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html

data "aws_iam_policy_document" "aws_config_policy" {
  statement {
    sid    = "AWSConfigBucketPermissionsCheck"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl",
    ]
    resources = [
      format("arn:%s:s3:::%s", data.aws_partition.current.partition, var.config_logs_bucket)
    ]
  }

  dynamic "statement" {
    for_each = var.sns_kms_key_id != null ? [1] : []
    content {
      sid    = "AWSAllowKMSKeyUsage"
      effect = "Allow"
      actions = [
        "kms:Decrypt",
        "kms:GenerateDataKey*"
      ]
      resources = [var.sns_kms_key_id]
    }
  }

  dynamic "statement" {
    for_each = var.sns_kms_key_id != null ? [1] : []
    content {
      sid    = "AWSAllowSNSPublish"
      effect = "Allow"
      actions = [
        "sns:Publish"
      ]
      resources = [var.config_sns_topic_arn]
    }
  }

  statement {
    sid    = "AWSConfigBucketExistenceCheck"
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      format("arn:%s:s3:::%s", data.aws_partition.current.partition, var.config_logs_bucket)
    ]
  }
  statement {
    sid     = "AWSConfigBucketDelivery"
    effect  = "Allow"
    actions = ["s3:PutObject"]
    resources = [
      format("arn:%s:s3:::%s%s%s/AWSLogs/%s/Config/*",
        data.aws_partition.current.partition,
        var.config_logs_bucket,
        var.config_logs_prefix == "" ? "" : "/",
        var.config_logs_prefix,
        var.enable_multi_account_logs ? "*" : data.aws_caller_identity.current.account_id
      )
    ]
    condition {
      test     = "StringLike"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

# Allow IAM policy to assume the role for AWS Config
data "aws_iam_policy_document" "aws-config-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    effect = "Allow"
  }
}

#
# IAM
#

resource "aws_iam_service_linked_role" "main" {
  aws_service_name = "config.amazonaws.com"
  count            = var.enable_config_recorder ? 1 : 0
  tags             = var.tags
}
