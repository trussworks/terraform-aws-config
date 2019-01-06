variable "required_tags" {
  description = "`MANAGEMENT` `COST` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/required-tags.html) rule."
  default     = 0
}

variable "required_tag_key_1" {
  description = "For `required_tags` rule. Required Tag 1"
  default     = ""
}

variable "required_tag_values_1" {
  description = "For `required_tags` rule. Values that required Tag 1 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "required_tag_key_2" {
  description = "For `required_tags` rule. Required Tag 2"
  default     = ""
}

variable "required_tag_values_2" {
  description = "For `required_tags` rule. Values that required Tag 2 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "required_tag_key_3" {
  description = "For `required_tags` rule. Required Tag 3"
  default     = ""
}

variable "required_tag_values_3" {
  description = "For `required_tags` rule. Values that required Tag 3 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "required_tag_key_4" {
  description = "For `required_tags` rule. Required Tag 4"
  default     = ""
}

variable "required_tag_values_4" {
  description = "For `required_tags` rule. Values that required Tag 4 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "required_tag_key_5" {
  description = "For `required_tags` rule. Required Tag 5"
  default     = ""
}

variable "required_tag_values_5" {
  description = "For `required_tags` rule. Values that required Tag 5 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "required_tag_key_6" {
  description = "For `required_tags` rule. Required Tag 6"
  default     = ""
}

variable "required_tag_values_6" {
  description = "For `required_tags` rule. Values that required Tag 6 accepts (ie. \"Prod,QA,Dev\")"
  default     = ""
}

variable "cloudtrail_enabled" {
  description = "`MANAGEMENT` `CLOUDTRAIL` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/cloudtrail-enabled.html) rule."
  default     = 0
}

variable "acm_certificate_expiration_check" {
  description = "`MANAGEMENT` `ACM` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/acm-certificate-expiration-check.html) rule."
  default     = 0
}

variable "acm_days_to_expiration" {
  description = "For `acm_days_to_expiration` rule. Specify the number of days before the rule flags the ACM Certificate as noncompliant."
  default     = 14
}

variable "desired_instance_type" {
  description = "`MANAGEMENT` `EC2` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/desired-instance-type.html) rule."
  default     = 0
}

variable "desired_instance_types" {
  description = "For `desired_instance_types` rule. Comma-separated list of EC2 instance types (for example, \"t2.small, m4.large, i2.xlarge\")."
  default     = ""
}

variable "ec2_instance_detailed_monitoring_enabled" {
  description = "`MANAGEMENT` `EC2` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-detailed-monitoring-enabled.html) rule."
  default     = 0
}

variable "ec2_managedinstance_applications_required" {
  description = "`MANAGEMENT` `EC2` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-applications-required.html) rule."
  default     = 0
}

variable "ec2_applications_required_platform_type" {
  description = "For `ec2_managedinstance_applications_required` rule. The platform type (for example, \"Linux\" or \"Windows\")."
  default     = ""
}

variable "ec2_applications_required_required_application_names" {
  description = "For `ec2_managedinstance_applications_required` rule. Comma-separated list of application names. Optionally, specify versions appended with \":\" (for example, \"Chrome:0.5.3, FireFox\")."
  default     = ""
}

variable "ec2_managedinstance_platform_check" {
  description = "`MANAGEMENT` `EC2` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-platform-check.html) rule."
  default     = 0
}

variable "ec2_platform_check_platform_type" {
  description = "For `ec2_platform_check_platform_type` rule. The platform type (for example, \"Linux\" or \"Windows\")."
  default     = ""
}

variable "ec2_platform_check_platform_version" {
  description = "For `ec2_platform_check_platform_type` rule. The version of the platform (for example, \"2016.09\")."
  default     = ""
}

variable "ec2_platform_check_agent_version" {
  description = "For `ec2_platform_check_platform_type` rule. The version of the agent (for example, \"2.0.433.0\")."
  default     = ""
}

variable "db_instance_backup_enabled" {
  description = "`MANAGEMENT` `RDS` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/db-instance-backup-enabled.html) rule."
  description = "For `db_instance_backup_enabled` rule. The version of the agent (for example, \"2.0.433.0\")."
  default     = 0
}

variable "db_backup_retention_period" {
  description = "For `db_instance_backup_enabled` rule. The minimum retention period for backups"
  default     = ""
}

variable "db_backup_preferred_backup_window" {
  description = "For `db_instance_backup_enabled` rule. time range in which backups are created"
  default     = ""
}

variable "db_backup_read_replicas" {
  description = "For `db_instance_backup_enabled` rule. Evaluates whether backups are enabled for read replicas"
  default     = ""
}
