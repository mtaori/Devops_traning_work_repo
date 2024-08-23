output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}
