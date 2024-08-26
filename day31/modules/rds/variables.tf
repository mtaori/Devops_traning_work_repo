variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The database username"
  type        = string
}

variable "password" {
  description = "The database password"
  type        = string
}

# variable "db_subnet_group_name" {
#   description = "The name of the DB subnet group"
#   type        = string
# }

variable "subnet_ids" {
  description = "The list of subnet IDs for the DB subnet group"
  type        = list(string)
}