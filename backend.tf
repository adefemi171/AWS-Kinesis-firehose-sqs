terraform {
  backend "s3" {
    bucket               = "kinesis-data-drop"
    key                  = "terraform/state/apps/kinesis/kinesis.tf"
    workspace_key_prefix = "terraform"
    region               = "us-west-2"
  }
}