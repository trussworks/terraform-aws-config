resource "aws_config_config_rule" "autoscaling_group_elb_healthcheck_required" {
  name        = "autoscaling_group_elb_healthcheck_required"
  description = "[AVAILABILITY] [EC2] Checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks."
  count       = "${var.autoscaling_group_elb_healthcheck_required}"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "rds_multi_az_support" {
  name        = "rds_multi_az_support"
  description = "[AVAILABILITY] [RDS] Checks whether high availability is enabled for your RDS DB instances."
  count       = "${var.rds_multi_az_support}"

  source {
    owner             = "AWS"
    source_identifier = "RDS_MULTI_AZ_SUPPORT"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
