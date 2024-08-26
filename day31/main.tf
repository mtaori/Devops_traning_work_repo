provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block          = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  public_subnet_az    = "us-west-2a"
  private_subnet_cidr = "10.0.2.0/24"
  private_subnet_az   = "us-west-2b"
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}

module "rds" {
  source = "./modules/rds"

  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  subnet_ids             = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
}

module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name
}

module "iam" {
  source = "./modules/iam"

}
