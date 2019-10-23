resource "aws_elasticsearch_domain" "logs" {
  domain_name = var.cluster_name
  cluster_config {
    instance_type = "t2.small.elasticsearch"
  }
}