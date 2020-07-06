#
# AWS Config Service
#

resource "aws_config_configuration_recorder_status" "main" {
  count = var.active == true ? 1 : 0
  name       = "aws-config-${var.region}"
  is_enabled = true
  depends_on = [aws_config_delivery_channel.main]
}

resource "aws_config_delivery_channel" "main" {
  count = var.active == true ? 1 : 0
  name           = "aws-config-${var.region}"
  s3_bucket_name = var.config_logs_bucket
  s3_key_prefix  = var.config_logs_prefix

  snapshot_delivery_properties {
    delivery_frequency = var.config_delivery_frequency
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_configuration_recorder" "main" {
  count = var.active == true ? 1 : 0
  name     = "aws-config-${var.region}"
  role_arn = aws_iam_role.main.0.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

