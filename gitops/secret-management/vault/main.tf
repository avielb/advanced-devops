provider "vault" {
  address = "http://127.0.0.1:8200/"
  token   = "s.lkCWAQg14yV8OJY52hOK2DMt"
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

data "vault_generic_secret" "creds" {
  path = "kv/my-secrets"
}

resource "kubernetes_secret" "example" {
  metadata {
    name = "credentials"
  }

  data = {
    username = data.vault_generic_secret.creds.data["username"]
    password = data.vault_generic_secret.creds.data["password"]
  }
}

data "template_file" "secret" {
  template = file("secret.yaml")
  vars = {
    username = base64encode(data.vault_generic_secret.creds.data["username"])
    password = base64encode(data.vault_generic_secret.creds.data["password"])
  }
}

output "secret" {
  value = data.template_file.secret.rendered
  # to apply to current cluster this can be run:
  # terraform output secret | kubectl apply -f -
}

locals {
  secret_contents = join("\n", [
    for test in keys(data.vault_generic_secret.creds.data) :
    join(": ", [test, base64encode(data.vault_generic_secret.creds.data[test])])
  ])
}

output "dynamic_secret" {
  value = <<EOF
apiVersion: v1
data:
  ${indent(2, local.secret_contents)}
kind: Secret
metadata:
  name: ${replace(data.vault_generic_secret.creds.path, "/", "-")}
  namespace: default
type: Opaque
EOF
}