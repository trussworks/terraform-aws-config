#
# AWS Config Service
#

resource "aws_config_configuration_recorder_status" "main" {
  count = var.enable_config_recorder ? 1 : 0

  name       = var.config_name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.main]
}

resource "aws_config_delivery_channel" "main" {
  count = var.enable_config_recorder ? 1 : 0

  name           = var.config_name
  s3_bucket_name = var.config_logs_bucket
  s3_key_prefix  = var.config_logs_prefix
  s3_kms_key_arn = var.config_logs_bucket_kms_key_arn
  sns_topic_arn  = var.config_sns_topic_arn

  snapshot_delivery_properties {
    delivery_frequency = var.config_delivery_frequency
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_configuration_recorder" "main" {
  count = var.enable_config_recorder ? 1 : 0

  name     = var.config_name
  role_arn = aws_iam_role.main[count.index].arn

  recording_group {
    all_supported                 = length(var.resource_types) == 0 ? true : false
    include_global_resource_types = length(var.resource_types) == 0 ? var.include_global_resource_types : null
    resource_types                = length(var.resource_types) == 0 ? null : var.resource_types
  }
}
