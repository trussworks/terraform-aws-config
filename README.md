# AWS Config Terraform module

Enables AWS Config and adds managed config rules with good defaults.

## Supported AWS Config Rules

### ACM

* acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days.

### AMI

* approved-amis-by-tag: Checks whether running instances are using specified AMIs.

### CloudTrail

* cloudtrail-enabled: Ensure CloudTrail is enabled.
* cloud-trail-encryption-enabled: Ensure CloudTrail is configured to use server side encryption (SSE) with AWS KMS or CMK encryption.
* cloud-trail-log-file-validation-enabled: Checks whether AWS CloudTrail creates a signed digest file with logs.
* multi-region-cloud-trail-enabled: Ensure that there is at least one multi-region AWS CloudTrail enabled.

### CloudWatch Logs

* cloudwatch-log-group-encryption: Ensure that CloudWatch Logs are encrypted.

### EC2

* ec2-encrypted-volumes: Evaluates whether EBS volumes that are in an attached state are encrypted.
* ec2-volume-inuse-check: Checks whether EBS volumes are attached to EC2 instances.
* ebs-snapshot-public-restorable-check: Checks whether Amazon Elastic Block Store snapshots are not publicly restorable.

### VPC

* eip-attached: Checks whether all EIP addresses that are allocated to a VPC are attached to EC2 or in-use ENIs.
* instances-in-vpc: Ensure all EC2 instances run in a VPC.
* vpc-default-security-group-closed: Checks that the default security group of any Amazon Virtual Private Cloud (VPC) does not allow inbound or outbound traffic.

### GuardDuty

* guardduty-enabled-centralized: Checks whether Amazon GuardDuty is enabled in your AWS account and region.

### IAM

* iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements.
* iam-user-no-policies-check: Ensure that none of your IAM users have policies attached; IAM users must inherit permissions from IAM groups or roles.
* iam-group-has-users-check: Checks whether IAM groups have at least one IAM user.
* root-account-mfa-enabled: Ensure root AWS account has MFA enabled.
* iam-root-access-key: Ensure root AWS account does not have Access Keys.

### Tagging

* required-tags: Checks if resources are deployed with configured tags.

### RDS

* rds-instance-public-access-check: Checks whether the Amazon Relational Database Service (RDS) instances are not publicly accessible.
* rds-snapshots-public-prohibited: Checks if Amazon Relational Database Service (Amazon RDS) snapshots are public.
* rds-storage-encrypted: Checks whether storage encryption is enabled for your RDS DB instances.

### S3

* s3-bucket-public-write-prohibited: Checks that your S3 buckets do not allow public write access.
* s3-bucket-ssl-requests-only: Checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL).

## Terraform Versions

Terraform 0.12. Pin module version to ~> 2.x Submit pull-requests to master branch.

Terraform 0.11. Pin module version to ~> 1.5.1. Submit pull-requests to terraform011 branch.

## Usage

**Note: This module sets up AWS IAM Roles and Policies, which are globally namespaced. If you plan to have multiple instances of AWS Config, make sure they have unique values for `config_name`.**

