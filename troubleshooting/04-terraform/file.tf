variable "config" {
  description = "Configuration settings"
}

resource "local_file" "conf" {
  filename = "${path.module}/settings.json"
  content  = jsonencode(var.config["enabled"])
}
