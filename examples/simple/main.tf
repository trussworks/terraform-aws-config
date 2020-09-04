#
# AWS Config Logs Bucket
#

module "config_logs" {
  source  = "trussworks/logs/aws"
  version = "~> 9"

  s3_bucket_name     = var.config_logs_bucket
  region             = var.region
  allow_config       = true
  config_logs_prefix = "config"
  force_destroy      = true
}

module "config" {
  source = "../../"

  config_name        = var.config_name
  config_logs_bucket = module.config_logs.aws_logs_bucket
  config_logs_prefix = "config"

  tags = {
    "Automation" = "Terraform"
    "Name"       = var.config_name
  }
}
