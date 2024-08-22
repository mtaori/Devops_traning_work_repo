variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0d53d72369335a9d6"
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  default = "manan-s3-bucket-2"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}
