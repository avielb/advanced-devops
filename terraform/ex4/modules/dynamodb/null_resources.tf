resource "null_resource" "load_data" {
  depends_on = [aws_dynamodb_table.table]
  provisioner "local-exec" {
    command = " aws dynamodb batch-write-item --request-items file:///Users/avielb/GitHub/advanced-devops/terraform/ex4/projects/super-reader/ProductCatalog.json"
  }

}