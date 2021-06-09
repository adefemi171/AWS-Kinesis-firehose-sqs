data "aws_iam_policy_document" "kinesis" {
  statement {
    effect    = "Allow"
    actions   = ["kinesis:*"]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["sqs:*"]
    resources = ["*"]
  }

  statement {
    effect  = "Allow"
    actions = ["sqs:*"]
    resources = [
      "arn:aws:s3:::${var.sqs_name}",
      "arn:aws:s3:::${var.sqs_name}/*"
    ]
  }

}

resource "aws_iam_policy" "kinesis" {
  name   = "${terraform.workspace}_kinesis"
  path   = "/"
  policy = data.aws_iam_policy_document.kinesis.json
}


resource "aws_iam_role_policy_attachment" "attach_kinesis_policy_to_kinesis_role" {
  role       = aws_iam_role.kinesis.name
  policy_arn = aws_iam_policy.kinesis.arn
}