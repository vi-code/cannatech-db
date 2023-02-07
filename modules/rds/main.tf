data "aws_secretsmanager_secret" "password" {
  name = "cannatech-db"
}

data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.password.id
}

resource "aws_db_subnet_group" "rds" {
  name        = "cannatech-db-subnet-group"
  description = "Cannatech database subnet group for RDS instances"
  subnet_ids  = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  engine            = var.engine
  instance_class    = var.instance
  identifier        = var.identifier
  name              = var.name
  username          = "dbadmin"
  password          = data.aws_secretsmanager_secret_version.password.secret_string
  allocated_storage = 10

  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]
}

resource "aws_security_group" "rds" {
  name        = "rds-security-group"
  description = "Security group for Cannatech database instances"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}