data "template_file" "aws_config_iam_password_policy" {
  template = file("${path.module}/config-policies/iam-password-policy.tpl")

  vars = {
    # terraform will interpolate boolean as 0/1 and the config parameters expect "true" or "false"
    password_require_uppercase = var.password_require_uppercase ? "true" : "false"
    password_require_lowercase = var.password_require_lowercase ? "true" : "false"
    password_require_symbols   = var.password_require_symbols ? "true" : "false"
    password_require_numbers   = var.password_require_numbers ? "true" : "false"
    password_min_length        = var.password_min_length
    password_reuse_prevention  = var.password_reuse_prevention
    password_max_age           = var.password_max_age
  }
}

data "template_file" "aws_config_acm_certificate_expiration" {
  template = file(
    "${path.module}/config-policies/acm-certificate-expiration.tpl",
  )

  vars = {
    acm_days_to_expiration = var.acm_days_to_expiration
  }
}

#
# AWS Config Rules
#

resource "aws_config_config_rule" "iam-password-policy" {
  count            = var.active == true ? 1 : 0
  name             = "iam-password-policy"
  description      = "Ensure the account password policy for IAM users meets the specified requirements"
  input_parameters = data.template_file.aws_config_iam_password_policy.rendered

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_config_rule" "cloudtrail-enabled" {
  count       = var.active == true ? 1 : 0
  name        = "cloudtrail-enabled"
  description = "Ensure CloudTrail is enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }

  maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_config_rule" "instances-in-vpc" {
  count       = var.active == true && var.region != "ap-northeast-3" ? 1 : 0
  name        = "instances-in-vpc"
  description = "Ensure all EC2 instances run in a VPC"

  source {
    owner             = "AWS"
    source_identifier = "INSTANCES_IN_VPC"
  }

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_config_rule" "root-account-mfa-enabled" {
  count       = var.active == true ? 1 : 0
  name        = "root-account-mfa-enabled"
  description = "Ensure root AWS account has MFA enabled"

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_config_rule" "acm-certificate-expiration-check" {
  count            = var.active == true && var.region != "ap-northeast-3" ? 1 : 0
  name             = "acm-certificate-expiration-check"
  description      = "Ensures ACM Certificates in your account are marked for expiration within the specified number of days"
  input_parameters = data.template_file.aws_config_acm_certificate_expiration.rendered

  source {
    owner             = "AWS"
    source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK"
  }

  maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "ec2-volume-inuse-check" {
  count       = var.active == true ? 1 : 0
  name        = "ec2-volume-inuse-check"
  description = "Checks whether EBS volumes are attached to EC2 instances"

  source {
    owner             = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "iam-user-no-policies-check" {
  count       = var.active == true ? 1 : 0
  name        = "iam-user-no-policies-check"
  description = "Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles."

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "rds-storage-encrypted" {
  count       = var.active == true ? 1 : 0
  name        = "rds-storage-encrypted"
  description = "Checks whether storage encryption is enabled for your RDS DB instances."

  source {
    owner             = "AWS"
    source_identifier = "RDS_STORAGE_ENCRYPTED"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "rds-instance-public-access-check" {
  count = var.check_rds_public_access == true && var.active == true ? 1 : 0

  name        = "rds-instance-public-access-check"
  description = "Checks whether the Amazon Relational Database Service (RDS) instances are not publicly accessible. The rule is non-compliant if the publiclyAccessible field is true in the instance configuration item."

  source {
    owner             = "AWS"
    source_identifier = "RDS_INSTANCE_PUBLIC_ACCESS_CHECK"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "rds-snapshots-public-prohibited" {
  count       = var.active == true && var.region != "ap-northeast-3" ? 1 : 0
  name        = "rds-snapshots-public-prohibited"
  description = "Checks if Amazon Relational Database Service (Amazon RDS) snapshots are public."

  source {
    owner             = "AWS"
    source_identifier = "RDS_SNAPSHOTS_PUBLIC_PROHIBITED"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "guardduty-enabled-centralized" {
  count = var.check_guard_duty == true && var.active == true ? 1 : 0

  name        = "guardduty-enabled-centralized"
  description = "Checks whether Amazon GuardDuty is enabled in your AWS account and region."

  source {
    owner             = "AWS"
    source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED"
  }

  maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "s3-bucket-public-write-prohibited" {
  count       = var.active == true ? 1 : 0
  name        = "s3-bucket-public-write-prohibited"
  description = "Checks that your S3 buckets do not allow public write access."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }

  depends_on = [aws_config_configuration_recorder.main]
}

resource "aws_config_config_rule" "s3-bucket-server-side-encryption-enabled" {
  count       = var.active == true ? 1 : 0
  name        = "s3-bucket-server-side-encryption-enabled"
  description = "Checks that your Amazon S3 bucket either has S3 default encryption enabled or that the S3 bucket policy explicitly denies put-object requests without server side encryption."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  # maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_remediation_configuration" "s3-bucket-server-side-encryption-enabled" {
  count            = var.active == true ? 1 : 0
  config_rule_name = aws_config_config_rule.s3-bucket-server-side-encryption-enabled[0].name
  resource_type    = "AWS::S3::Bucket"
  target_type      = "SSM_DOCUMENT"
  target_id        = "AWS-EnableS3BucketEncryption"
  target_version   = "1"

  parameter {
    name         = "AutomationAssumeRole"
    static_value = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-config-role-${var.region}"
  }
  parameter {
    name           = "BucketName"
    resource_value = "RESOURCE_ID"
  }
  parameter {
    name         = "SSEAlgorithm"
    static_value = "AES256"
  }

  automatic                  = true
  maximum_automatic_attempts = 5
  retry_attempt_seconds      = 600

  execution_controls {
    ssm_controls {
      concurrent_execution_rate_percentage = 10
      error_percentage                     = 20
    }
  }
}


resource "aws_config_config_rule" "s3-bucket-versioning-enabled" {
  count       = var.active == true ? 1 : 0
  name        = "s3-bucket-versioning-enabled"
  description = "Checks whether versioning is enabled for your S3 buckets."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }

  # maximum_execution_frequency = var.config_max_execution_frequency

  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.main,
  ]
}

resource "aws_config_remediation_configuration" "s3-bucket-versioning-enabled" {
  count            = var.active == true ? 1 : 0
  config_rule_name = aws_config_config_rule.s3-bucket-versioning-enabled[0].name
  resource_type    = "AWS::S3::Bucket"
  target_type      = "SSM_DOCUMENT"
  target_id        = "AWS-ConfigureS3BucketVersioning"
  target_version   = "1"

  parameter {
    name         = "AutomationAssumeRole"
    static_value = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-config-role-${var.region}"
  }
  parameter {
    name           = "BucketName"
    resource_value = "RESOURCE_ID"
  }
  parameter {
    name         = "VersioningState"
    static_value = "Enabled"
  }

  automatic                  = true
  maximum_automatic_attempts = 5
  retry_attempt_seconds      = 600

  execution_controls {
    ssm_controls {
      concurrent_execution_rate_percentage = 10
      error_percentage                     = 20
    }
  }
}
