package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsConfig(t *testing.T) {
	t.Parallel()

	expectedConfigLogsBucket := fmt.Sprintf("terratest-aws-config-%s", strings.ToLower(random.UniqueId()))
	awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/simple/",
		Vars: map[string]interface{}{
			"region":             awsRegion,
			"config_logs_bucket": expectedConfigLogsBucket,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Empty config_logs_bucket before terraform destroy
	aws.EmptyS3Bucket(t, awsRegion, expectedConfigLogsBucket)
}
