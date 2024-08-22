provider "aws" {
  region = var.region
}


module "aws_infrastructure" {
  source         = "./aws_infrastructure"
  instance_type  = var.instance_type
  bucket_name    = var.bucket_name
  region         = var.region
}

output "ec2_public_ip" {
  value = module.aws_infrastructure.instance_public_ip
}

output "s3_bucket_name" {
  value = module.aws_infrastructure.bucket_name
}

output "region" {
  value = module.aws_infrastructure.region
}
