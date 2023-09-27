variable "queue_names" {
  description = "A list of queue names."
  type        = list(string)
  default = []
}

variable "create_roles" {
  description = "Conditionally create IAM roles."
  type        = bool
  default     = false
}