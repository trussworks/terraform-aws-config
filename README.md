# AWS Config Terraform module

Enables AWS Config and adds managed config rules with good defaults.

## Supported AWS Config Rules

### ACM

- acm-certificate-expiration-check: Ensure ACM Certificates in your account are marked for expiration within the specified number of days.

### AMI

- approved-amis-by-tag: Checks whether running instances are using specified AMIs.

### CloudTrail

- cloudtrail-enabled: Ensure CloudTrail is enabled.
- cloud-trail-encryption-enabled: Ensure CloudTrail is configured to use server side encryption (SSE) with AWS KMS or CMK encryption.
- cloud-trail-log-file-validation-enabled: Checks whether AWS CloudTrail creates a signed digest file with logs.
- multi-region-cloud-trail-enabled: Ensure that there is at least one multi-region AWS CloudTrail enabled.
- cloud-trail-cloud-watch-logs-enabled: Checks whether AWS CloudTrail trails are configured to send logs to Amazon CloudWatch logs.

### CloudWatch Logs

- cloudwatch-log-group-encrypted: Ensure that CloudWatch Logs are encrypted.
- cw-loggroup-retention-period-check: Checks whether Amazon CloudWatch LogGroup retention period is set to specific number of days.

### DynamoDB

- dynamodb-table-encryption-enabled: Checks if the Amazon DynamoDB tables are encrypted and checks their status. The rule is COMPLIANT if the status is enabled or enabling. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/dynamodb-table-encryption-enabled.html)
- dynamodb-table-encrypted-kms: Checks if Amazon DynamoDB table is encrypted with AWS Key Management Service (KMS)

### EC2

- ec2-encrypted-volumes: Evaluates whether EBS volumes that are in an attached state are encrypted.
- ec2-volume-inuse-check: Checks whether EBS volumes are attached to EC2 instances.
- ebs-snapshot-public-restorable-check: Checks whether Amazon Elastic Block Store snapshots are not publicly restorable.

### ECR

- ecr-private-image-scanning-enabled: Checks if a private Amazon Elastic Container Registry (ECR) repository has image scanning enabled. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecr-private-image-scanning-enabled.html)
- ecr-private-lifecycle-policy-configured: Checks if a private Amazon Elastic Container Registry (ECR) repository has at least one lifecycle policy configured. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecr-private-lifecycle-policy-configured.html)

### ECS

- ecs-awsvpc-networking-enabled: Checks if the networking mode for active ECSTaskDefinitions is set to ‘awsvpc’. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecs-awsvpc-networking-enabled.html)
- ecs-containers-nonprivileged: Checks if the privileged parameter in the container definition of ECSTaskDefinitions is set to ‘true’. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecs-containers-nonprivileged.html)
- ecs-containers-readonly-access: Checks if Amazon Elastic Container Service (Amazon ECS) Containers only have read-only access to its root filesystems. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecs-containers-readonly-access.html)
- ecs-no-environment-secrets: Checks if secrets are passed as container environment variables. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/ecs-no-environment-secrets.html)

### EFS

- efs-encrypted-check: Checks if Amazon Elastic File System is configured to encrypt file data using AWS Key Management Service.

### ELB

- elb-logging-enabled: Checks if the Application Load Balancer and the Classic Load Balancer have logging enabled.
- elb-deletion-protection-enabled: Checks if Elastic Load Balancing has deletion protection enabled.

### VPC

- eip-attached: Checks whether all EIP addresses that are allocated to a VPC are attached to EC2 or in-use ENIs.
- instances-in-vpc: Ensure all EC2 instances run in a VPC.
- vpc-default-security-group-closed: Checks that the default security group of any Amazon Virtual Private Cloud (VPC) does not allow inbound or outbound traffic.
- vpc-sg-open-only-to-authorized-ports: Checks whether any security groups with inbound 0.0.0.0/0 have TCP or UDP ports accessible.

### GuardDuty

- guardduty-enabled-centralized: Checks whether Amazon GuardDuty is enabled in your AWS account and region.

### IAM

