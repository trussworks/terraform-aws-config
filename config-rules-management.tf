data "template_file" "aws_config_acm_certificate_expiration" {
  template = "${file("${path.module}/config-policies/acm-certificate-expiration.tpl")}"

  vars = {
    acm_days_to_expiration = "${var.acm_days_to_expiration}"
  }
}

data "template_file" "required_tags" {
  template = "${file("${path.module}/config-policies/required-tags.tpl")}"

  vars = {
    required_tag_key_1    = "${var.required_tag_key_1}"
    required_tag_values_1 = "${var.required_tag_values_1}"
    required_tag_key_2    = "${var.required_tag_key_2}"
    required_tag_values_2 = "${var.required_tag_values_2}"
    required_tag_key_3    = "${var.required_tag_key_3}"
    required_tag_values_3 = "${var.required_tag_values_3}"
    required_tag_key_4    = "${var.required_tag_key_4}"
    required_tag_values_4 = "${var.required_tag_values_4}"
    required_tag_key_5    = "${var.required_tag_key_5}"
    required_tag_values_5 = "${var.required_tag_values_5}"
    required_tag_key_6    = "${var.required_tag_key_6}"
    required_tag_values_6 = "${var.required_tag_values_6}"
  }
}

resource "aws_config_config_rule" "cloudtrail_enabled" {
  name        = "cloudtrail_enabled"
  description = "[MANAGEMENT] [CLOUDTRAIL] Ensure CloudTrail is enabled."
  count       = "${var.cloudtrail_enabled}"

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }

  maximum_execution_frequency = "${var.config_max_execution_frequency}"

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "acm_certificate_expiration_check" {
  name             = "acm_certificate_expiration_check"
  description      = "[MANAGEMENT] [ACM] Ensures ACM Certificates in your account are marked for expiration within the specified number of days"
  input_parameters = "${data.template_file.aws_config_acm_certificate_expiration.rendered}"
  count            = "${var.acm_certificate_expiration_check}"

  source {
    owner             = "AWS"
    source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "required_tags" {
  name             = "required_tags"
  description      = "[MANAGEMENT] [COST] Ensures that every resource has the required tags and values."
  input_parameters = "${data.template_file.required_tags.rendered}"
  count            = "${var.required_tags}"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}
