variable "rds_multi_az_support" {
  description = "`AVAILABILITY` `RDS` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/rds-multi-az-support.html) rule."
  default     = 0
}

variable "autoscaling_group_elb_healthcheck_required" {
  description = "`AVAILABILITY` `EC2` Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/autoscaling-group-elb-healthcheck-required.html) rule."
  default     = 0
}
