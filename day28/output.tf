output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
output "rds_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}
output "s3_bucket_name" {
  value = aws_s3_bucket.static_files.bucket
}
