# Declare varible for AWS EC2

variable "instance_type" {
  description = "The type of instance to use for the web server"
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "The AMI ID to use for the web server instance"
  type        = string
  default     = "ami-0d176f79571d18a8f" # Example AMI ID
}
variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default     = "devops-batch-18-mumbai-key"
}

variable "security_group_id" {
  description = "The security group ID to associate with the instance"
  type        = list(string)
  default     = ["sg-01b4344526ccaa0f5"] # Replace with your security group ID
}



variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default = {
    Name  = "Web_Server_Instance"
    Owner = "DevOps_Team"
  }
}



# Declare variable for RDS
variable "db_instance_class" {
  description = "The instance class for the RDS database"
  type        = string
  default     = "db.t3.micro"
}
variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}
variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydatabase"
}
variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}
variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "password123"
}
variable "db_allocated_storage" {
  description = "The allocated storage for the database in GB"
  type        = number
  default     = 20
}
variable "db_tags" {
  description = "Tags to apply to the RDS instance"
  type        = map(string)
  default = {
    Name  = "RDS_Database_Instance"
    Owner = "DevOps_Team"
  }
}


