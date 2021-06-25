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

Terraform 0.13 and newer. Pin module version to ~> 4.x. Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 3.0. Submit pull-requests to terraform012 branch.

## Usage

**Note: This module sets up AWS IAM Roles and Policies, which are globally namespaced. If you plan to have multiple instances of AWS Config, make sure they have unique values for `config_name`.**

**Note: If you use this module in multiple regions, be sure to disable duplicative checks and global resource types.**

```hcl
module "aws_config" {
  source = "trussworks/config/aws"

  config_name        = "my-aws-config"
  config_logs_bucket = "my-aws-logs"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70 |
| <a name="provider_template"></a> [template](#provider\_template) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_config_rule.acm-certificate-expiration-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.approved-amis-by-tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud-trail-encryption-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud-trail-log-file-validation-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudtrail-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudwatch_log_group_encrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ebs_snapshot_public_restorable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-encrypted-volumes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-imdsv2-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-volume-inuse-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.eip_attached](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.guardduty-enabled-centralized](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-group-has-users-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-password-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-user-no-policies-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam_root_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.instances-in-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.mfa_enabled_for_iam_console_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.multi-region-cloud-trail-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-instance-public-access-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-snapshots-public-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-storage-encrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.required-tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.restricted_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.root-account-mfa-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3-bucket-public-write-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3_bucket_ssl_requests_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.vpc_default_security_group_closed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_configuration_aggregator.organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_aggregator) | resource |
| [aws_config_configuration_recorder.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_policy.aws-config-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.aggregator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aggregator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws-config-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.managed-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.aws-config-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_config_aggregator_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [template_file.aws_config_acm_certificate_expiration](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.aws_config_ami_approved_tag](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.aws_config_iam_password_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.aws_config_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_days_to_expiration"></a> [acm\_days\_to\_expiration](#input\_acm\_days\_to\_expiration) | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | `number` | `14` | no |
| <a name="input_aggregate_organization"></a> [aggregate\_organization](#input\_aggregate\_organization) | Aggregate compliance data by organization | `bool` | `false` | no |
| <a name="input_ami_required_tag_key_value"></a> [ami\_required\_tag\_key\_value](#input\_ami\_required\_tag\_key\_value) | Tag/s key and value which AMI has to have in order to be compliant: Example: key1:value1,key2:value2 | `string` | `""` | no |
| <a name="input_check_acm_certificate_expiration_check"></a> [check\_acm\_certificate\_expiration\_check](#input\_check\_acm\_certificate\_expiration\_check) | Enable acm-certificate-expiration-check rule | `bool` | `true` | no |
| <a name="input_check_approved_amis_by_tag"></a> [check\_approved\_amis\_by\_tag](#input\_check\_approved\_amis\_by\_tag) | Enable approved-amis-by-tag rule | `bool` | `false` | no |
| <a name="input_check_cloud_trail_encryption"></a> [check\_cloud\_trail\_encryption](#input\_check\_cloud\_trail\_encryption) | Enable cloud-trail-encryption-enabled rule | `bool` | `false` | no |
| <a name="input_check_cloud_trail_log_file_validation"></a> [check\_cloud\_trail\_log\_file\_validation](#input\_check\_cloud\_trail\_log\_file\_validation) | Enable cloud-trail-log-file-validation-enabled rule | `bool` | `false` | no |
| <a name="input_check_cloudtrail_enabled"></a> [check\_cloudtrail\_enabled](#input\_check\_cloudtrail\_enabled) | Enable cloudtrail-enabled rule | `bool` | `true` | no |
| <a name="input_check_cloudwatch_log_group_encrypted"></a> [check\_cloudwatch\_log\_group\_encrypted](#input\_check\_cloudwatch\_log\_group\_encrypted) | Enable cloudwatch-log-group-encryption rule | `bool` | `true` | no |
| <a name="input_check_ebs_snapshot_public_restorable"></a> [check\_ebs\_snapshot\_public\_restorable](#input\_check\_ebs\_snapshot\_public\_restorable) | Enable ebs-snapshot-public-restorable rule | `bool` | `true` | no |
| <a name="input_check_ec2_encrypted_volumes"></a> [check\_ec2\_encrypted\_volumes](#input\_check\_ec2\_encrypted\_volumes) | Enable ec2-encrypted-volumes rule | `bool` | `true` | no |
| <a name="input_check_ec2_imdsv2"></a> [check\_ec2\_imdsv2](#input\_check\_ec2\_imdsv2) | Enable IMDSv2 rule | `bool` | `false` | no |
| <a name="input_check_ec2_volume_inuse_check"></a> [check\_ec2\_volume\_inuse\_check](#input\_check\_ec2\_volume\_inuse\_check) | Enable ec2-volume-inuse-check rule | `bool` | `true` | no |
| <a name="input_check_eip_attached"></a> [check\_eip\_attached](#input\_check\_eip\_attached) | Enable eip-attached rule | `bool` | `false` | no |
| <a name="input_check_guard_duty"></a> [check\_guard\_duty](#input\_check\_guard\_duty) | Enable guardduty-enabled-centralized rule | `bool` | `false` | no |
| <a name="input_check_iam_group_has_users_check"></a> [check\_iam\_group\_has\_users\_check](#input\_check\_iam\_group\_has\_users\_check) | Enable iam-group-has-users-check rule | `bool` | `true` | no |
| <a name="input_check_iam_password_policy"></a> [check\_iam\_password\_policy](#input\_check\_iam\_password\_policy) | Enable iam-password-policy rule | `bool` | `true` | no |
| <a name="input_check_iam_root_access_key"></a> [check\_iam\_root\_access\_key](#input\_check\_iam\_root\_access\_key) | Enable iam-root-access-key rule | `bool` | `true` | no |
| <a name="input_check_iam_user_no_policies_check"></a> [check\_iam\_user\_no\_policies\_check](#input\_check\_iam\_user\_no\_policies\_check) | Enable iam-user-no-policies-check rule | `bool` | `true` | no |
| <a name="input_check_instances_in_vpc"></a> [check\_instances\_in\_vpc](#input\_check\_instances\_in\_vpc) | Enable instances-in-vpc rule | `bool` | `true` | no |
| <a name="input_check_mfa_enabled_for_iam_console_access"></a> [check\_mfa\_enabled\_for\_iam\_console\_access](#input\_check\_mfa\_enabled\_for\_iam\_console\_access) | Enable mfa-enabled-for-iam-console-access rule | `bool` | `false` | no |
| <a name="input_check_multi_region_cloud_trail"></a> [check\_multi\_region\_cloud\_trail](#input\_check\_multi\_region\_cloud\_trail) | Enable multi-region-cloud-trail-enabled rule | `bool` | `false` | no |
| <a name="input_check_rds_public_access"></a> [check\_rds\_public\_access](#input\_check\_rds\_public\_access) | Enable rds-instance-public-access-check rule | `bool` | `false` | no |
| <a name="input_check_rds_snapshots_public_prohibited"></a> [check\_rds\_snapshots\_public\_prohibited](#input\_check\_rds\_snapshots\_public\_prohibited) | Enable rds-snapshots-public-prohibited rule | `bool` | `true` | no |
| <a name="input_check_rds_storage_encrypted"></a> [check\_rds\_storage\_encrypted](#input\_check\_rds\_storage\_encrypted) | Enable rds-storage-encrypted rule | `bool` | `true` | no |
| <a name="input_check_required_tags"></a> [check\_required\_tags](#input\_check\_required\_tags) | Enable required-tags rule | `bool` | `false` | no |
| <a name="input_check_restricted_ssh"></a> [check\_restricted\_ssh](#input\_check\_restricted\_ssh) | Enable restricted-ssh rule | `bool` | `false` | no |
| <a name="input_check_root_account_mfa_enabled"></a> [check\_root\_account\_mfa\_enabled](#input\_check\_root\_account\_mfa\_enabled) | Enable root-account-mfa-enabled rule | `bool` | `false` | no |
| <a name="input_check_s3_bucket_public_write_prohibited"></a> [check\_s3\_bucket\_public\_write\_prohibited](#input\_check\_s3\_bucket\_public\_write\_prohibited) | Enable s3-bucket-public-write-prohibited rule | `bool` | `true` | no |
| <a name="input_check_s3_bucket_ssl_requests_only"></a> [check\_s3\_bucket\_ssl\_requests\_only](#input\_check\_s3\_bucket\_ssl\_requests\_only) | Enable s3-bucket-ssl-requests-only rule | `bool` | `true` | no |
| <a name="input_check_vpc_default_security_group_closed"></a> [check\_vpc\_default\_security\_group\_closed](#input\_check\_vpc\_default\_security\_group\_closed) | Enable vpc-default-security-group-closed rule | `bool` | `true` | no |
| <a name="input_config_aggregator_name"></a> [config\_aggregator\_name](#input\_config\_aggregator\_name) | The name of the aggregator. | `string` | `"organization"` | no |
| <a name="input_config_delivery_frequency"></a> [config\_delivery\_frequency](#input\_config\_delivery\_frequency) | The frequency with which AWS Config delivers configuration snapshots. | `string` | `"Six_Hours"` | no |
| <a name="input_config_logs_bucket"></a> [config\_logs\_bucket](#input\_config\_logs\_bucket) | The S3 bucket for AWS Config logs. If you have set enable\_config\_recorder to false then this can be an empty string. | `string` | n/a | yes |
| <a name="input_config_logs_prefix"></a> [config\_logs\_prefix](#input\_config\_logs\_prefix) | The S3 prefix for AWS Config logs. | `string` | `"config"` | no |
| <a name="input_config_max_execution_frequency"></a> [config\_max\_execution\_frequency](#input\_config\_max\_execution\_frequency) | The maximum frequency with which AWS Config runs evaluations for a rule. | `string` | `"TwentyFour_Hours"` | no |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | The name of the AWS Config instance. | `string` | `"aws-config"` | no |
| <a name="input_config_sns_topic_arn"></a> [config\_sns\_topic\_arn](#input\_config\_sns\_topic\_arn) | An SNS topic to stream configuration changes and notifications to. | `string` | `null` | no |
| <a name="input_enable_config_recorder"></a> [enable\_config\_recorder](#input\_enable\_config\_recorder) | Enables configuring the AWS Config recorder resources in this module. | `bool` | `true` | no |
| <a name="input_include_global_resource_types"></a> [include\_global\_resource\_types](#input\_include\_global\_resource\_types) | Specifies whether AWS Config includes all supported types of global resources with the resources that it records. | `bool` | `true` | no |
| <a name="input_password_max_age"></a> [password\_max\_age](#input\_password\_max\_age) | Number of days before password expiration. | `number` | `90` | no |
| <a name="input_password_min_length"></a> [password\_min\_length](#input\_password\_min\_length) | Password minimum length. | `number` | `14` | no |
| <a name="input_password_require_lowercase"></a> [password\_require\_lowercase](#input\_password\_require\_lowercase) | Require at least one lowercase character in password. | `bool` | `true` | no |
| <a name="input_password_require_numbers"></a> [password\_require\_numbers](#input\_password\_require\_numbers) | Require at least one number in password. | `bool` | `true` | no |
| <a name="input_password_require_symbols"></a> [password\_require\_symbols](#input\_password\_require\_symbols) | Require at least one symbol in password. | `bool` | `true` | no |
| <a name="input_password_require_uppercase"></a> [password\_require\_uppercase](#input\_password\_require\_uppercase) | Require at least one uppercase character in password. | `bool` | `true` | no |
| <a name="input_password_reuse_prevention"></a> [password\_reuse\_prevention](#input\_password\_reuse\_prevention) | Number of passwords before allowing reuse. | `number` | `24` | no |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | A map of required resource tags. Format is tagNKey, tagNValue, where N is int. Values are optional. | `map(string)` | `{}` | no |
| <a name="input_required_tags_resource_types"></a> [required\_tags\_resource\_types](#input\_required\_tags\_resource\_types) | Resource types to check for tags. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to AWS Config resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_config_role_arn"></a> [aws\_config\_role\_arn](#output\_aws\_config\_role\_arn) | The ARN of the AWS config role. |
| <a name="output_aws_config_role_name"></a> [aws\_config\_role\_name](#output\_aws\_config\_role\_name) | The name of the IAM role used by AWS config |
| <a name="output_required_tags_rule_arn"></a> [required\_tags\_rule\_arn](#output\_required\_tags\_rule\_arn) | The ARN of the required-tags config rule. |
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
