output "queue_arns" {
  description = "A list of queue ARNs for the newly created queues."
  value       = aws_sqs_queue.sqs_queues[*].arn
}

output "consume_delete_policy_arn" {
  description = "The ARN of the created IAM policy that allows sqs: ReceiveMessage and sqs: DeleteMessage on the created queues."
  value       = aws_iam_policy.consume_delete_policy.arn
}

output "write_policy_arn" {
  description = "The ARN of the created IAM policy that allows sqs: SendMessage to the created queues."
  value       = aws_iam_policy.write_policy.arn
}

output "consume_delete_role_arns" {
  description = "The ARNs of the created IAM roles for consuming from the queues."
  value       = aws_iam_role.consume_delete_role[*].arn
}

output "write_role_arns" {
  description = "The ARNs of the created IAM roles for writing to the queues."
  value       = aws_iam_role.write_role[*].arn
}

# output "main_queue_arns" {
#   value = local.main_queue_arns
# }
