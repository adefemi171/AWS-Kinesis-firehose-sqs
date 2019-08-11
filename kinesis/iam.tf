resource "aws_iam_role" "firehose-stream-role" {
  //
  name = "firehose-stream-role"
  // role = "aws_iam_role.firehose-stream-role.id"

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


resource "aws_iam_role_policy" "firehose-stream-policy" {
  name = "firehose-stream-policy"
  role = "${aws_iam_role.firehose-stream-role.id}"

 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
       {
            "Effect": "Allow",
            "Action": "kinesis:*",
            "Resource": "*"
        },

	    {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
              "arn:aws:s3:::s3-new-buck-1",
              "arn:aws:s3:::s3-new-buck-1/*"
            ]
      },
      {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
              "sqs:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "sqs:*",
            "Resource": [
              "arn:aws:sqs:::sqs-queue-new",
              "arn:aws:sqs:::sqs-queue-new/*"
            ]
        }
    ]
}
EOF
}

