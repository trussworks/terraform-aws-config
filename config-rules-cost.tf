resource "aws_config_config_rule" "ec2-volume-inuse-check" {
  name        = "ec2-volume-inuse-check"
  description = "[COST] [EC2] [EBS] Checks whether EBS volumes are attached to EC2 instances"

  source {
    owner             = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "eip-attached" {
  name        = "eip-attached"
  description = "[COST] [EC2] [VPC] Checks whether EIPs are being used."

  source {
    owner             = "AWS"
    source_identifier = "EIP_ATTACHED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
