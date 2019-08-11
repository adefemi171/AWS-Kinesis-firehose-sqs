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
    //A name to identify the Simple Queue Service
    name = "sqs-queue-new"
    // fifo_queue = true
    // content_based_deduplication = true

    //To prevent other consumers from processing the message again and its in seconds
    //a period of time during which Amazon SQS prevents other consumers from receiving and processing the message
    visibility_timeout_seconds = 30
    //I added a Server Side Encryption
    //SSE encrypts the body of a message

    // The ID of an AWS-managed customer master key (CMK)
    kms_master_key_id = "alias/aws/sqs"
    //The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again.
    kms_data_key_reuse_period_seconds = 300
    //The time in seconds that the delivery of all messages in the queue will be delayed
    delay_seconds = 90
    //The limit of how many bytes a message can contain before Amazon SQS rejects it
    max_message_size = 2048
    //The number of seconds Amazon SQS retains a message
    message_retention_seconds = 86400
    //The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning
    receive_wait_time_seconds = 10
    // redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.sqs-queue-1_deadletter.arn}\",\"maxReceiveCount\":4}"

    tags = {
        Environment = "sqs-queue-new"
    }
}

resource "aws_kinesis_firehose_delivery_stream" "firehose-stream-new" {
  //A name to identify the stream
  name        = "firehose-stream-new"
  //This is the destination to where the data is delivered
  destination = "s3"

    s3_configuration {
    //The ARN of the AWS credentials.
    role_arn   = "${aws_iam_role.firehose-stream-role.arn}"
    //The ARN of the S3 bucket
    bucket_arn = "${aws_s3_bucket.s3-new-buck-1.arn}"
    //Buffer incoming data to the specified size, in MBs, before delivering it to the destination.
    buffer_size = 10
    //Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination.
    buffer_interval = 400
    //The compression format
    compression_format = "ZIP"
  }
}


resource "aws_s3_bucket" "s3-new-buck-1" {
  //
  bucket = "s3-new-buck-1"
  //Access Connect List
  acl    = "private"
}