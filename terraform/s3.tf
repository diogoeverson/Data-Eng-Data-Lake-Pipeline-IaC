#criação da camada de storage estruturando as áreas landed, raw, modeled e self-serve do data lake

resource "aws_s3_bucket" "landed" {
  bucket = "data-lake-${var.product}-landed"
  acl    = "public"
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

#provisioner "local-exec" {
#    command = "aws s3 cp --recursive ../raw-data aws_s3_bucket.landed
#  }


resource "aws_s3_bucket_object" "landed_files" {
  for_each = fileset(var.upload_directory, "**/*.*")
  bucket   = aws_s3_bucket.landed.bucket
  key      = replace(each.value, var.upload_directory, "")
  source   = "${var.upload_directory}${each.value}"
  acl      = "public"
  etag     = filemd5("${var.upload_directory}${each.value}")
  #content_type  = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}