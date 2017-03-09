Terraform module that sets up the AWS Config service and enables managed config rules

The following AWS Config Rules are supported:
 * iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements
 * cloudtrail-enabled: Ensure CloudTrail is enabled
 * instances-in-vpc: Ensure all EC2 instances run in a VPC
 * root-account-mfa-enabled: Ensure root AWS account has MFA enabled
 * acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days
 * iam-user-no-policies-check: Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles

Usage:

    module "aws_config" {
      source         = "../modules/aws_config"
      s3_bucket_name = "truss-aws-logs"
      region         = "us-west-2"
      expiration     = 90
    }



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm_days_to_expiration | Specify the number of days before the rule flags the ACM Certificate as noncompliant | string | `15` | no |
| config_delivery_frequency | The frequency with which AWS Config delivers configuration snapshots | string | `Six_Hours` | no |
| config_logs_prefix | The S3 prefix for AWS Config logs | string | `config` | no |
| config_max_execution_frequency | The maximum frequency with which AWS Config runs evaluations for a rule | string | `TwentyFour_Hours` | no |
| password_min_length | Password minimum length | string | `12` | no |
| password_require_lowercase | Require at least one lowercase character in password | string | `true` | no |
| password_require_numbers | Require at least one number in password | string | `true` | no |
| password_require_symbols | Require at least one symbol in password | string | `true` | no |
| password_require_uppercase | Require at least one uppercase character in password | string | `true` | no |
| password_reuse_prevention | Number of passwords before allowing reuse | string | `1` | no |
| region | The region where the AWS S3 bucket will be created | string | - | yes |
| s3_bucket_name | The name of the s3 bucket that will be used for AWS logs | string | - | yes |

