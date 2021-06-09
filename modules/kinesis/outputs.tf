output "sqs_id" {
  value = aws_sqs_queue.kinesis.id
}

output "sqs_arn" {
  value = aws_sqs_queue.kinesis.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.kinesis.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.kinesis.arn
}

output "kinesis_stream_id" {
  value = aws_kinesis_stream.kinesis.id
}

output "kinesis_stream_arn" {
  value = aws_kinesis_stream.kinesis.arn
}

output "kinesis_firehose_delivery_stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.kinesis.arn
}