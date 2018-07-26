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

data "template_file" "desired_instance_type" {
  template = "${file("${path.module}/config-policies/desired-instance-type.tpl")}"

  vars = {
    desired_instance_types = "${var.desired_instance_types}"
  }
}

data "template_file" "ec2_managedinstance_applications_required" {
  template = "${file("${path.module}/config-policies/ec2-managedinstance-applications-required.tpl")}"

  vars = {
    platform_type     = "${var.ec2_applications_required_platform_type}"
    application_names = "${var.ec2_applications_required_required_application_names}"
  }
}

data "template_file" "ec2_managedinstance_platform_check" {
  template = "${file("${path.module}/config-policies/ec2-managedinstance-platform-check.tpl")}"

  vars = {
    platform_type    = "${var.ec2_platform_check_platform_type}"
    platform_version = "${var.ec2_platform_check_platform_version}"
    agent_version    = "${var.ec2_platform_check_agent_version}"
  }
}

data "template_file" "db_instance_backup_enabled" {
  template = "${file("${path.module}/config-policies/db-instance-backup-enabled.tpl")}"

  vars = {
    backup_retention_period = "${var.db_backup_retention_period}"
    preferred_backup_window = "${var.db_backup_preferred_backup_window}"
    "check_read_replicas"   = "${var.db_backup_read_replicas}"
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

resource "aws_config_config_rule" "desired_instance_type" {
  name             = "desired_instance_type"
  description      = "[MANAGEMENT] [COST] Checks whether your EC2 instances are of the specified instance types."
  input_parameters = "${data.template_file.desired_instance_type.rendered}"
  count            = "${var.desired_instance_type}"

  source {
    owner             = "AWS"
    source_identifier = "DESIRED_INSTANCE_TYPE"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "ec2_instance_detailed_monitoring_enabled" {
  name        = "ec2_instance_detailed_monitoring_enabled"
  description = "[MANAGEMENT] [EC2] [CLOUDWATCH] Checks whether detailed monitoring is enabled for EC2 instances."
  count       = "${var.ec2_instance_detailed_monitoring_enabled}"

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_DETAILED_MONITORING_ENABLED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "ec2_managedinstance_applications_required" {
  name             = "ec2_managedinstance_applications_required"
  description      = "[MANAGEMENT] [EC2] Checks whether all of the specified applications are installed on the instance. Optionally, specify the minimum acceptable version. You can also specify the platform to apply the rule only to instances running that platform."
  input_parameters = "${data.template_file.ec2_managedinstance_applications_required.rendered}"
  count            = "${var.ec2_managedinstance_applications_required}"

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "ec2_managedinstance_platform_check" {
  name             = "ec2_managedinstance_platform_check"
  description      = "[MANAGEMENT] [EC2] Checks whether EC2 managed instances have the desired configurations."
  input_parameters = "${data.template_file.ec2_managedinstance_platform_check.rendered}"
  count            = "${var.ec2_managedinstance_platform_check}"

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_PLATFORM_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "db_instance_backup_enabled" {
  name             = "db_instance_backup_enabled"
  description      = "[MANAGEMENT] [RDS] Checks whether RDS DB instances have backups enabled. Optionally, the rule checks the backup retention period and the backup window."
  input_parameters = "${data.template_file.db_instance_backup_enabled.rendered}"
  count            = "${var.db_instance_backup_enabled}"

  source {
    owner             = "AWS"
    source_identifier = "DB_INSTANCE_BACKUP_ENABLED"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}
