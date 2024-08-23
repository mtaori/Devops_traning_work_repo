provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name       = var.key_name
  tags = {
    Name = "web-instance"
  }

  provisioner "remote-exec" {
      inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu" 
      private_key = file("/home/einfochips/Desktop/traning/SPkey.pem")
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo 'EC2 instance successfully provisioned with Apache.'"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "my-bucket"
  }
}

# output "instance_public_ip" {
#   value = aws_instance.web.public_ip
# }

# output "bucket_arn" {
#   value = aws_s3_bucket.bucket.arn
# }
