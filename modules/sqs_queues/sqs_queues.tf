resource "aws_sqs_queue" "sqs_queues" {
  count = length(var.queue_names)

  name = var.queue_names[count.index]

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queues[count.index].arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dead_letter_queues" {
  count = length(var.queue_names)

  name = "${var.queue_names[count.index]}-dlq"
}
