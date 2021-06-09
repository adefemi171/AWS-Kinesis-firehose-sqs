resource "aws_sqs_queue" "kinesis" { //Created a new sqs queue
  //A name to identify the Simple Queue Service
  name = "${terraform.workspace}_kinesis"
  // fifo_queue = true
  // content_based_deduplication = true

  //To prevent other consumers from processing the message again and its in seconds
  //a period of time during which Amazon SQS prevents other consumers from receiving and processing the message
  visibility_timeout_seconds = var.kinesis_visibility_timeout_seconds

  //I added a Server Side Encryption
  //SSE encrypts the body of a message

  // The ID of an AWS-managed customer master key (CMK)
  kms_master_key_id = var.kinesis_kms_master_key_id

  //The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again.
  kms_data_key_reuse_period_seconds = var.kinesis_kms_data_key_reuse_period_seconds

  //The time in seconds that the delivery of all messages in the queue will be delayed
  delay_seconds = var.kinesis_delay_seconds

  //The limit of how many bytes a message can contain before Amazon SQS rejects it
  max_message_size = var.kinesis_max_message_size

  //The number of seconds Amazon SQS retains a message
  message_retention_seconds = var.kinesis_message_retention_seconds

  //The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning
  receive_wait_time_seconds = var.kinesis_receive_wait_time_seconds

  // redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.sqs-queue-1_deadletter.arn}\",\"maxReceiveCount\":4}"

  tags = {
    Environment = lower(terraform.workspace)
  }
}