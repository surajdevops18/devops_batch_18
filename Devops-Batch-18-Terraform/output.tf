# Print EC2 instance details
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.web_server.id
}   
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}
output "instance_public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.web_server.public_dns
}

# Print RDS instance details
output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.my_database.endpoint
}
output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.my_database.id
}
output "rds_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.my_database.port
}
