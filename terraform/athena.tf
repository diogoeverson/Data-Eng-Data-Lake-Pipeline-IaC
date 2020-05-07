resource "aws_athena_database" "aws_athena_database_automobile" {
  name   = "database_automobile"
  bucket = aws_s3_bucket.result-query-athena.bucket
  force_destroy = "true"
}

resource "aws_athena_named_query" "teste_athena_named_query" {
  name      = "bar"
  database  = "database_automobile"
  query     = "SELECT * FROM table-automobile limit 10;"
}
