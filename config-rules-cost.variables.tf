variable "ec2_volume_inuse_check" {
  description = "Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-volume-inuse-check.html) rule."
  default     = 0
}

variable "eip_attached" {
  description = "Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/eip-attached.html) rule."
  default     = 0
}
