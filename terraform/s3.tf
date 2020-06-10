#criação da camada de storage estruturando as áreas landed, raw, modeled e self-service do data lake

resource "aws_s3_bucket" "landed" {
  bucket = "data-lake-${var.product}-landed"
  force_destroy = true
  acl    = "public-read"
}

resource "aws_s3_bucket" "raw" {
  bucket = "data-lake-${var.product}-raw"
  force_destroy = true
  acl    = "private"
}

resource "aws_s3_bucket" "modeled" {
  bucket = "data-lake-${var.product}-modeled"
  force_destroy = true
  acl    = "private"
}

resource "aws_s3_bucket" "self-service" {
  bucket = "data-lake-${var.product}-self-serve"
  force_destroy = true
  acl    = "private"
}

#ingestão inicial dos dados

resource "aws_s3_bucket_object" "landed_files" {
  for_each = fileset(var.upload_directory, "**/*.*")
  bucket   = aws_s3_bucket.landed.bucket
  key      = replace(each.value, var.upload_directory, "")
  source   = "${var.upload_directory}${each.value}"
  acl      = "public-read"
  etag     = filemd5("${var.upload_directory}${each.value}")
}