variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "key_path" {
  description = "Path to the private key file for SSH"
  type        = string
}
