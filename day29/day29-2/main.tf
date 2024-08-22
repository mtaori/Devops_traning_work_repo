resource "aws_s3_bucket" "web" {
  bucket = "manan-s3-bucket-001"
}

resource "aws_dynamodb_table" "state_lock" {
  name           = "terraform-state-lock"
  billing_mode    = "PAY_PER_REQUEST"
  hash_key        = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
