resource "aws_iam_policy" "consume_delete_policy" {
  name        = "sqs-consume-delete-policy"
  description = "IAM policy allowing ReceiveMessage and DeleteMessage on SQS queues"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["sqs:ReceiveMessage", "sqs:DeleteMessage"],
        Effect   = "Allow",
        Resource = aws_sqs_queue.sqs_queues[*].arn,
      },
    ],
  })
}

locals {
  main_queue_arns = [for q in aws_sqs_queue.sqs_queues : q.arn if !can(regex(".*-dlq$", q.name))]
}

resource "aws_iam_policy" "write_policy" {
  name        = "sqs-write-policy"
  description = "IAM policy allowing SendMessage to SQS queues"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["sqs:SendMessage"],
        Effect   = "Allow",
        Resource = local.main_queue_arns,
      },
    ],
  })
}
