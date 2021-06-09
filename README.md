# AWS-Kinesis-firehose-sqs
A module that creates AWS Kinesis Firehose using S3 Destination, AWS SQS and AWS Kinesis Stream

## This repo is based the article I wrote
[article](https://adefemi171.medium.com/create-a-terraform-module-that-creates-1-kinesis-firehose-and-sqs-57d5a212d691)

## Quick start

**Note**: This project deploy resources into your AWS account. Although all the resources should fall under the
[AWS Free Tier](https://aws.amazon.com/free/), it is not my responsibility if you are charged money for this.

1. Install [Terraform](https://www.terraform.io/).
1. Set your AWS credentials as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
1. Run `terraform init`.
1. Run `terraform plan`.
1. Run `terraform apply`.
1. After it's done deploying, the project will output URLs or IPs you can try out.
1. To clean up and delete all resources after you're done, run `terraform destroy`.

