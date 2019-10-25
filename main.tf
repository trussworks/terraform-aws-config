/**
 * Enables AWS Config and adds managed config rules with good defaults.
 *
 * The following AWS Config Rules are supported:
 *
 * * acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days.
 * * cloudtrail-enabled: Ensure CloudTrail is enabled.
 * * ec2-volume-inuse-check: Checks whether EBS volumes are attached to EC2 instances
 * * guardduty-enabled-centralized: Checks whether Amazon GuardDuty is enabled in your AWS account and region.
 * * iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements.
 * * iam-user-no-policies-check: Ensure that none of your IAM users have policies attached; IAM users must inherit permissions from IAM groups or roles.
 * * instances-in-vpc: Ensure all EC2 instances run in a VPC.
 * * root-account-mfa-enabled: Ensure root AWS account has MFA enabled.
 * * rds-storage-encrypted: Checks whether storage encryption is enabled for your RDS DB instances.
 * * s3-bucket-public-write-prohibited: Checks that your S3 buckets do not allow public write access.
 * * sns_topic_arn: The ARN of the SNS topic to send notifications to.
 *
 * ## Usage
 *
 * resource "aws_s3_bucket" "aws_config_logs" {
 *   bucket = "my-aws-config-logs"
 * }
 *
 * resource "aws_sns_topic" "aws_config_sns_topic" {
 *   name = "my-aws-config-sns-topic"
 * }
 *
 * module "aws_config_default_region" {
 *   source             = "trussworks/config/aws"
 *   config_logs_bucket = "${aws_s3_bucket.aws_config_logs.id}"
 *   sns_topic_arn      = "${aws_sns_topic.aws_config_sns_topic.arn}"
 * }
 *
 * provider "aws" {
 *   alias  = "us-east-1"
 *   region = "us-east-1"
 * }
 *
 * module "aws_config_us_east_1" {
 *   providers {
 *     aws = "aws.us-east-1"
 *   }
 *
 *   source             = "trussworks/config/aws"
 *   config_logs_bucket = "${aws_s3_bucket.aws_config_logs.id}"
 *   sns_topic_arn      = "${aws_sns_topic.aws_config_sns_topic.arn}
 * }
 *
 */

