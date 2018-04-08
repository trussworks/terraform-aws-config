variable "elb_acm_certificate_required" {
  description = "Enable this rule"
  default     = 0
}

variable "instances_in_vpc" {
  description = "Enable this rule"
  default     = 0
}

variable "s3_bucket_public_write_prohibited" {
  description = "Enable this rule"
  default     = 0
}

variable "s3_bucket_public_read_prohibited" {
  description = "Enable this rule"
  default     = 0
}

variable "s3_bucket_ssl_requests_only" {
  description = "Enable this rule"
  default     = 0
}

variable "iam_user_group_membership_check" {
  description = "Enable this rule"
  default     = 0
}

variable "iam_group_has_users_check" {
  description = "Enable this rule"
  default     = 0
}

variable "am_user_no_policies_check" {
  description = "Enable this rule"
  default     = 0
}

variable "root_account_mfa_enabled" {
  description = "Enable this rule"
  default     = 0
}

variable "iam_password_policy" {
  description = "Enable this rule"
  default     = 0
}

variable "password_require_uppercase" {
  description = "Require at least one uppercase character in password."
  default     = true
}

variable "password_require_lowercase" {
  description = "Require at least one lowercase character in password."
  default     = true
}

variable "password_require_symbols" {
  description = "Require at least one symbol in password."
  default     = true
}

variable "password_require_numbers" {
  description = "Require at least one number in password."
  default     = true
}

variable "password_min_length" {
  description = "Password minimum length."
  default     = 14
}

variable "password_reuse_prevention" {
  description = "Number of passwords before allowing reuse."
  default     = 24
}

variable "password_max_age_days" {
  description = "Number of days before password expiration."
  default     = 90
}
