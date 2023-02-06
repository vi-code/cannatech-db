resource "aws_s3_bucket" "terraform-state" {
  bucket = "viharp-sandbox-us-west-2-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    "Organization" = "viharp-sandbox"
    "Service"      = "tfstate"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.terraform-state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform-state" {
  name           = "tfstate"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}