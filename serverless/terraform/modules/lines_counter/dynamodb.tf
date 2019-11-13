resource "aws_dynamodb_table" "table" {
  hash_key = var.hash_key
  name     = var.table_name
  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }
  billing_mode = var.billing_mode
}

