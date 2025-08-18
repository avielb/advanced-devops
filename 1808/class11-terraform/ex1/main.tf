provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "example" {}

variable "server_name" {
  type = string
  default = "david.example.com"
  description = "the name of the server"
}

output "name" {
  value = "ssh myuser@${startswith(var.server_name, "moshe") ? "myserver" : "notmyserver"}"
}