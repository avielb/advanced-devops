# create folder in the pycharm project called "class11"
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  subnet_id = "subnet-018523f5b12a8b3fb"
  tags = {
    Name = var.server_name
  }
}

variable "server_name" {
  type = string
  default = "my-server"
  description = "the name of the server"
}
