variable "db_username" {
   description = "The database username"
  type        = string
}
variable "db_password" {
    description = "The database password"
  type        = string
}

variable "storage_type" {
  description = "The type of storage for the database"
  type        = string
}

variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance class for the database"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string

}
