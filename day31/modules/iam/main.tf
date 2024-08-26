resource "aws_iam_role" "instance_role" {
  name = "ec2_instance_role12"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "instance_policy_attachment" {
  name       = "instance_policy_attachment"
  roles      = [aws_iam_role.instance_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ec2_instance_profile12"
  role = aws_iam_role.instance_role.name
}