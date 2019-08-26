terraform {
  backend "consul" {
    address = "demo.consul.io"
    scheme  = "https"
    path    = "example_app/terraform_state"
  }
}

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

terraform {
  backend "pg" {
    conn_str = "postgres://user:pass@db.example.com/terraform_backend"
  }
}