- iam-password-policy: Ensure the account password policy for IAM users meets the specified requirements.
- iam-user-no-policies-check: Ensure that none of your IAM users have policies attached; IAM users must inherit permissions from IAM groups or roles.
- iam-group-has-users-check: Checks whether IAM groups have at least one IAM user.
- root-account-mfa-enabled: Ensure root AWS account has MFA enabled.
- iam-root-access-key: Ensure root AWS account does not have Access Keys.
- mfa_enabled_for_iam_console_access: Checks whether AWS Multi-Factor Authentication (MFA) is enabled for all AWS Identity and Access Management (IAM) users that use a console password.
- iam-policy-no-statements-with-admin-access: Checks the IAM policies that you create for Allow statements that grant permissions to all actions on all resources.
- iam-policy-no-statements-with-full-access: Checks if AWS Identity and Access Management (IAM) policies grant permissions to all actions on individual AWS resources. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/iam-policy-no-statements-with-full-access.html)

### Misc Security

- restricted-ssh: Checks whether security groups that are in use disallow unrestricted incoming SSH traffic.
- access_keys_rotated: Checks if the active access keys are rotated within the number of days specified in maxAccessKeyAge.
- cmk_backing_key_rotation_enabled: Checks if automatic key rotation is enabled for every AWS Key Management Service customer managed symmetric encryption key.
- nacl-no-unrestricted-ssh-rdp: Checks if default ports for SSH/RDP ingress traffic for network access control lists (NACLs) is unrestricted. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/nacl-no-unrestricted-ssh-rdp.html)
- internet-gateway-authorized-vpc-only: Checks that Internet gateways (IGWs) are only attached to an authorized Amazon Virtual Private Cloud (VPCs).

### Tagging

- required-tags: Checks if resources are deployed with configured tags.

### RDS

- rds-instance-public-access-check: Checks whether the Amazon Relational Database Service (RDS) instances are not publicly accessible.
- rds-snapshots-public-prohibited: Checks if Amazon Relational Database Service (Amazon RDS) snapshots are public.
- rds-storage-encrypted: Checks whether storage encryption is enabled for your RDS DB instances.
- rds-snapshot-encrypted: Checks whether Amazon Relational Database Service (Amazon RDS) DB snapshots are encrypted.
- rds-cluster-deletion-protection-enabled: Checks if an Amazon Relational Database Service (Amazon RDS) cluster has deletion protection enabled. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/rds-cluster-deletion-protection-enabled.html)
- db-instance-backup-enabled: Checks if RDS DB instances have backups enabled.

### S3

- s3-bucket-public-write-prohibited: Checks that your S3 buckets do not allow public write access.
- s3-bucket-ssl-requests-only: Checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL).
- s3-bucket-level-public-access-prohibited: Checks if Amazon Simple Storage Service (Amazon S3) buckets are publicly accessible. [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-level-public-access-prohibited.html)
- s3-bucket-acl-prohibited: Checks if Amazon Simple Storage Service (Amazon S3) Buckets allow user permissions through access control lists (ACLs). [_Not supported in all regions_](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-acl-prohibited.html)
- s3-bucket-server-side-encryption-enabled: Checks if S3 bucket either has the S3 default encryption enabled or that S3 policy explicitly denies put-object requests without SSE that uses AES-256 or AWS KMS.

## Terraform Versions

Terraform 0.13 and newer. Pin module version to ~> 4.x. Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 3.0. Submit pull-requests to terraform012 branch.

## Usage

**Note: This module sets up AWS IAM Roles and Policies, which are globally namespaced. If you plan to have multiple instances of AWS Config, make sure they have unique values for `config_name`.**

