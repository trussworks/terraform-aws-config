resource "aws_config_config_rule" "ec2_volume_inuse_check" {
  name        = "ec2_volume_inuse_check"
  description = "[COST] [EC2] [EBS] Checks whether EBS volumes are attached to EC2 instances"
  count       = "${var.ec2_volume_inuse_check}"

  source {
    owner             = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "eip_attached" {
  name        = "eip_attached"
  description = "[COST] [EC2] [VPC] Checks whether EIPs are being used."
  count       = "${var.eip_attached}"

  source {
    owner             = "AWS"
    source_identifier = "EIP_ATTACHED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
