module "kinesis" {
    source = "./modules/kinesis"
    s3_bucket_name = var.s3_bucket_name
    sqs_name = var.sqs_name
}