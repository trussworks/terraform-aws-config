<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Enables AWS Config and adds managed config rules with good defaults.

The following AWS Config Rules are supported:

* acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days.
* cloudtrail-enabled: Ensure CloudTrail is enabled.
* ec2-volume-inuse-check: Checks whether EBS volumes are attached to EC2 instances
* guardduty-enabled-centralized: Checks whether Amazon GuardDuty is enabled in your AWS account and region.
* iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements.
* iam-user-no-policies-check: Ensure that none of your IAM users have policies attached; IAM users must inherit permissions from IAM groups or roles.
* instances-in-vpc: Ensure all EC2 instances run in a VPC.
* root-account-mfa-enabled: Ensure root AWS account has MFA enabled.
* rds-storage-encrypted: Checks whether storage encryption is enabled for your RDS DB instances.
* s3-bucket-public-write-prohibited: Checks that your S3 buckets do not allow public write access.

## Usage

    module "aws_config" {
      source             = "trussworks/config/aws"
      config_logs_bucket = "my-aws-logs"
    }

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm\_days\_to\_expiration | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | string | `"14"` | no |
| aggregate\_organization | Aggregate compliance data by organization | string | `"false"` | no |
| check\_guard\_duty | Enable guardduty-enabled-centralized rule | string | `"false"` | no |
| check\_rds\_public\_access | Enable rds-instance-public-access-check rule | string | `"false"` | no |
| config\_aggregator\_name | The name of the aggregator. | string | `"organization"` | no |
| config\_delivery\_frequency | The frequency with which AWS Config delivers configuration snapshots. | string | `"Six_Hours"` | no |
| config\_logs\_bucket | The S3 bucket for AWS Config logs. | string | n/a | yes |
| config\_logs\_prefix | The S3 prefix for AWS Config logs. | string | `"config"` | no |
| config\_max\_execution\_frequency | The maximum frequency with which AWS Config runs evaluations for a rule. | string | `"TwentyFour_Hours"` | no |
| password\_max\_age | Number of days before password expiration. | string | `"90"` | no |
| password\_min\_length | Password minimum length. | string | `"14"` | no |
| password\_require\_lowercase | Require at least one lowercase character in password. | string | `"true"` | no |
| password\_require\_numbers | Require at least one number in password. | string | `"true"` | no |
| password\_require\_symbols | Require at least one symbol in password. | string | `"true"` | no |
| password\_require\_uppercase | Require at least one uppercase character in password. | string | `"true"` | no |
| password\_reuse\_prevention | Number of passwords before allowing reuse. | string | `"24"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
