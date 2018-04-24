/**
	* Enables AWS Config and adds managed config rules with good defaults.
	*
	* This module comes with most of AWS managed Config Rules. All rules are disabled by default so you can only pick the rules that are relevant to you.
	*
	* Some rules need extra parameters. Please refer to the table below to see a comprenhensive list of all inpur variables.
	*
	* If you need a rule that is currently not included in this module please open a PR.
	*
	* ## Usage
	*
	*     module "aws_config" {
  *       source                = "trussworks/aws/config"
  *       config_logs_bucket    = "my-aws-logs"
  *       cloudtrail_enabled    = 1
  *       required_tags         = 1
  *       required_tag_key_1    = "Owner"
  *       required_tag_key_2    = "Env"
  *       required_tag_values_2 = "Dev,QA,Prod"
	*     }
	*/

