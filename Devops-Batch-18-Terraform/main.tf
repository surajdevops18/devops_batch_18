

resource "aws_instance" "web_server" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  key_name = var.key_name
  # Add security group to allow HTTP and SSH access
  vpc_security_group_ids = var.security_group_id # Replace with your security group ID

  tags = {
    Name = var.tags["Name"]
    Owner = var.tags["Owner"]
  }
}

# RDS Instance
resource "aws_db_instance" "my_database" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  instance_class       = var.db_instance_class
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  delete_automated_backups = true

  tags = {
    Name = "My_RDS_Database"
    Owner = "DevOps_Team"
  }
}


