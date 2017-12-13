Enables AWS Config and adds managed config rules with good defaults.

The following AWS Config Rules are supported:

* acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days.
* cloudtrail-enabled: Ensure CloudTrail is enabled.
* iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements.
* iam-user-no-policies-check: Ensure that none of your IAM users have policies attached; IAM users must inherit permissions from IAM groups or roles.
* instances-in-vpc: Ensure all EC2 instances run in a VPC.
* root-account-mfa-enabled: Ensure root AWS account has MFA enabled.

## Usage

    module "aws_config" {
      source             = "trussworks/aws/config"
      config_logs_bucket = "my-aws-logs"
    }



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm_days_to_expiration | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | string | `14` | no |
| config_delivery_frequency | The frequency with which AWS Config delivers configuration snapshots. | string | `Six_Hours` | no |
| config_logs_bucket | The S3 bucket for AWS Config logs. | string | - | yes |
| config_logs_prefix | The S3 prefix for AWS Config logs. | string | `config` | no |
| config_max_execution_frequency | The maximum frequency with which AWS Config runs evaluations for a rule. | string | `TwentyFour_Hours` | no |
| password_max_age | Number of days before password expiration. | string | `90` | no |
| password_min_length | Password minimum length. | string | `14` | no |
| password_require_lowercase | Require at least one lowercase character in password. | string | `true` | no |
| password_require_numbers | Require at least one number in password. | string | `true` | no |
| password_require_symbols | Require at least one symbol in password. | string | `true` | no |
| password_require_uppercase | Require at least one uppercase character in password. | string | `true` | no |
| password_reuse_prevention | Number of passwords before allowing reuse. | string | `24` | no |

