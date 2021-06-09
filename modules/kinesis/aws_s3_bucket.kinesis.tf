resource "aws_s3_bucket" "kinesis" {
  //
  bucket = "${terraform.workspace}-kinesis"
  //Access Connect List
  acl = "private"

  tags = {
    Name        = "Kinesis"
    Environment = lower(terraform.workspace)
  }
}