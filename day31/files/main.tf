provider "aws" {
  region  = var.region
  profile = "default"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket
  tags = {
    Name = "state_Bucket"
  }
}
resource "aws_dynamodb_table" "terraform_temp_locks" {
  name         = var.name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}

