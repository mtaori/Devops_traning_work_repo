terraform {
  backend "s3" {
    bucket         = "s3-bucket-manan-001"
    key            = "terraform/state.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}