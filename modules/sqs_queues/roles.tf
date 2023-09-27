resource "aws_iam_role" "consume_delete_role" {
  count = var.create_roles ? length(var.queue_names) : 0

  name = "sqs-consume-delete-role-${var.queue_names[count.index]}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = "*",
        },
      },
    ],
  })
}

resource "aws_iam_role" "write_role" {
  count = var.create_roles ? length(var.queue_names) : 0

  name = "sqs-write-role-${var.queue_names[count.index]}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = "*",
        },
      },
    ],
  })
}

resource "aws_iam_policy_attachment" "consume_delete_policy_attachment" {
  name = "consume-delete-attachment"
  count = var.create_roles ? length(var.queue_names) : 0

  policy_arn = aws_iam_policy.consume_delete_policy.arn
  roles       = [aws_iam_role.consume_delete_role[count.index].name]
}

resource "aws_iam_policy_attachment" "write_policy_attachment" {
  name = "write-attachment"
  count = var.create_roles ? length(var.queue_names) : 0

  policy_arn = aws_iam_policy.write_policy.arn
  roles       = [aws_iam_role.write_role[count.index].name]
}
