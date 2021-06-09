terraform {
  backend "s3" {
    bucket               = "kinesis-data-drop" // dont forget to edit bucket name
    key                  = "terraform/state/apps/kinesis/kinesis.tf" 
    workspace_key_prefix = "terraform"
    region               = "us-west-2"
  }
}