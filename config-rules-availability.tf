resource "aws_config_config_rule" "autoscaling-group-elb-healthcheck-required" {
  name        = "autoscaling-group-elb-healthcheck-required"
  description = "[AVAILABILITY] [EC2] Checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks."

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "rds-multi-az-support" {
  name        = "rds-multi-az-support"
  description = "[AVAILABILITY] [RDS] Checks whether high availability is enabled for your RDS DB instances."

  source {
    owner             = "AWS"
    source_identifier = "RDS_MULTI_AZ_SUPPORT"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
