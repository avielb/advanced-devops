provider "aws" {
  region = "us-east-1"
}



module "es" {
  source       = "../../modules/elasticsearch"
  cluster_name = "logz"
}

output es_endpoint {
  value = module.es.es_url
}

output "kibana_url" {
  value = module.es.kibana_url
}
#
# upload data:
#curl -XPOST search-logz-oq7kojw5ghscj6ijpbmo5zcphe.us-east-1.es.amazonaws.com/_bulk --data-binary @movies.json -H 'Content-Type: application/json'