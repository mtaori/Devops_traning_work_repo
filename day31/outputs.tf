output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "route_table_id" {
  value = module.vpc.route_table_id
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_instance_id" {
  value = module.rds.db_instance_id
}

# output "s3_bucket_id" {
#   value = module.s3.bucket_id
# }
# #
# output "iam_role_arn" {
#   value = module.iam.role_arn
# }