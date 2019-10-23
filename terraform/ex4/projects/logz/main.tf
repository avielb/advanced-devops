provider "aws" {
  region = "us-east-1"
}

output "kibana_url" {
  value = module
}

module "es" {
  source       = "../../modules/elasticsearch"
  cluster_name = "logz"
}

#
# upload data:
# curl -XPOST elasticsearch_domain_endpoint/_bulk --data-binary @movies.json -H 'Content-Type: application/json'