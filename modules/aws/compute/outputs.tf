output "instance_id" {
  description = "ID of the EC2 instances"
  value       = aws_instance.my_instance.id
}
