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

# MANAGEMENT
resource "aws_config_config_rule" "cloudtrail-enabled" {
  name        = "cloudtrail-enabled"
  description = "[SECURITY] [MANAGEMENT] [CLOUDTRAIL] Ensure CloudTrail is enabled"

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

#IAM
resource "aws_config_config_rule" "iam-password-policy" {
  name             = "iam-password-policy"
  description      = "[SECURITY] [IAM] Ensure the account password policy for IAM users meets the specified requirements"
  input_parameters = "${data.template_file.aws_config_iam_password_policy.rendered}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  maximum_execution_frequency = "${var.config_max_execution_frequency}"

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "root-account-mfa-enabled" {
  name        = "root-account-mfa-enabled"
  description = "[SECURITY] [IAM] Ensure root AWS account has MFA enabled"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  maximum_execution_frequency = "${var.config_max_execution_frequency}"

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "iam-user-no-policies-check" {
  name        = "iam-user-no-policies-check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles."

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "iam-group-has-users-check" {
  name        = "iam-group-has-users-check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Ensure that all IAM User Groups have at least one user."

  source {
    owner             = "AWS"
    source_identifier = "IAM_GROUP_HAS_USERS_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "iam-user-group-membership-check" {
  name        = "iam-group-has-users-check"
  description = "[SECURITY] [MANAGEMENT] [IAM] Checks whether IAM users are members of at least one IAM group."

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

#S3
resource "aws_config_config_rule" "s3-bucket-ssl-requests-only" {
  name        = "s3-bucket-ssl-requests-only"
  description = "[SECURITY] [S3] Checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL)."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "s3-bucket-public-read-prohibited" {
  name        = "s3-bucket-public-read-prohibited"
  description = "[SECURITY] [S3] Checks that your Amazon S3 buckets do not allow public read access. If an Amazon S3 bucket policy or bucket ACL allows public read access, the bucket is noncompliant."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

resource "aws_config_config_rule" "s3-bucket-public-write-prohibited" {
  name        = "s3-bucket-public-write-prohibited"
  description = "[SECURITY] [S3] Checks that your Amazon S3 buckets do not allow public write access. If an Amazon S3 bucket policy or bucket ACL allows public write access, the bucket is noncompliant."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }

  depends_on = ["aws_config_configuration_recorder.main"]
}

#EC2
resource "aws_config_config_rule" "instances-in-vpc" {
  name        = "instances-in-vpc"
  description = "[SECURITY] [EC2] [VPC] Ensure all EC2 instances run in a VPC"

  source {
    owner             = "AWS"
    source_identifier = "INSTANCES_IN_VPC"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}

resource "aws_config_config_rule" "elb-acm-certificate-required" {
  name        = "elb-acm-certificate-required"
  description = "[SECURITY] [EC2] [ELB] Checks whether the Classic Load Balancers use SSL certificates provided by AWS Certificate Manager. To use this rule, use an SSL or HTTPS listener with your Classic Load Balancer. This rule is only applicable to Classic Load Balancers. This rule does not check Application Load Balancers and Network Load Balancers."

  source {
    owner             = "AWS"
    source_identifier = "ELB_ACM_CERTIFICATE_REQUIRED"
  }

  depends_on = [
    "aws_config_configuration_recorder.main",
    "aws_config_delivery_channel.main",
  ]
}
