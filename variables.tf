variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs."
  type        = "string"
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  default     = "config"
  type        = "string"
}

variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule."
  default     = "TwentyFour_Hours"
  type        = "string"
}

variable "config_delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  default     = "Six_Hours"
  type        = "string"
}
