variable "required_tags" {
  description = "Enable this rule"
  default     = 0
}

variable "cloudtrail_enabled" {
  description = "Enable this rule"
  default     = 0
}

variable "acm_certificate_expiration_check" {
  description = "Enable this rule"
  default     = 0
}

variable "acm_days_to_expiration" {
  description = "Specify the number of days before the rule flags the ACM Certificate as noncompliant."
  default     = 14
}

variable "required_tag_key_1" {
  description = "Required Tag 1"
  default     = ""
}

variable "required_tag_values_1" {
  description = "Values that required Tag 1 accepts"
  default     = ""
}

variable "required_tag_key_2" {
  description = "Required Tag 2"
  default     = ""
}

variable "required_tag_values_2" {
  description = "Values that required Tag 2 accepts"
  default     = ""
}

variable "required_tag_key_3" {
  description = "Required Tag 3"
  default     = ""
}

variable "required_tag_values_3" {
  description = "Values that required Tag 3 accepts"
  default     = ""
}

variable "required_tag_key_4" {
  description = "Required Tag 4"
  default     = ""
}

variable "required_tag_values_4" {
  description = "Values that required Tag 4 accepts"
  default     = ""
}

variable "required_tag_key_5" {
  description = "Required Tag 5"
  default     = ""
}

variable "required_tag_values_5" {
  description = "Values that required Tag 5 accepts"
  default     = ""
}

variable "required_tag_key_6" {
  description = "Required Tag 6"
  default     = ""
}

variable "required_tag_values_6" {
  description = "Values that required Tag 6 accepts"
  default     = ""
}
