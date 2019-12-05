#
# AWS Config Logs Bucket with Required Tags
#

module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 3"

  s3_bucket_name     = "${var.config_logs_bucket}"
  region             = "${var.region}"
  allow_config       = "true"
  config_logs_prefix = "config"
}

module "config" {
  source = "../../"

  config_name        = var.config_name
  config_logs_bucket = "${module.config_logs.aws_logs_bucket}"
  config_logs_prefix = "config"

  check_required_tags          = true
  required_tags_resource_types = ["S3::Bucket"]
  required_tags = {
    tag1Key   = "Automation"
    tag1Value = "Terraform"
    tag2Key   = "Environment"
    tag3Value = "Terratest"
  }
}
