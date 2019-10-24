# Get the access to the effective Account ID in which Terraform is working.
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

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
    bucket_arn = "${format("arn:aws:s3:::%s", var.config_logs_bucket)}"
    resource   = "${format("arn:aws:s3:::%s/%s/AWSLogs/%s/Config/*", var.config_logs_bucket, var.config_logs_prefix, data.aws_caller_identity.current.account_id)}"
  }
}

# Allow IAM policy to assume the role for AWS Config
data "aws_iam_policy_document" "aws_config_role_policy" {
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
  name = "aws-config-${data.aws_region.current.name}-role"
  assume_role_policy = "${data.aws_iam_policy_document.aws_config_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "managed_policy" {
  role       = "${aws_iam_role.main.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_policy" "aws_config_policy" {
  name   = "aws-config-${data.aws_region.current.name}-policy"
  policy = "${data.template_file.aws_config_policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "aws_config_policy" {
  role       = "${aws_iam_role.main.name}"
  policy_arn = "${aws_iam_policy.aws_config_policy.arn}"
}

data "aws_iam_policy_document" "allow_sns_publish" {
  count = "${var.sns_topic_arn == "" ? 0 : 1}"

  statement {
    actions   = ["sns:Publish"]
    resources = ["${var.sns_topic_arn}"]
  }
}

resource "aws_iam_policy" "allow_sns_publish" {
  count  = "${var.sns_topic_arn == "" ? 0 : 1}"
  name   = "aws-config-${data.aws_region.current.name}-sns"
  policy = "${data.aws_iam_policy_document.allow_sns_publish.json}"
}

resource "aws_iam_role_policy_attachment" "allows_sns_publish" {
  count      = "${var.sns_topic_arn == "" ? 0 : 1}"
  policy_arn = "${aws_iam_policy.allow_sns_publish.arn}"
  role       = "${aws_iam_role.main.name}"
}
