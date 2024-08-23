terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  
backend "local" {
    path = "terraform.tfstate"
  }
}


provider "aws" {
  region = "us-east-1"  
}

module "aws_infrastructure" {
  source        = "./modules/aws_infrastructure"
  instance_type = "t2.micro"
  ami_id         = var.ami_id
  key_name       = var.key_name
  bucket_name    = var.bucket_name
  
}
