terraform {
  backend "s3" {
    bucket         = "manan-s3-bucket-001" 
    key            = "terraform/state.tfstate"
    region         = "us-west-1" 
    dynamodb_table = "terraform-state-lock"
  }
}
