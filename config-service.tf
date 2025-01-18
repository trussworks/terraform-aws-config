locals {
  recording_strategy = length(var.excluded_resource_types) != 0 ? "EXCLUSION_BY_RESOURCE_TYPES" : length(var.resource_types) == 0 ? "ALL_SUPPORTED_RESOURCE_TYPES" : length(var.resource_types) != 0 ? "INCLUSION_BY_RESOURCE_TYPES" : var.recording_strategy
}
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
    all_supported                 = length(var.resource_types) == 0 || length(var.excluded_resource_types) == 0 ? true : false
    include_global_resource_types = length(var.resource_types) == 0 || length(var.excluded_resource_types) == 0 ? var.include_global_resource_types : null
    resource_types                = length(var.resource_types) == 0 || length(var.excluded_resource_types) == 0 ? null : var.resource_types


    dynamic "exclusion_by_resource_types" {
      for_each = length(var.excluded_resource_types) != 0 ? [1] : []
      content {
        resource_types = var.excluded_resource_types
      }
    }

    dynamic "recording_strategy" {
      for_each = var.recording_strategy != null ? [1] : []
      content {
        use_only = var.recording_strategy
      }
    }
  }

  recording_mode {
    recording_frequency = var.config_recording_frequency

    dynamic "recording_mode_override" {
      for_each = var.config_recording_frequency_overrides

      content {
        description         = recording_mode_override.value.description
        resource_types      = recording_mode_override.value.resource_types
        recording_frequency = recording_mode_override.value.recording_frequency
      }
    }
  }
}
