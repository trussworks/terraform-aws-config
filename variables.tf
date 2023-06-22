variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
  default     = "aws-config"
}

variable "config_aggregator_name" {
  description = "The name of the aggregator."
  type        = string
  default     = "organization"
}

variable "aggregate_organization" {
  description = "Aggregate compliance data by organization"
  type        = bool
  default     = false
}

variable "config_role_permissions_boundary" {
  description = "The ARN of the permissions boundary to apply to IAM roles created for AWS Config"
  type        = string
  default     = null
}

variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs. If you have set enable_config_recorder to false then this can be an empty string."
  type        = string
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "config_logs_bucket_kms_key_arn" {
  description = "The ARN of the AWS KMS key used to encrypt objects delivered by AWS Config. Must belong to the same Region as the destination S3 bucket."
  type        = string
  default     = null
}

variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule."
  type        = string
  default     = "TwentyFour_Hours"
}

variable "config_delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  default     = "Six_Hours"
  type        = string
}

variable "acm_days_to_expiration" {
  description = "Specify the number of days before the rule flags the ACM Certificate as noncompliant."
  type        = number
  default     = 14
}

variable "password_require_uppercase" {
  description = "Require at least one uppercase character in password."
  type        = bool
  default     = true
}

variable "password_require_lowercase" {
  description = "Require at least one lowercase character in password."
  type        = bool
  default     = true
}

variable "password_require_symbols" {
  description = "Require at least one symbol in password."
  type        = bool
  default     = true
}

variable "password_require_numbers" {
  description = "Require at least one number in password."
  type        = bool
  default     = true
}

variable "password_min_length" {
  description = "Password minimum length."
  type        = number
  default     = 14
}

variable "password_reuse_prevention" {
  description = "Number of passwords before allowing reuse."
  type        = number
  default     = 24
}

variable "password_max_age" {
  description = "Number of days before password expiration."
  type        = number
  default     = 90
}

variable "check_root_account_mfa_enabled" {
  description = "Enable root-account-mfa-enabled rule"
  type        = bool
  default     = false
}

variable "check_guard_duty" {
  description = "Enable guardduty-enabled-centralized rule"
  type        = bool
  default     = false
}

variable "check_rds_public_access" {
  description = "Enable rds-instance-public-access-check rule"
  type        = bool
  default     = false
}

variable "check_multi_region_cloud_trail" {
  description = "Enable multi-region-cloud-trail-enabled rule"
  type        = bool
  default     = false
}

variable "check_cloudtrail_enabled" {
  description = "Enable cloudtrail-enabled rule"
  type        = bool
  default     = true
}

variable "check_cloud_trail_encryption" {
  description = "Enable cloud-trail-encryption-enabled rule"
  type        = bool
  default     = false
}

variable "check_cloud_trail_log_file_validation" {
  description = "Enable cloud-trail-log-file-validation-enabled rule"
  type        = bool
  default     = false
}

variable "check_eip_attached" {
  description = "Enable eip-attached rule"
  type        = bool
  default     = false
}

variable "check_required_tags" {
  description = "Enable required-tags rule"
  type        = bool
  default     = false
}

variable "required_tags_resource_types" {
  description = "Resource types to check for tags."
  type        = list(string)
  default     = []
}

variable "required_tags" {
  description = "A map of required resource tags. Format is tagNKey, tagNValue, where N is int. Values are optional."
  type        = map(string)
  default     = {}
}

variable "check_instances_in_vpc" {
  description = "Enable instances-in-vpc rule"
  type        = bool
  default     = true
}

variable "check_acm_certificate_expiration_check" {
  description = "Enable acm-certificate-expiration-check rule"
  type        = bool
  default     = true
}

variable "check_iam_password_policy" {
  description = "Enable iam-password-policy rule"
  type        = bool
  default     = true
}

variable "check_iam_group_has_users_check" {
  description = "Enable iam-group-has-users-check rule"
  type        = bool
  default     = true
}

variable "check_iam_user_no_policies_check" {
  description = "Enable iam-user-no-policies-check rule"
  type        = bool
  default     = true
}

variable "check_ec2_volume_inuse_check" {
  description = "Enable ec2-volume-inuse-check rule"
  type        = bool
  default     = true
}

variable "check_approved_amis_by_tag" {
  description = "Enable approved-amis-by-tag rule"
  type        = bool
  default     = false
}

variable "ami_required_tag_key_value" {
  description = "Tag/s key and value which AMI has to have in order to be compliant: Example: key1:value1,key2:value2"
  type        = string
  default     = ""
}

variable "check_ec2_encrypted_volumes" {
  description = "Enable ec2-encrypted-volumes rule"
  type        = bool
  default     = true
}

