/*data "aws_kinesis_stream" "stream" {
  name = "stream-automobile"
}

resource "aws_kinesis_stream" "test_stream" {
  name             = "terraform-kinesis-automobile"
  shard_count      = 1
  retention_period = 48

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    Environment = "test"
  }
}
*/