package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsS3PrivateBucket(t *testing.T) {
	t.Parallel()

	expectedConfigLogsBucket := fmt.Sprintf("terratest-aws-config-%s", strings.ToLower(random.UniqueId()))

	// Pick a random AWS region to test in. This helps ensure your code works in all regions.
	awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/simple/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"region":             awsRegion,
			"config_logs_bucket": expectedConfigLogsBucket,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Empty config_logs_bucket before terraform destroy
	aws.EmptyS3Bucket(t, awsRegion, expectedConfigLogsBucket)

}