**Note: If you use this module in multiple regions, be sure to disable duplicate checks and global resource types.**

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_config_config_rule.access_keys_rotated](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.acm-certificate-expiration-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.approved-amis-by-tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud-trail-cloud-watch-logs-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud-trail-encryption-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud-trail-log-file-validation-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudtrail-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudwatch_log_group_encrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cmk_backing_key_rotation_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cw-loggroup-retention-period-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.db-instance-backup-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.dynamodb-table-encrypted-kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.dynamodb-table-encryption-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ebs_snapshot_public_restorable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-encrypted-volumes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-imdsv2-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ec2-volume-inuse-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecr-private-image-scanning-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecr-private-lifecycle-policy-configured](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecs-awsvpc-networking-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecs-containers-nonprivileged](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecs-containers-readonly-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.ecs-no-environment-secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.efs-encrypted-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.eip_attached](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.elb-deletion-protection-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.elb-logging-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.guardduty-enabled-centralized](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-group-has-users-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-password-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-policy-no-statements-with-admin-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-policy-no-statements-with-full-access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam-user-no-policies-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.iam_root_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.instances-in-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.internet-gateway-authorized-vpc-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.mfa_enabled_for_iam_console_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.multi-region-cloud-trail-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.nacl-no-unrestricted-ssh-rdp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-cluster-deletion-protection-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-instance-public-access-check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-snapshot-encrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-snapshots-public-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.rds-storage-encrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.required-tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.restricted_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.root-account-mfa-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3-bucket-acl-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3-bucket-level-public-access-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3-bucket-public-write-prohibited](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3-bucket-server-side-encryption-enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.s3_bucket_ssl_requests_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.vpc-sg-open-only-to-authorized-ports](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
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
| [aws_iam_policy_document.aws_config_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_max_age"></a> [access\_key\_max\_age](#input\_access\_key\_max\_age) | Maximum number of days without rotation. | `number` | `90` | no |
| <a name="input_acm_days_to_expiration"></a> [acm\_days\_to\_expiration](#input\_acm\_days\_to\_expiration) | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | `number` | `14` | no |
| <a name="input_aggregate_organization"></a> [aggregate\_organization](#input\_aggregate\_organization) | Aggregate compliance data by organization | `bool` | `false` | no |
| <a name="input_ami_required_tag_key_value"></a> [ami\_required\_tag\_key\_value](#input\_ami\_required\_tag\_key\_value) | Tag/s key and value which AMI has to have in order to be compliant: Example: key1:value1,key2:value2 | `string` | `""` | no |
| <a name="input_authorized_vpc_ids"></a> [authorized\_vpc\_ids](#input\_authorized\_vpc\_ids) | Comma-separated list of the authorized VPC IDs with attached IGWs. If parameter is not provided all attached IGWs will be NON\_COMPLIANT. | `string` | `"example,CSV"` | no |
| <a name="input_check_access_keys_rotated"></a> [check\_access\_keys\_rotated](#input\_check\_access\_keys\_rotated) | Enable access-keys-rotated rule | `bool` | `true` | no |
| <a name="input_check_acm_certificate_expiration_check"></a> [check\_acm\_certificate\_expiration\_check](#input\_check\_acm\_certificate\_expiration\_check) | Enable acm-certificate-expiration-check rule | `bool` | `true` | no |
| <a name="input_check_approved_amis_by_tag"></a> [check\_approved\_amis\_by\_tag](#input\_check\_approved\_amis\_by\_tag) | Enable approved-amis-by-tag rule | `bool` | `false` | no |
| <a name="input_check_cloud_trail_encryption"></a> [check\_cloud\_trail\_encryption](#input\_check\_cloud\_trail\_encryption) | Enable cloud-trail-encryption-enabled rule | `bool` | `false` | no |
| <a name="input_check_cloud_trail_log_file_validation"></a> [check\_cloud\_trail\_log\_file\_validation](#input\_check\_cloud\_trail\_log\_file\_validation) | Enable cloud-trail-log-file-validation-enabled rule | `bool` | `false` | no |
| <a name="input_check_cloudtrail_enabled"></a> [check\_cloudtrail\_enabled](#input\_check\_cloudtrail\_enabled) | Enable cloudtrail-enabled rule | `bool` | `true` | no |
| <a name="input_check_cloudwatch_log_group_encrypted"></a> [check\_cloudwatch\_log\_group\_encrypted](#input\_check\_cloudwatch\_log\_group\_encrypted) | Enable cloudwatch-log-group-encryption rule | `bool` | `true` | no |
| <a name="input_check_cmk_backing_key_rotated"></a> [check\_cmk\_backing\_key\_rotated](#input\_check\_cmk\_backing\_key\_rotated) | Enable cmk\_backing\_key\_rotation\_enabled rule | `bool` | `true` | no |
| <a name="input_check_cw_loggroup_retention_period"></a> [check\_cw\_loggroup\_retention\_period](#input\_check\_cw\_loggroup\_retention\_period) | Enable cloudwatch-log-group-retention-period-check rule | `bool` | `false` | no |
| <a name="input_check_db_instance_backup_enabled"></a> [check\_db\_instance\_backup\_enabled](#input\_check\_db\_instance\_backup\_enabled) | Enable db-instance-backup-enabled rule | `bool` | `false` | no |
| <a name="input_check_dynamodb_table_encrypted_kms"></a> [check\_dynamodb\_table\_encrypted\_kms](#input\_check\_dynamodb\_table\_encrypted\_kms) | Enable dynamodb-table-encrypted-kms rule | `bool` | `false` | no |
| <a name="input_check_dynamodb_table_encryption_enabled"></a> [check\_dynamodb\_table\_encryption\_enabled](#input\_check\_dynamodb\_table\_encryption\_enabled) | Enable checkdynamodb-table-encryption-enabled rule | `bool` | `true` | no |
| <a name="input_check_ebs_snapshot_public_restorable"></a> [check\_ebs\_snapshot\_public\_restorable](#input\_check\_ebs\_snapshot\_public\_restorable) | Enable ebs-snapshot-public-restorable rule | `bool` | `true` | no |
| <a name="input_check_ec2_encrypted_volumes"></a> [check\_ec2\_encrypted\_volumes](#input\_check\_ec2\_encrypted\_volumes) | Enable ec2-encrypted-volumes rule | `bool` | `true` | no |
| <a name="input_check_ec2_imdsv2"></a> [check\_ec2\_imdsv2](#input\_check\_ec2\_imdsv2) | Enable IMDSv2 rule | `bool` | `false` | no |
| <a name="input_check_ec2_volume_inuse_check"></a> [check\_ec2\_volume\_inuse\_check](#input\_check\_ec2\_volume\_inuse\_check) | Enable ec2-volume-inuse-check rule | `bool` | `true` | no |
| <a name="input_check_ecr_private_image_scanning_enabled"></a> [check\_ecr\_private\_image\_scanning\_enabled](#input\_check\_ecr\_private\_image\_scanning\_enabled) | Enable ecr-private-image-scanning-enabled rule | `bool` | `true` | no |
| <a name="input_check_ecr_private_lifecycle_policy_configured"></a> [check\_ecr\_private\_lifecycle\_policy\_configured](#input\_check\_ecr\_private\_lifecycle\_policy\_configured) | Enable ecr-private-lifecycle-policy-configured rule | `bool` | `true` | no |
| <a name="input_check_ecs_awsvpc_networking_enabled"></a> [check\_ecs\_awsvpc\_networking\_enabled](#input\_check\_ecs\_awsvpc\_networking\_enabled) | Enable ecs-awsvpc-networking-enabled rule | `bool` | `true` | no |
| <a name="input_check_ecs_containers_nonprivileged"></a> [check\_ecs\_containers\_nonprivileged](#input\_check\_ecs\_containers\_nonprivileged) | Enable ecs-containers-nonprivileged rule | `bool` | `true` | no |
| <a name="input_check_ecs_containers_readonly_access"></a> [check\_ecs\_containers\_readonly\_access](#input\_check\_ecs\_containers\_readonly\_access) | Enable ecs-containers-readonly-access rule | `bool` | `true` | no |
| <a name="input_check_ecs_no_environment_secrets"></a> [check\_ecs\_no\_environment\_secrets](#input\_check\_ecs\_no\_environment\_secrets) | Enable ecs-no-environment-secrets rule | `bool` | `false` | no |
| <a name="input_check_eip_attached"></a> [check\_eip\_attached](#input\_check\_eip\_attached) | Enable eip-attached rule | `bool` | `false` | no |
| <a name="input_check_elb_deletion_protection_enabled"></a> [check\_elb\_deletion\_protection\_enabled](#input\_check\_elb\_deletion\_protection\_enabled) | Enable elb-deletion-protection-enabled rule | `bool` | `true` | no |
| <a name="input_check_elb_logging_enabled"></a> [check\_elb\_logging\_enabled](#input\_check\_elb\_logging\_enabled) | Enable elb-logging-enabled rule | `bool` | `false` | no |
| <a name="input_check_guard_duty"></a> [check\_guard\_duty](#input\_check\_guard\_duty) | Enable guardduty-enabled-centralized rule | `bool` | `false` | no |
| <a name="input_check_iam_group_has_users_check"></a> [check\_iam\_group\_has\_users\_check](#input\_check\_iam\_group\_has\_users\_check) | Enable iam-group-has-users-check rule | `bool` | `true` | no |
| <a name="input_check_iam_password_policy"></a> [check\_iam\_password\_policy](#input\_check\_iam\_password\_policy) | Enable iam-password-policy rule | `bool` | `true` | no |
| <a name="input_check_iam_policy_no_statements_with_admin_access"></a> [check\_iam\_policy\_no\_statements\_with\_admin\_access](#input\_check\_iam\_policy\_no\_statements\_with\_admin\_access) | Enable iam-policy-no-statements-with-admin-access rule | `bool` | `true` | no |
| <a name="input_check_iam_policy_no_statements_with_full_access"></a> [check\_iam\_policy\_no\_statements\_with\_full\_access](#input\_check\_iam\_policy\_no\_statements\_with\_full\_access) | Enable iam-policy-no-statements-with-full-access rule | `bool` | `true` | no |
| <a name="input_check_iam_root_access_key"></a> [check\_iam\_root\_access\_key](#input\_check\_iam\_root\_access\_key) | Enable iam-root-access-key rule | `bool` | `true` | no |
| <a name="input_check_iam_user_no_policies_check"></a> [check\_iam\_user\_no\_policies\_check](#input\_check\_iam\_user\_no\_policies\_check) | Enable iam-user-no-policies-check rule | `bool` | `true` | no |
| <a name="input_check_instances_in_vpc"></a> [check\_instances\_in\_vpc](#input\_check\_instances\_in\_vpc) | Enable instances-in-vpc rule | `bool` | `true` | no |
| <a name="input_check_internet_gateway_authorized_vpc_only"></a> [check\_internet\_gateway\_authorized\_vpc\_only](#input\_check\_internet\_gateway\_authorized\_vpc\_only) | Enable internet-gateway-authorized-vpc-only rule | `bool` | `false` | no |
| <a name="input_check_mfa_enabled_for_iam_console_access"></a> [check\_mfa\_enabled\_for\_iam\_console\_access](#input\_check\_mfa\_enabled\_for\_iam\_console\_access) | Enable mfa-enabled-for-iam-console-access rule | `bool` | `true` | no |
| <a name="input_check_multi_region_cloud_trail"></a> [check\_multi\_region\_cloud\_trail](#input\_check\_multi\_region\_cloud\_trail) | Enable multi-region-cloud-trail-enabled rule | `bool` | `false` | no |
| <a name="input_check_nacl_no_unrestricted_ssh_rdp"></a> [check\_nacl\_no\_unrestricted\_ssh\_rdp](#input\_check\_nacl\_no\_unrestricted\_ssh\_rdp) | Enable nacl-no-unrestricted-ssh-rdp rule | `bool` | `true` | no |
| <a name="input_check_rds_cluster_deletion_protection_enabled"></a> [check\_rds\_cluster\_deletion\_protection\_enabled](#input\_check\_rds\_cluster\_deletion\_protection\_enabled) | Enable rds-cluster-deletion-protection-enabled rule | `bool` | `true` | no |
| <a name="input_check_rds_public_access"></a> [check\_rds\_public\_access](#input\_check\_rds\_public\_access) | Enable rds-instance-public-access-check rule | `bool` | `false` | no |
| <a name="input_check_rds_snapshot_encrypted"></a> [check\_rds\_snapshot\_encrypted](#input\_check\_rds\_snapshot\_encrypted) | Enable rds-snapshot-encrypted rule | `bool` | `true` | no |
| <a name="input_check_rds_snapshots_public_prohibited"></a> [check\_rds\_snapshots\_public\_prohibited](#input\_check\_rds\_snapshots\_public\_prohibited) | Enable rds-snapshots-public-prohibited rule | `bool` | `true` | no |
| <a name="input_check_rds_storage_encrypted"></a> [check\_rds\_storage\_encrypted](#input\_check\_rds\_storage\_encrypted) | Enable rds-storage-encrypted rule | `bool` | `true` | no |
| <a name="input_check_required_tags"></a> [check\_required\_tags](#input\_check\_required\_tags) | Enable required-tags rule | `bool` | `false` | no |
| <a name="input_check_restricted_ssh"></a> [check\_restricted\_ssh](#input\_check\_restricted\_ssh) | Enable restricted-ssh rule | `bool` | `true` | no |
| <a name="input_check_root_account_mfa_enabled"></a> [check\_root\_account\_mfa\_enabled](#input\_check\_root\_account\_mfa\_enabled) | Enable root-account-mfa-enabled rule | `bool` | `false` | no |
| <a name="input_check_s3_bucket_acl_prohibited"></a> [check\_s3\_bucket\_acl\_prohibited](#input\_check\_s3\_bucket\_acl\_prohibited) | Enable s3-bucket-acl-prohibited rule | `bool` | `true` | no |
| <a name="input_check_s3_bucket_level_public_access_prohibited"></a> [check\_s3\_bucket\_level\_public\_access\_prohibited](#input\_check\_s3\_bucket\_level\_public\_access\_prohibited) | Enable s3-bucket-level-public-access-prohibited rule | `bool` | `false` | no |
| <a name="input_check_s3_bucket_public_write_prohibited"></a> [check\_s3\_bucket\_public\_write\_prohibited](#input\_check\_s3\_bucket\_public\_write\_prohibited) | Enable s3-bucket-public-write-prohibited rule | `bool` | `true` | no |
| <a name="input_check_s3_bucket_server_side_encryption_enabled"></a> [check\_s3\_bucket\_server\_side\_encryption\_enabled](#input\_check\_s3\_bucket\_server\_side\_encryption\_enabled) | Enable s3-bucket-server-side-encryption-enabled rule | `bool` | `true` | no |
| <a name="input_check_s3_bucket_ssl_requests_only"></a> [check\_s3\_bucket\_ssl\_requests\_only](#input\_check\_s3\_bucket\_ssl\_requests\_only) | Enable s3-bucket-ssl-requests-only rule | `bool` | `true` | no |
| <a name="input_check_vpc_default_security_group_closed"></a> [check\_vpc\_default\_security\_group\_closed](#input\_check\_vpc\_default\_security\_group\_closed) | Enable vpc-default-security-group-closed rule | `bool` | `true` | no |
| <a name="input_check_vpc_sg_open_only_to_authorized_ports"></a> [check\_vpc\_sg\_open\_only\_to\_authorized\_ports](#input\_check\_vpc\_sg\_open\_only\_to\_authorized\_ports) | Enable vpc-sg-open-only-to-authorized-ports rule | `bool` | `true` | no |
| <a name="input_cloud_trail_cloud_watch_logs_enabled"></a> [cloud\_trail\_cloud\_watch\_logs\_enabled](#input\_cloud\_trail\_cloud\_watch\_logs\_enabled) | Enable cloud\_trail\_cloud\_watch\_logs\_enabled rule | `bool` | `true` | no |
| <a name="input_config_aggregator_name"></a> [config\_aggregator\_name](#input\_config\_aggregator\_name) | The name of the aggregator. | `string` | `"organization"` | no |
| <a name="input_config_delivery_frequency"></a> [config\_delivery\_frequency](#input\_config\_delivery\_frequency) | The frequency with which AWS Config delivers configuration snapshots. | `string` | `"Six_Hours"` | no |
| <a name="input_config_logs_bucket"></a> [config\_logs\_bucket](#input\_config\_logs\_bucket) | The S3 bucket for AWS Config logs. If you have set enable\_config\_recorder to false then this can be an empty string. | `string` | n/a | yes |
| <a name="input_config_logs_prefix"></a> [config\_logs\_prefix](#input\_config\_logs\_prefix) | The S3 prefix for AWS Config logs. | `string` | `"config"` | no |
| <a name="input_config_max_execution_frequency"></a> [config\_max\_execution\_frequency](#input\_config\_max\_execution\_frequency) | The maximum frequency with which AWS Config runs evaluations for a rule. | `string` | `"TwentyFour_Hours"` | no |
| <a name="input_config_name"></a> [config\_name](#input\_config\_name) | The name of the AWS Config instance. | `string` | `"aws-config"` | no |
| <a name="input_config_sns_topic_arn"></a> [config\_sns\_topic\_arn](#input\_config\_sns\_topic\_arn) | An SNS topic to stream configuration changes and notifications to. | `string` | `null` | no |
| <a name="input_cw_loggroup_retention_period"></a> [cw\_loggroup\_retention\_period](#input\_cw\_loggroup\_retention\_period) | Retention period for cloudwatch logs in number of days | `number` | `3653` | no |
| <a name="input_dynamodb_arn_encryption_list"></a> [dynamodb\_arn\_encryption\_list](#input\_dynamodb\_arn\_encryption\_list) | Comma separated list of AWS KMS key ARNs allowed for encrypting Amazon DynamoDB Tables. | `string` | `"example,CSV"` | no |
| <a name="input_ecs_no_environment_secrets"></a> [ecs\_no\_environment\_secrets](#input\_ecs\_no\_environment\_secrets) | Comma-separated list of key names to search for in the environment variables of container definitions within Task Definitions. Extra spaces will be removed. | `string` | `"example,CSV"` | no |
| <a name="input_elb_logging_s3_buckets"></a> [elb\_logging\_s3\_buckets](#input\_elb\_logging\_s3\_buckets) | Comma-separated list of Amazon S3 bucket names for Amazon ELB to deliver the log files. | `string` | `"example,CSV"` | no |
| <a name="input_enable_config_recorder"></a> [enable\_config\_recorder](#input\_enable\_config\_recorder) | Enables configuring the AWS Config recorder resources in this module. | `bool` | `true` | no |
| <a name="input_enable_efs_encrypted_check"></a> [enable\_efs\_encrypted\_check](#input\_enable\_efs\_encrypted\_check) | Enable efs-encrypted-check rule | `bool` | `false` | no |
| <a name="input_exclude_permission_boundary"></a> [exclude\_permission\_boundary](#input\_exclude\_permission\_boundary) | Boolean to exclude the evaluation of IAM policies used as permissions boundaries. If set to 'true', the rule will not include permissions boundaries in the evaluation. Otherwise, all IAM policies in scope are evaluated when set to 'false.' | `bool` | `false` | no |
| <a name="input_expected_delivery_window_age"></a> [expected\_delivery\_window\_age](#input\_expected\_delivery\_window\_age) | Maximum age in hours of the most recent delivery to CloudWatch logs that satisfies compliance. | `number` | `12` | no |
| <a name="input_include_global_resource_types"></a> [include\_global\_resource\_types](#input\_include\_global\_resource\_types) | Specifies whether AWS Config includes all supported types of global resources with the resources that it records. | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Amazon Resource Name (ARN) of the KMS key that is used to encrypt the EFS file system. | `string` | `"example,CSV"` | no |
| <a name="input_password_max_age"></a> [password\_max\_age](#input\_password\_max\_age) | Number of days before password expiration. | `number` | `90` | no |
| <a name="input_password_min_length"></a> [password\_min\_length](#input\_password\_min\_length) | Password minimum length. | `number` | `14` | no |
| <a name="input_password_require_lowercase"></a> [password\_require\_lowercase](#input\_password\_require\_lowercase) | Require at least one lowercase character in password. | `bool` | `true` | no |
| <a name="input_password_require_numbers"></a> [password\_require\_numbers](#input\_password\_require\_numbers) | Require at least one number in password. | `bool` | `true` | no |
| <a name="input_password_require_symbols"></a> [password\_require\_symbols](#input\_password\_require\_symbols) | Require at least one symbol in password. | `bool` | `true` | no |
| <a name="input_password_require_uppercase"></a> [password\_require\_uppercase](#input\_password\_require\_uppercase) | Require at least one uppercase character in password. | `bool` | `true` | no |
| <a name="input_password_reuse_prevention"></a> [password\_reuse\_prevention](#input\_password\_reuse\_prevention) | Number of passwords before allowing reuse. | `number` | `24` | no |
| <a name="input_required_tags"></a> [required\_tags](#input\_required\_tags) | A map of required resource tags. Format is tagNKey, tagNValue, where N is int. Values are optional. | `map(string)` | `{}` | no |
| <a name="input_required_tags_resource_types"></a> [required\_tags\_resource\_types](#input\_required\_tags\_resource\_types) | Resource types to check for tags. | `list(string)` | `[]` | no |
| <a name="input_resource_types"></a> [resource\_types](#input\_resource\_types) | A list that specifies the types of AWS resources for which AWS Config records configuration changes (for example, AWS::EC2::Instance or AWS::CloudTrail::Trail). See relevant part of AWS Docs for available types. | `list(string)` | `[]` | no |
| <a name="input_s3_bucket_public_access_prohibited_exclusion"></a> [s3\_bucket\_public\_access\_prohibited\_exclusion](#input\_s3\_bucket\_public\_access\_prohibited\_exclusion) | Comma-separated list of known allowed public Amazon S3 bucket names. | `string` | `"example,CSV"` | no |
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

Version 2.4.0 changed how AWS Config IAM polices would be attached to IAM roles. When applying the upgrade, you will likely see a race condition resulting in the following error

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
