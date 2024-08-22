variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}
