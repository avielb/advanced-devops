provider "aws" {
  region = "eu-central-1"
}

module "myapp" {
  source = "../../modules/myapp"
  var1 = "moshe"
  var2 = "david"
  environment = "dev"
}
output "myapp" {
  value = module.myapp.blabla
}
