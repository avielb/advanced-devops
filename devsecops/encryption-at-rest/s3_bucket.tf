resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.name}-1encrypted-bucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  depends_on = [aws_kms_key.key]
}
