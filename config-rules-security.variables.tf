variable "elb_acm_certificate_required" {
  description = "`SECURITY` `EC2` `ELB` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/elb-acm-certificate-required.html) rule."
  default     = 0
}

variable "instances_in_vpc" {
  description = "`SECURITY` `EC2` `VPC` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instances-in-vpc.html) rule."
  default     = 0
}

variable "s3_bucket_public_write_prohibited" {
  description = "`SECURITY` `S3` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-public-write-prohibited.html) rule."
  default     = 0
}

variable "s3_bucket_public_read_prohibited" {
  description = "`SECURITY` `S3` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-public-read-prohibited.html) rule."
  default     = 0
}

variable "s3_bucket_ssl_requests_only" {
  description = "`SECURITY` `S3` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-ssl-requests-only.html) rule."
  default     = 0
}

variable "iam_user_group_membership_check" {
  description = "`SECURITY` `MANAGEMENT` `IAM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-group-membership-check.html) rule."
  default     = 0
}

variable "iam_group_has_users_check" {
  description = "`SECURITY` `MANAGEMENT` `IAM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-group-has-users-check.html) rule."
  default     = 0
}

variable "iam_user_no_policies_check" {
  description = "`SECURITY` `MANAGEMENT` `IAM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-no-policies-check.html) rule."
  default     = 0
}

variable "root_account_mfa_enabled" {
  description = "`SECURITY` `IAM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/root-account-mfa-enabled.html) rule."
  default     = 0
}

variable "iam_password_policy" {
  description = "`SECURITY` `IAM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-password-policy.html) rule."
  default     = 0
}

variable "password_require_uppercase" {
  description = "For `iam_password_policy` rule. Require at least one uppercase character in password."
  default     = true
}

variable "password_require_lowercase" {
  description = "For `iam_password_policy` rule. Require at least one lowercase character in password."
  default     = true
}

variable "password_require_symbols" {
  description = "For `iam_password_policy` rule. Require at least one symbol in password."
  default     = true
}

variable "password_require_numbers" {
  description = "For `iam_password_policy` rule. Require at least one number in password."
  default     = true
}

variable "password_min_length" {
  description = "For `iam_password_policy` rule. Password minimum length."
  default     = 14
}

variable "password_reuse_prevention" {
  description = "For `iam_password_policy` rule. For `iam_password_policy` rule. Number of passwords before allowing reuse."
  default     = 24
}

variable "password_max_age_days" {
  description = "For `iam_password_policy` rule. Number of days before password expiration."
  default     = 90
}

variable "encrypted_volumes" {
  description = "`SECURITY` `EC2` `EBS` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/encrypted-volumes.html) rule."
  default     = 0
}

variable "rds_storage_encrypted" {
  description = "`SECURITY` `RDS` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/rds-storage-encrypted.html) rule."
  default     = 0
}

variable "restricted_ssh" {
  description = "`SECURITY` `EC2` `SSH` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/restricted-ssh.html) rule."
  default     = 0
}
