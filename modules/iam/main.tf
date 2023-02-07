resource "aws_iam_policy" "lambda_rds_policy" {
  name = "lambda_rds_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "rds:*"
        ],
        Effect   = "Allow",
        Resource = var.rds_instance_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_rds_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_rds_policy.arn
  role       = aws_iam_role.lambda_role.name
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}