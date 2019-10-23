provider "aws" {
  region = "us-east-1"
}

output "kibana_url" {
  value = module
}

module "es" {
  source = "../../modules/elasticsearch"
  cluster_name = "logz"
}