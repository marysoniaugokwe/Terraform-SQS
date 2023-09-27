module "sqs_queues" {
  source      = "./modules/sqs_queues" 
  queue_names = ["priority-10", "priority-100"]
  create_roles = true
}