variable "check_rds_storage_encrypted" {
  description = "Enable rds-storage-encrypted rule"
  type        = bool
  default     = true
}

variable "check_rds_snapshots_public_prohibited" {
  description = "Enable rds-snapshots-public-prohibited rule"
  type        = bool
  default     = true
}

variable "check_s3_bucket_public_write_prohibited" {
  description = "Enable s3-bucket-public-write-prohibited rule"
  type        = bool
  default     = true
}

variable "check_cloudwatch_log_group_encrypted" {
  description = "Enable cloudwatch-log-group-encryption rule"
  type        = bool
  default     = true
}

variable "check_cw_loggroup_retention_period" {
  description = "Enable cloudwatch-log-group-retention-period-check rule"
  type        = bool
  default     = false
}

variable "cw_loggroup_retention_period" {
  description = "Retention period for cloudwatch logs in number of days"
  type        = number
  default     = 3653
}

variable "check_iam_root_access_key" {
  description = "Enable iam-root-access-key rule"
  type        = bool
  default     = true
}

variable "check_ebs_snapshot_public_restorable" {
  description = "Enable ebs-snapshot-public-restorable rule"
  type        = bool
  default     = true
}

variable "check_vpc_default_security_group_closed" {
  description = "Enable vpc-default-security-group-closed rule"
  type        = bool
  default     = true
}

variable "check_s3_bucket_ssl_requests_only" {
  description = "Enable s3-bucket-ssl-requests-only rule"
  type        = bool
  default     = true
}

variable "check_mfa_enabled_for_iam_console_access" {
  description = "Enable mfa-enabled-for-iam-console-access rule"
  type        = bool
  default     = true
}

variable "check_restricted_ssh" {
  description = "Enable restricted-ssh rule"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to AWS Config resources"
  type        = map(string)
  default     = {}
}

variable "include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records."
  type        = bool
  default     = true
}

variable "config_sns_topic_arn" {
  description = "An SNS topic to stream configuration changes and notifications to."
  type        = string
  default     = null
}

variable "enable_config_recorder" {
  description = "Enables configuring the AWS Config recorder resources in this module."
  type        = bool
  default     = true
}

variable "check_ec2_imdsv2" {
  description = "Enable IMDSv2 rule"
  type        = bool
  default     = false
}

variable "check_access_keys_rotated" {
  description = "Enable access-keys-rotated rule"
  type        = bool
  default     = true
}

variable "access_key_max_age" {
  description = "Maximum number of days without rotation."
  type        = number
  default     = 90
}

variable "check_cmk_backing_key_rotated" {
  description = "Enable cmk_backing_key_rotation_enabled rule"
  type        = bool
  default     = true
}

variable "cloud_trail_cloud_watch_logs_enabled" {
  description = "Enable cloud_trail_cloud_watch_logs_enabled rule"
  type        = bool
  default     = true
}

variable "expected_delivery_window_age" {
  description = "Maximum age in hours of the most recent delivery to CloudWatch logs that satisfies compliance."
  type        = number
  default     = 12
}

variable "check_dynamodb_table_encryption_enabled" {
  description = "Enable checkdynamodb-table-encryption-enabled rule"
  type        = bool
  default     = true
}

variable "check_dynamodb_table_encrypted_kms" {
  description = "Enable dynamodb-table-encrypted-kms rule"
  type        = bool
  default     = false
}

variable "dynamodb_arn_encryption_list" {
  description = "Comma separated list of AWS KMS key ARNs allowed for encrypting Amazon DynamoDB Tables."
  type        = string
  default     = "example,CSV"
}

variable "check_ecr_private_image_scanning_enabled" {
  description = "Enable ecr-private-image-scanning-enabled rule"
  type        = bool
  default     = true
}

variable "check_ecr_private_lifecycle_policy_configured" {
  description = "Enable ecr-private-lifecycle-policy-configured rule"
  type        = bool
  default     = true
}

variable "check_ecs_awsvpc_networking_enabled" {
  description = "Enable ecs-awsvpc-networking-enabled rule"
  type        = bool
  default     = true
}

variable "check_ecs_containers_nonprivileged" {
  description = "Enable ecs-containers-nonprivileged rule"
  type        = bool
  default     = true
}

variable "check_ecs_containers_readonly_access" {
  description = "Enable ecs-containers-readonly-access rule"
  type        = bool
  default     = true
}

variable "check_ecs_no_environment_secrets" {
  description = "Enable ecs-no-environment-secrets rule"
  type        = bool
  default     = false
}

variable "ecs_no_environment_secrets" {
  description = "Comma-separated list of key names to search for in the environment variables of container definitions within Task Definitions. Extra spaces will be removed."
  type        = string
  default     = "example,CSV"
}

