resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "manan-ec2-instance"
  }
  lifecycle {
    prevent_destroy = false
  }
}