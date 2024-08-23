output "instance_public_ip" {
  value = module.aws_infrastructure.instance_public_ip
}

output "bucket_arn" {
  value = module.aws_infrastructure.bucket_arn
}
