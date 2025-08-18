variable "var1" {}
variable "var2" {}
variable "environment" {
  default = "prod"
}
locals {
  names = "${var.var1}_${var.environment}"
}
output "ss" {
  value = local.names
}
# module.myapp.null_resource.example