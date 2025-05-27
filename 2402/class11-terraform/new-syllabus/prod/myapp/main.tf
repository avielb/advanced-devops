provider "aws" {
  region = "us-east-1"
}

module "myapp" {
  source = "../../modules/myapp"
  var1 = "moshe"
  var2 = "david"
}
output "myapp" {
  value = module.myapp.blabla
}
