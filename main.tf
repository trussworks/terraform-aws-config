/**
 * Terraform module that sets up the AWS Config service and enables managed config rules
 *
 * The following AWS Config Rules are supported:
 *  * iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements
 *  * cloudtrail-enabled: Ensure CloudTrail is enabled
 *  * instances-in-vpc: Ensure all EC2 instances run in a VPC
 *  * root-account-mfa-enabled: Ensure root AWS account has MFA enabled
 *  * acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days
 *  * iam-user-no-policies-check: Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles
 *
 * Usage:
 *
 *     module "aws_config" {
 *       source         = "trussworks/aws_config"
 *       s3_bucket_name = "truss-aws-logs"
 *       region         = "us-west-2"
 *       expiration     = 90
 *     }
 *
 */

