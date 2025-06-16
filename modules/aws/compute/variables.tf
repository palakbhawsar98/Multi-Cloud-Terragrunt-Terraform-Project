
variable "ami_id" {
  description = "AMI ID to use for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "environment" {
  description = "Deployment environment (dev/test/prod)"
  type        = string
}
