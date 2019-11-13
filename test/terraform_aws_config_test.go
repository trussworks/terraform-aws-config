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

	configName := fmt.Sprintf("aws-config-%s", strings.ToLower(random.UniqueId()))
	expectedConfigLogsBucket := fmt.Sprintf("terratest-%s", configName)
	awsRegion := "us-west-2"

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/simple/",
		Vars: map[string]interface{}{
			"region":             awsRegion,
			"config_logs_bucket": expectedConfigLogsBucket,
			"config_name":        configName,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	// Empty config_logs_bucket before terraform destroy
	defer aws.EmptyS3Bucket(t, awsRegion, expectedConfigLogsBucket)

	terraform.InitAndApply(t, terraformOptions)

}
