package test_test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestDevEnvironmentModule(t *testing.T) {

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../Environment/dev",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

}