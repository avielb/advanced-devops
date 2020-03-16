resource "null_resource" "load_data" {
  depends_on = [aws_dynamodb_table.table]
  provisioner "local-exec" {
    command = " aws dynamodb batch-write-item --request-items file:///${path.cwd}/ProductCatalog.json"
  }
}