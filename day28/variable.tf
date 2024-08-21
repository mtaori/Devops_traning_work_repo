variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-east-2"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-04a81a99f5ec58529"
}

# variable "db_name" {
#   description = "The name of the MySQL database"
#   default     = "mydatabasedb"
# }

variable "db_username" {
  description = "The username for the MySQL database"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the MySQL database"
  sensitive   = true
  default     = "password123"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "day28bucket-01"
}
