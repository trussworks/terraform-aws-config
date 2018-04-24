Enables AWS Config and adds managed config rules with good defaults.

This module comes with most of AWS managed Config Rules. All rules are disabled by default so you can only pick the rules that are relevant to you.

Some rules need extra parameters. Please refer to the table below to see a comprenhensive list of all inpur variables.

If you need a rule that is currently not included in this module please open a PR.

## Usage

    module "aws_config" {
      source                = "trussworks/aws/config"
      config_logs_bucket    = "my-aws-logs"
      cloudtrail_enabled    = 1
      required_tags         = 1
      required_tag_key_1    = "Owner"
      required_tag_key_2    = "Env"
      required_tag_values_2 = "Dev,QA,Prod"
    }


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm_certificate_expiration_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/acm-certificate-expiration-check.html) rule. | string | `0` | no |
| acm_days_to_expiration | For `acm_days_to_expiration` rule. Specify the number of days before the rule flags the ACM Certificate as noncompliant. | string | `14` | no |
| autoscaling_group_elb_healthcheck_required | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/autoscaling-group-elb-healthcheck-required.html) rule. | string | `0` | no |
| cloudtrail_enabled | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/cloudtrail-enabled.html) rule. | string | `0` | no |
| config_delivery_frequency | The frequency with which AWS Config delivers configuration snapshots. | string | `Six_Hours` | no |
| config_logs_bucket | The S3 bucket for AWS Config logs. | string | - | yes |
| config_logs_prefix | The S3 prefix for AWS Config logs. | string | `config` | no |
| config_max_execution_frequency | The maximum frequency with which AWS Config runs evaluations for a rule. | string | `TwentyFour_Hours` | no |
| desired_instance_type | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/desired-instance-type.html) rule. | string | `0` | no |
| desired_instance_types | For `desired_instance_types` rule. Comma-separated list of EC2 instance types (for example, "t2.small, m4.large, i2.xlarge"). | string | `` | no |
| ebs_optimized_instance | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ebs-optimized-instance.html) rule. | string | `0` | no |
| ec2_applications_required_platform_type | For `ec2_managedinstance_applications_required` rule. The platform type (for example, "Linux" or "Windows"). | string | `` | no |
| ec2_applications_required_required_application_names | For `ec2_managedinstance_applications_required` rule. Comma-separated list of application names. Optionally, specify versions appended with ":" (for example, "Chrome:0.5.3, FireFox"). | string | `` | no |
| ec2_instance_detailed_monitoring_enabled | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instance-detailed-monitoring-enabled.html) rule. | string | `0` | no |
| ec2_managedinstance_applications_required | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-applications-required.html) rule. | string | `0` | no |
| ec2_managedinstance_platform_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-managedinstance-platform-check.html) rule. | string | `0` | no |
| ec2_platform_check_agent_version | For `ec2_platform_check_platform_type` rule. The version of the agent (for example, "2.0.433.0"). | string | `` | no |
| ec2_platform_check_platform_type | For `ec2_platform_check_platform_type` rule. The platform type (for example, "Linux" or "Windows"). | string | `` | no |
| ec2_platform_check_platform_version | For `ec2_platform_check_platform_type` rule. The version of the platform (for example, "2016.09"). | string | `` | no |
| ec2_volume_inuse_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-volume-inuse-check.html) rule. | string | `0` | no |
| eip_attached | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/eip-attached.html) rule. | string | `0` | no |
| elb_acm_certificate_required | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/elb-acm-certificate-required.html) rule. | string | `0` | no |
| encrypted_volumes | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/encrypted-volumes.html) rule. | string | `0` | no |
| iam_group_has_users_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-group-has-users-check.html) rule. | string | `0` | no |
| iam_password_policy | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-password-policy.html) rule. | string | `0` | no |
| iam_user_group_membership_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-group-membership-check.html) rule. | string | `0` | no |
| iam_user_no_policies_check | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/iam-user-no-policies-check.html) rule. | string | `0` | no |
| instances_in_vpc | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/ec2-instances-in-vpc.html) rule. | string | `0` | no |
| password_max_age_days | For `iam_password_policy` rule. Number of days before password expiration. | string | `90` | no |
| password_min_length | For `iam_password_policy` rule. Password minimum length. | string | `14` | no |
| password_require_lowercase | For `iam_password_policy` rule. Require at least one lowercase character in password. | string | `true` | no |
| password_require_numbers | For `iam_password_policy` rule. Require at least one number in password. | string | `true` | no |
| password_require_symbols | For `iam_password_policy` rule. Require at least one symbol in password. | string | `true` | no |
| password_require_uppercase | For `iam_password_policy` rule. Require at least one uppercase character in password. | string | `true` | no |
| password_reuse_prevention | For `iam_password_policy` rule. For `iam_password_policy` rule. Number of passwords before allowing reuse. | string | `24` | no |
| rds_multi_az_support | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/rds-multi-az-support.html) rule. | string | `0` | no |
| required_tag_key_1 | For `required_tags` rule. Required Tag 1 | string | `` | no |
| required_tag_key_2 | For `required_tags` rule. Required Tag 2 | string | `` | no |
| required_tag_key_3 | For `required_tags` rule. Required Tag 3 | string | `` | no |
| required_tag_key_4 | For `required_tags` rule. Required Tag 4 | string | `` | no |
| required_tag_key_5 | For `required_tags` rule. Required Tag 5 | string | `` | no |
| required_tag_key_6 | For `required_tags` rule. Required Tag 6 | string | `` | no |
| required_tag_values_1 | For `required_tags` rule. Values that required Tag 1 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tag_values_2 | For `required_tags` rule. Values that required Tag 2 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tag_values_3 | For `required_tags` rule. Values that required Tag 3 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tag_values_4 | For `required_tags` rule. Values that required Tag 4 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tag_values_5 | For `required_tags` rule. Values that required Tag 5 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tag_values_6 | For `required_tags` rule. Values that required Tag 6 accepts (ie. "Prod,QA,Dev") | string | `` | no |
| required_tags | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/required-tags.html) rule. | string | `0` | no |
| restricted_ssh | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/restricted-ssh.html) rule. | string | `0` | no |
| root_account_mfa_enabled | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/root-account-mfa-enabled.html) rule. | string | `0` | no |
| s3_bucket_public_read_prohibited | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-public-read-prohibited.html) rule. | string | `0` | no |
| s3_bucket_public_write_prohibited | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-public-write-prohibited.html) rule. | string | `0` | no |
| s3_bucket_ssl_requests_only | Enable [this](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-ssl-requests-only.html) rule. | string | `0` | no |

