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

variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs. If you have set enable_config_recorder to false then this can be an empty string."
  type        = string
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
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

variable "check_db_instance_backup_enabled" {
  description = "Enable check-db-backup-enabled rule"
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
  default     = false
}

variable "check_restricted_ssh" {
  description = "Enable restricted-ssh rule"
  type        = bool
  default     = false
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
