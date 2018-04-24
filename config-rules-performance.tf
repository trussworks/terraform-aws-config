resource "aws_config_config_rule" "ebs_optimized_instance" {
  name        = "ebs_optimized_instance"
  description = "[PERFORMANCE] [EC2] [EBS] Checks whether EBS optimization is enabled for your EC2 instances that can be EBS-optimized."
  count       = "${var.ebs_optimized_instance}"

  source {
    owner             = "AWS"
    source_identifier = "EBS_OPTIMIZED_INSTANCE"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
