resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

# Create the RDS Instance
resource "aws_db_instance" "this" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = var.instance_class
  db_name             = var.db_name
  username            = var.username
  password            = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  multi_az            = true
  backup_retention_period = 7
  skip_final_snapshot     = false

  tags = {
    Name = "my-new-rds-instance"
  }
}