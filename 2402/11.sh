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
