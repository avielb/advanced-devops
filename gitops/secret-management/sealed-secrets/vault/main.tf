provider "vault" {
  address = "http://127.0.0.1:8200/"
  # token = "s.123123123123"
}
data "vault_generic_secret" "creds" {
  path = "kv/credentials"
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

data template_file "secret" {
  template = file("secret.yaml")
  vars = {
    username = base64encode(data.vault_generic_secret.creds.data["username"])
    password = base64encode(data.vault_generic_secret.creds.data["password"])
  }
}

output secret {
  value = data.template_file.secret.rendered
  # to apply to current cluster this can be run:
  # terraform output secret | kubectl apply -f -
}

