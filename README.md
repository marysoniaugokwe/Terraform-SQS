<h1> Terraform SQS Module </h1>

Terraform Module for creating an SQS queue and an accompanying dead letter queue.

Input Variables
- `queue_names` (required): A list of queue names to be created.
- `create_roles` (optional, default: false): If set to true, IAM roles will be created for consuming and writing to the queues.

Outputs
- `queue_arns`: A list of ARNs for the created SQS queues.

- `consume_policy_arn`: The ARN of the IAM policy that allows receiving and deleting messages from the queues.

- `write_policy_arn`: The ARN of the IAM policy that allows sending (writing) messages to the queues.

- `consume_role_arns`: A list of ARNs for the IAM roles created for consuming from the queues (if create_roles is true).

- `write_role_arns`: A list of ARNs for the IAM roles created for writing to the queues (if create_roles is true).

Providers

AWS Credentials: You need valid AWS credentials, can be defined in a .tfvars file.

### initialize

    terraform init

### preview terraform actions

    terraform plan

### apply configuration

    terraform apply

### destroy all resources

    terraform destroy