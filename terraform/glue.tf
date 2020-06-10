#glue catalog-database

resource "aws_glue_catalog_database" "database" {
  name = "database_${var.product}"
}

resource "aws_glue_crawler" "crawler" {
  database_name = aws_glue_catalog_database.database.name
  name          = "crawler_${var.product}"
  role          = aws_iam_role.glue.name

  s3_target {
    path = "s3://${aws_s3_bucket.landed.bucket}"
  }
}

#resource "aws_glue_job" "example" {
#  name     = "example"
#  role_arn = "${aws_iam_role.example.arn}"

#  command {
#    script_location = "s3://${aws_s3_bucket.example.bucket}/example.py"
#  }
#}