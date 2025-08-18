provider "aws" {
  region = "us-west-2"
}

module "myapp" {
  source = "../../modules/myapp"
  var1 = "moshe"
  var2 = "david"

}
output "myapp" {
  value = module.myapp.blabla
}
