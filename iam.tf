# Get the access to the effective Account ID in which Terraform is working.
data "aws_caller_identity" "current" {
}

# Allow the AWS Config role to deliver logs to configured S3 Bucket.
# Derived from IAM Policy document found at https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html
data "template_file" "aws_config_policy" {
  template = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "AWSConfigBucketPermissionsCheck",
        "Effect": "Allow",
        "Action": "s3:GetBucketAcl",
        "Resource": "$${bucket_arn}"
    },
    {
        "Sid": "AWSConfigBucketExistenceCheck",
        "Effect": "Allow",
        "Action": "s3:ListBucket",
        "Resource": "$${bucket_arn}"
    },
    {
        "Sid": "AWSConfigBucketDelivery",
        "Effect": "Allow",
        "Action": "s3:PutObject",
        "Resource": "$${resource}",
        "Condition": {
          "StringLike": {
            "s3:x-amz-acl": "bucket-owner-full-control"
          }
        }
    }
  ]
}
JSON

  vars = {
    bucket_arn = format("arn:%s:s3:::%s", data.aws_partition.current.partition, var.config_logs_bucket)
    resource = format(
      "arn:%s:s3:::%s%s%s/AWSLogs/%s/Config/*",
      data.aws_partition.current.partition,
      var.config_logs_bucket,
      var.config_logs_prefix == "" ? "" : "/",
      var.config_logs_prefix,
      data.aws_caller_identity.current.account_id,
    )
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

resource "aws_iam_role" "main" {
  name               = "${var.config_name}-role"
  assume_role_policy = data.aws_iam_policy_document.aws-config-role-policy.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "managed-policy" {
  role       = aws_iam_role.main.name
  policy_arn = format("arn:%s:iam::aws:policy/service-role/AWSConfigRole", data.aws_partition.current.partition)
}

resource "aws_iam_policy" "aws-config-policy" {
  name   = "${var.config_name}-policy"
  policy = data.template_file.aws_config_policy.rendered
}

resource "aws_iam_role_policy_attachment" "aws-config-policy" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.aws-config-policy.arn
}
