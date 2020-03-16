resource "aws_elasticsearch_domain" "logs" {
  domain_name           = var.cluster_name
  elasticsearch_version = "7.4"
  cluster_config {
    instance_type = "t2.small.elasticsearch"
  }
  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
  access_policies = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "es:*",
        "Principal": "*",
        "Effect": "Allow",
        "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}/*",
        "Condition": {
          "IpAddress": {"aws:SourceIp": ["0.0.0.0/0"]}
        }
      }
    ]
  }
  POLICY
}