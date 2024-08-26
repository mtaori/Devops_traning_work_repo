resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  #acl    = "private"

  tags = {
    Name = var.bucket_name
  }
}