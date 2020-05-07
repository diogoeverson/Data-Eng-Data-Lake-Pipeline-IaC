#criação da camada de storage estruturando as áreas landed, raw, modeled e self-serve do data lake

resource "aws_s3_bucket" "landed" {
  bucket = "data-lake-${var.product}-landed"
  acl    = "private"
}

resource "aws_s3_bucket" "raw" {
  bucket = "data-lake-${var.product}-raw"
  acl    = "private"
}

resource "aws_s3_bucket" "modeled" {
  bucket = "data-lake-${var.product}-modeled"
  acl    = "private"
}

resource "aws_s3_bucket" "self-serve" {
  bucket = "data-lake-${var.product}-self-serve"
  acl    = "private"
}

#ingestão inicial dos dados

resource "aws_s3_bucket_object" "landed_files" {
  for_each = fileset(var.upload_directory, "**/*.*")
  bucket   = aws_s3_bucket.landed.bucket
  key      = replace(each.value, var.upload_directory, "")
  source   = "${var.upload_directory}${each.value}"
  acl      = "private"
  etag     = filemd5("${var.upload_directory}${each.value}")
}

#bucket para query result do athena

resource "aws_s3_bucket" "result-query-athena" {
  bucket = "result-query-athena-${var.product}"
  acl    = "private"
}