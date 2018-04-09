Enables AWS Config and adds managed config rules with good defaults.

The following AWS Config Rules are supported. By default all rules are disabled so you can easily turn on only the rules you are interested about.

| Name | Description | Tags | Enable Variable |
|------|------|---------------|-----------|
| `required_tags` | Ensures that every resource has the required tags and values. | `MANAGEMENT` `COST` | `required_tags = 1` |
| `cloudtrail_enabled` | Ensure CloudTrail is enabled. | `MANAGEMENT` `CLOUDTRAIL` | `cloud_trail = 1` |
| `acm_certificate_expiration_check` | Ensures ACM Certificates in your account are marked for expiration within the specified number of days. | `MANAGEMENT` `ACM` | `acm_certificate_expiration_check = 1` |
| `ec2_volume_inuse_check` | Checks whether EBS volumes are attached to EC2 instances. | `COST` `EC2` `EBS` | `ec2_volume_inuse_check = 1` |
| `eip_attached` | Checks whether EIPs are being used. | `COST` `EC2` `VPC` | `eip_attached = 1` |
| `rds_multi_az_support` | Checks whether high availability is enabled for your RDS DB instances. | `AVAILABILITY` `RDS` | `rds_multi_az_support` |
| `autoscaling_group_elb_healthcheck_required` | Checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks. | `AVAILABILITY` `EC2` | `autoscaling_group_elb_healthcheck_required = 1` |
| `elb_acm_certificate_required` | Checks whether the Classic Load Balancers use SSL certificates provided by AWS Certificate Manager. To use this rule, use an SSL or HTTPS listener with your Classic Load Balancer. This rule is only applicable to Classic Load Balancers. This rule does not check Application Load Balancers and Network Load Balancers. | `SECURITY` `EC2` `ELB` | `elb_acm_certificate_required = 1` |
| `instances_in_vpc` | Ensure all EC2 instances run in a VPC. | `SECURITY` `EC2` `VPC` | `instances_in_vpc = 1` |
| `s3_bucket_public_write_prohibited` | Checks that your Amazon S3 buckets do not allow public write access. If an Amazon S3 bucket policy or bucket ACL allows public write access, the bucket is noncompliant. | `SECURITY` `S3` | `s3_bucket_public_write_prohibited = 1` |
| `s3_bucket_public_read_prohibited` | Checks that your Amazon S3 buckets do not allow public read access. If an Amazon S3 bucket policy or bucket ACL allows public read access, the bucket is noncompliant. | `SECURITY` `S3` | `s3_bucket_public_read_prohibited = 1` |
| `s3_bucket_ssl_requests_only` | Checks whether S3 buckets have policies that require requests to use Secure Socket Layer (SSL). | `SECURITY` `S3` | `s3_bucket_ssl_requests_only = 1` |
| `iam_user_group_membership_check` | Checks whether IAM users are members of at least one IAM group. | `SECURITY` `MANAGEMENT` `IAM` | `iam_user_group_membership_check = 1` |
| `iam_group_has_users_check` | Ensure that all IAM User Groups have at least one user. | `SECURITY` `MANAGEMENT` `IAM` | `iam_group_has_users_check = 1` |
| `iam_user_no_policies_check` | Ensure that none of your IAM users have policies attached. IAM users must inherit permissions from IAM groups or roles. | `SECURITY` `MANAGEMENT` `IAM` | `iam_user_no_policies_check = 1` |
| `root_account_mfa_enabled` | Ensure root AWS account has MFA enabled. | `SECURITY` `IAM` |  |
| `iam_password_policy` | Ensure the account password policy for IAM users meets the specified requirements. | `SECURITY` `IAM` | `iam_password_policy = 1` |

## Usage

    module "aws_config" {
      source                   = "trussworks/aws/config"
      config_logs_bucket       = "my-aws-config-logs"
      iam_password_policy      = 1
      root_account_mfa_enabled = 1
    }

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `acm_days_to_expiration` | Specify the number of days before the rule flags the ACM Certificate as noncompliant. | string | `14` | no |
| `config_delivery_frequency` | The frequency with which AWS Config delivers configuration snapshots. | string | `Six_Hours` | no |
| `config_logs_bucket` | The S3 bucket for AWS Config logs. | string | `-` | yes |
| `config_logs_prefix` | The S3 prefix for AWS Config logs. | string | `config` | no |
| `config_max_execution_frequency` | The maximum frequency with which AWS Config runs evaluations for a rule. | string | `TwentyFour_Hours` | no |
| `password_max_age_days` | Number of days before password expiration. | string | `90` | no |
| `password_min_length` | Password minimum length. | string | `14` | no |
| `password_require_lowercase` | Require at least one lowercase character in password. | string | `true` | no |
| `password_require_numbers` | Require at least one number in password. | string | `true` | no |
| `password_require_symbols` | Require at least one symbol in password. | string | `true` | no |
| `password_require_uppercase` | Require at least one uppercase character in password. | string | `true` | no |
| `password_reuse_prevention` | Number of passwords before allowing reuse. | string | `24` | no |
| `required_tag_key_#`| Required Tag Key (`#` can be any number from `1-6`). | string | `-` | no |
| `required_tag_values_#` | Required Tag accepted values  (`#` can be any number from `1-6`). | string | `-` | no |
