variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the instance"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the instance"
  type        = string
}