# create folder in the pycharm project called "class11"
provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "example" {}

variable "server_name" {
  type = string
  default = "moshe"
  description = "the name of the server"
}

output "name" {
  value = var.server_name
}
----------------------------------------------
variable "server_name" {
  type = string
  default = "moshe.example.com"
  description = "the name of the server"
}

output "name" {
  value = "ssh myuser@${var.server_name}"
}
--------------------------------------------------
variable "var1" {}
variable "var2" {}
-------------------------------------------
output "result" {
  value = "${var.var1} --- ${var.var2}"
}
-------------------------------------------
module "myapp" {
  source = "../../modules/myapp"
  var1 = "moshe"
  var2 = "david"
}

output "myapp" {
  value = module.myapp.result
}

-------------------------------------------
https://registry.terraform.io/browse/modules
