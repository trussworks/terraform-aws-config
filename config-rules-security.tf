data "template_file" "aws_config_iam_password_policy" {
  template = "${file("${path.module}/config-policies/iam-password-policy.tpl")}"

  vars = {
    // terraform will interpolate boolean as 0/1 and the config parameters expect "true" or "false"
    password_require_uppercase = "${var.password_require_uppercase ? "true" : "false"}"
    password_require_lowercase = "${var.password_require_lowercase ? "true" : "false"}"
    password_require_symbols   = "${var.password_require_symbols ? "true" : "false"}"
    password_require_numbers   = "${var.password_require_numbers ? "true" : "false"}"
    password_min_length        = "${var.password_min_length}"
    password_reuse_prevention  = "${var.password_reuse_prevention}"
    password_max_age_days      = "${var.password_max_age_days}"
  }
}

#IAM
resource "aws_config_config_rule" "iam_password_policy" {
  name                        = "iam_password_policy"
  description                 = "[SECURITY] [IAM] Ensure the account password policy for IAM users meets the specified requirements."
  input_parameters            = "${data.template_file.aws_config_iam_password_policy.rendered}"
  maximum_execution_frequency = "${var.config_max_execution_frequency}"
  count                       = "${var.iam_password_policy}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "root_account_mfa_enabled" {
  name                        = "root_account_mfa_enabled"
  description                 = "[SECURITY] [IAM] Ensure root AWS account has MFA enabled"
  count                       = "${var.root_account_mfa_enabled}"
  maximum_execution_frequency = "${var.config_max_execution_frequency}"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "iam_user_no_policies_check" {
  name        = "iam_user_no_policies_check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles."
  count       = "${var.iam_user_no_policies_check}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "iam_group_has_users_check" {
  name        = "iam_group_has_users_check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Ensure that all IAM User Groups have at least one user."
  count       = "${var.iam_group_has_users_check}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_GROUP_HAS_USERS_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "iam_user_group_membership_check" {
  name        = "iam_user_group_membership_check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Checks whether IAM users are members of at least one IAM group."
  count       = "${var.iam_user_group_membership_check}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

#S3
resource "aws_config_config_rule" "s3_bucket_ssl_requests_only" {
  name        = "s3_bucket_ssl_requests_only"
  description = "[SECURITY] [S3] Checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL)."
  count       = "${var.s3_bucket_ssl_requests_only}"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name        = "s3_bucket_public_read_prohibited"
  description = "[SECURITY] [S3] Checks that your Amazon S3 buckets do not allow public read access. If an Amazon S3 bucket policy or bucket ACL allows public read access, the bucket is noncompliant."
  count       = "${var.s3_bucket_public_read_prohibited}"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "s3_bucket_public_write_prohibited" {
  name        = "s3_bucket_public_write_prohibited"
  description = "[SECURITY] [S3] Checks that your Amazon S3 buckets do not allow public write access. If an Amazon S3 bucket policy or bucket ACL allows public write access, the bucket is noncompliant."
  count       = "${var.s3_bucket_public_write_prohibited}"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

#EC2
resource "aws_config_config_rule" "instances_in_vpc" {
  name        = "instances_in_vpc"
  description = "[SECURITY] [EC2] [VPC] Ensure all EC2 instances run in a VPC"
  count       = "${var.instances_in_vpc}"

  source {
    owner             = "AWS"
    source_identifier = "INSTANCES_IN_VPC"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "elb_acm_certificate_required" {
  name        = "elb_acm_certificate_required"
  description = "[SECURITY] [EC2] [ELB] Checks whether the Classic Load Balancers use SSL certificates provided by AWS Certificate Manager."
  count       = "${var.elb_acm_certificate_required}"

  source {
    owner             = "AWS"
    source_identifier = "ELB_ACM_CERTIFICATE_REQUIRED"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}