variable "enable_efs_encrypted_check" {
  description = "Enable efs-encrypted-check rule"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "Amazon Resource Name (ARN) of the KMS key that is used to encrypt the EFS file system."
  type        = string
  default     = "example,CSV"
}

variable "check_elb_deletion_protection_enabled" {
  description = "Enable elb-deletion-protection-enabled rule"
  type        = bool
  default     = true
}

variable "check_elb_logging_enabled" {
  description = "Enable elb-logging-enabled rule"
  type        = bool
  default     = false
}

variable "elb_logging_s3_buckets" {
  description = "Comma-separated list of Amazon S3 bucket names for Amazon ELB to deliver the log files."
  type        = string
  default     = "example,CSV"
}

variable "check_iam_policy_no_statements_with_admin_access" {
  description = "Enable iam-policy-no-statements-with-admin-access rule"
  type        = bool
  default     = true
}

variable "check_iam_policy_no_statements_with_full_access" {
  description = "Enable iam-policy-no-statements-with-full-access rule"
  type        = bool
  default     = true
}

variable "exclude_permission_boundary" {
  description = "Boolean to exclude the evaluation of IAM policies used as permissions boundaries. If set to 'true', the rule will not include permissions boundaries in the evaluation. Otherwise, all IAM policies in scope are evaluated when set to 'false.'"
  type        = bool
  default     = false
}

variable "check_nacl_no_unrestricted_ssh_rdp" {
  description = "Enable nacl-no-unrestricted-ssh-rdp rule"
  type        = bool
  default     = true
}

variable "check_internet_gateway_authorized_vpc_only" {
  description = "Enable internet-gateway-authorized-vpc-only rule"
  type        = bool
  default     = false
}

variable "authorized_vpc_ids" {
  description = "Comma-separated list of the authorized VPC IDs with attached IGWs. If parameter is not provided all attached IGWs will be NON_COMPLIANT."
  type        = string
  default     = "example,CSV"
}

variable "check_rds_snapshot_encrypted" {
  description = "Enable rds-snapshot-encrypted rule"
  type        = bool
  default     = true
}

variable "check_rds_cluster_deletion_protection_enabled" {
  description = "Enable rds-cluster-deletion-protection-enabled rule"
  type        = bool
  default     = true
}

variable "check_db_instance_backup_enabled" {
  description = "Enable db-instance-backup-enabled rule"
  type        = bool
  default     = false
}

variable "check_s3_bucket_level_public_access_prohibited" {
  description = "Enable s3-bucket-level-public-access-prohibited rule"
  type        = bool
  default     = false
}

variable "s3_bucket_public_access_prohibited_exclusion" {
  description = "Comma-separated list of known allowed public Amazon S3 bucket names."
  type        = string
  default     = "example,CSV"
}

variable "check_s3_bucket_acl_prohibited" {
  description = "Enable s3-bucket-acl-prohibited rule"
  type        = bool
  default     = true
}

variable "check_s3_bucket_server_side_encryption_enabled" {
  description = "Enable s3-bucket-server-side-encryption-enabled rule"
  type        = bool
  default     = true
}

variable "check_vpc_sg_open_only_to_authorized_ports" {
  description = "Enable vpc-sg-open-only-to-authorized-ports rule"
  type        = bool
  default     = true
}

variable "resource_types" {
  description = "A list that specifies the types of AWS resources for which AWS Config records configuration changes (for example, AWS::EC2::Instance or AWS::CloudTrail::Trail). See relevant part of AWS Docs for available types."
  type        = list(string)
  default     = []
}

variable "enable_multi_account_logs" {
  description = "Enable sending of logs and snapshots from different Config accounts / regions into a single bucket"
  type        = bool
  default     = false
}

variable "check_restricted_common_ports" {
  description = "Enable restricted-common-ports-check"
  type        = bool
  default     = false
}

variable "check_s3_bucket_public_read_prohibited" {
  description = "Enable s3-bucket-public-read-prohibited rule"
  type        = bool
  default     = false
}

variable "check_ebs_optimized_instance" {
  description = "Enable ebs-optimized-instance-check rule"
  type        = bool
  default     = false
}

variable "vpc_sg_authorized_TCP_ports" {
  description = "Comma-separated list of TCP ports authorized to be open to 0.0.0.0/0. Ranges are defined by dash."
  type        = string
  default     = "example,443,1020-1025"
}

variable "vpc_sg_authorized_UDP_ports" {
  description = "Comma-separated list of UDP ports authorized to be open to 0.0.0.0/0. Ranges are defined by dash."
  type        = string
  default     = "example,500,1020-1025"
}
