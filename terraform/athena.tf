resource "aws_athena_database" "automobile" {
  name   = "database_${var.product}"
  bucket = aws_s3_bucket.landed.bucket
}