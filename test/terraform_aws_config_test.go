package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsConfig(t *testing.T) {
	t.Parallel()

	// In order to run multiple tests in parallel we need to copy the module to temp folders
	// so that the state files don't run into .terraform and kill our tests
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/simple")

	configName := fmt.Sprintf("aws-config-%s", strings.ToLower(random.UniqueId()))
	expectedConfigLogsBucket := fmt.Sprintf("terratest-%s", configName)

	// AWS only supports one configuration recorder per region.
	// Each test will need to specify a different region.
	awsRegion := "us-west-2"

	terraformOptions := &terraform.Options{
		TerraformDir: tempTestFolder,
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

	requiredTagsRuleARN := terraform.Output(t, terraformOptions, "required_tags_rule_arn")
	assert.Empty(t, requiredTagsRuleARN)

}

func TestRequiredTags(t *testing.T) {
	t.Parallel()

	// In order to run multiple tests in parallel we need to copy the module to temp folders
	// so that the state files don't run into .terraform and kill our tests
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/required-tags")

	configName := fmt.Sprintf("aws-config-%s", strings.ToLower(random.UniqueId()))
	expectedConfigLogsBucket := fmt.Sprintf("terratest-%s", configName)

	// AWS only supports one configuration recorder per region.
	// Each test will need to specify a different region.
	awsRegion := "us-east-1"

	terraformOptions := &terraform.Options{
		TerraformDir: tempTestFolder,
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
	defer aws.EmptyS3Bucket(t, awsRegion, expectedConfigLogsBucket)

	terraform.InitAndApply(t, terraformOptions)

	requiredTagsRuleARN := terraform.Output(t, terraformOptions, "required_tags_rule_arn")
	assert.NotEmpty(t, requiredTagsRuleARN)

}
