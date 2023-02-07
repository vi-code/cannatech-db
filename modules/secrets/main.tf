resource "random_password" "rds_pwd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "rds_pwd" {
  name = var.name
}

resource "aws_secretsmanager_secret_version" "rds_pwd" {
  secret_id     = aws_secretsmanager_secret.rds_pwd.id
  secret_string = random_password.rds_pwd.result
}