```hcl
module "aws_config" {
  source = "trussworks/config/aws"

  config_name        = "my-aws-config"
  config_logs_bucket = "my-aws-logs"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | >= 2.40.0 |
| template | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| acm\_days\_to\_expiration | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | `number` | `14` | no |
| aggregate\_organization | Aggregate compliance data by organization | `bool` | `false` | no |
| ami\_required\_tag\_key\_value | Tag/s key and value which AMI has to have in order to be compliant: Example: key1:value1,key2:value2 | `string` | `""` | no |
| check\_acm\_certificate\_expiration\_check | Enable acm-certificate-expiration-check rule | `bool` | `true` | no |
| check\_approved\_amis\_by\_tag | Enable approved-amis-by-tag rule | `bool` | `false` | no |
| check\_cloud\_trail\_encryption | Enable cloud-trail-encryption-enabled rule | `bool` | `false` | no |
| check\_cloud\_trail\_log\_file\_validation | Enable cloud-trail-log-file-validation-enabled rule | `bool` | `false` | no |
| check\_cloudtrail\_enabled | Enable cloudtrail-enabled rule | `bool` | `true` | no |
| check\_cloudwatch\_log\_group\_encrypted | Enable cloudwatch-log-group-encryption rule | `bool` | `true` | no |
| check\_ebs\_snapshot\_public\_restorable | Enable ebs-snapshot-public-restorable rule | `bool` | `true` | no |
| check\_ec2\_encrypted\_volumes | Enable ec2-encrypted-volumes rule | `bool` | `true` | no |
| check\_ec2\_volume\_inuse\_check | Enable ec2-volume-inuse-check rule | `bool` | `true` | no |
| check\_eip\_attached | Enable eip-attached rule | `bool` | `false` | no |
| check\_guard\_duty | Enable guardduty-enabled-centralized rule | `bool` | `false` | no |
| check\_iam\_group\_has\_users\_check | Enable iam-group-has-users-check rule | `bool` | `true` | no |
| check\_iam\_password\_policy | Enable iam-password-policy rule | `bool` | `true` | no |
| check\_iam\_root\_access\_key | Enable iam-root-access-key rule | `bool` | `true` | no |
| check\_iam\_user\_no\_policies\_check | Enable iam-user-no-policies-check rule | `bool` | `true` | no |
| check\_instances\_in\_vpc | Enable instances-in-vpc rule | `bool` | `true` | no |
| check\_multi\_region\_cloud\_trail | Enable multi-region-cloud-trail-enabled rule | `bool` | `false` | no |
| check\_rds\_public\_access | Enable rds-instance-public-access-check rule | `bool` | `false` | no |
| check\_rds\_snapshots\_public\_prohibited | Enable rds-snapshots-public-prohibited rule | `bool` | `true` | no |
| check\_rds\_storage\_encrypted | Enable rds-storage-encrypted rule | `bool` | `true` | no |
| check\_required\_tags | Enable required-tags rule | `bool` | `false` | no |
| check\_root\_account\_mfa\_enabled | Enable root-account-mfa-enabled rule | `bool` | `false` | no |
| check\_s3\_bucket\_public\_write\_prohibited | Enable s3-bucket-public-write-prohibited rule | `bool` | `true` | no |
| check\_s3\_bucket\_ssl\_requests\_only | Enable s3-bucket-ssl-requests-only rule | `bool` | `true` | no |
| check\_vpc\_default\_security\_group\_closed | Enable vpc-default-security-group-closed rule | `bool` | `true` | no |
| config\_aggregator\_name | The name of the aggregator. | `string` | `"organization"` | no |
| config\_delivery\_frequency | The frequency with which AWS Config delivers configuration snapshots. | `string` | `"Six_Hours"` | no |
| config\_logs\_bucket | The S3 bucket for AWS Config logs. | `string` | n/a | yes |
| config\_logs\_prefix | The S3 prefix for AWS Config logs. | `string` | `"config"` | no |
| config\_max\_execution\_frequency | The maximum frequency with which AWS Config runs evaluations for a rule. | `string` | `"TwentyFour_Hours"` | no |
| config\_name | The name of the AWS Config instance. | `string` | `"aws-config"` | no |
| password\_max\_age | Number of days before password expiration. | `number` | `90` | no |
| password\_min\_length | Password minimum length. | `number` | `14` | no |
| password\_require\_lowercase | Require at least one lowercase character in password. | `bool` | `true` | no |
| password\_require\_numbers | Require at least one number in password. | `bool` | `true` | no |
| password\_require\_symbols | Require at least one symbol in password. | `bool` | `true` | no |
| password\_require\_uppercase | Require at least one uppercase character in password. | `bool` | `true` | no |
| password\_reuse\_prevention | Number of passwords before allowing reuse. | `number` | `24` | no |
| required\_tags | A map of required resource tags. Format is tagNKey, tagNValue, where N is int. Values are optional. | `map(string)` | `{}` | no |
| required\_tags\_resource\_types | Resource types to check for tags. | `list(string)` | `[]` | no |
| tags | tags to apply to the creates resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_config\_role\_arn | The ARN of the AWS config role. |
| required\_tags\_rule\_arn | The ARN of the required-tags config rule. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Upgrade Paths

### Upgrading from 2.3.0 to 2.4.x

Version 2.4.0 changed how AWS Config IAM polcies would be attached to IAM roles. When applying the upgrade, you will likely see a race condition resulting in the following error

```text
Error: Provider produced inconsistent result after apply
```

A second `terraform apply` should resolve the issue.


## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
```

### Testing

[Terratest](https://github.com/gruntwork-io/terratest) is being used for
automated testing with this module. Tests in the `test` folder can be run
locally by running the following command:

```shell
make test
```

Or with aws-vault:

```shell
AWS_VAULT_KEYCHAIN_NAME=<NAME> aws-vault exec <PROFILE> -- make test
```
