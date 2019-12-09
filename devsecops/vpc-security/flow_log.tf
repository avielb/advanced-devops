resource "aws_flow_log" "example" {
  log_destination      = aws_s3_bucket.example.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = data.aws_vpc.defult_vpc.id
}

resource "aws_s3_bucket" "example" {
  bucket = "avielb-vpc-flow-logs"
}