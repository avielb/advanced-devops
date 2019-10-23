output "es_url" {
  value = aws_elasticsearch_domain.logs.endpoint
}

output "kibana_url" {
  value = aws_elasticsearch_domain.logs.kibana_endpoint
}