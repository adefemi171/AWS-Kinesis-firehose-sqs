resource "aws_kinesis_stream" "stream-new"{ // Created a new kinesis stream resource
    // A name to identify the stream
    name = "kinesis-stream-new"
    //The number of shard that the stream will use A shard is a unit of throughput capacity.
    shard_count = 1
    // Length of time data records are accessible after they are added to the stream
    retention_period = 24
    //The encryption type to use
    encryption_type = "NONE"

    //A list of shard-level CloudWatch metrics which can be enabled for the stream
    shard_level_metrics = [
        "IncomingBytes",
        "OutgoingBytes",
    ]

    //A mapping of tags  to assign to the resource
    tags = {
        Environment = "stream-new"
    }
}

resource "aws_sqs_queue" "sqs-queue-new"{ //Created a new sqs queue
    //
    name = "sqs-kinesis-new"
    // fifo_queue = true
    // content_based_deduplication = true
    kms_master_key_id = "alias/aws/sqs"
    kms_data_key_reuse_period_seconds = 300
    delay_seconds = 90
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    // redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.sqs-queue-1_deadletter.arn}\",\"maxReceiveCount\":4}"

    tags = {
        Environment = "sqs-queue-new"
    }
}

resource "aws_kinesis_firehose_delivery_stream" "firehose-stream-new" {
  name        = "firehose-stream-new"
  destination = "s3"

    s3_configuration {
    role_arn   = "${aws_iam_role.firehose-stream-role.arn}"
    bucket_arn = "${aws_s3_bucket.s3-new-buck-1.arn}"
  }
}


resource "aws_s3_bucket" "s3-new-buck-1" {
  bucket = "s3-new-buck-1"
  //Access Connect List
  acl    = "private"
}

resource "aws_iam_role" "firehose-stream-role" {
  name = "firehose-stream-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
