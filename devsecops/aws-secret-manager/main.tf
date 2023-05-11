provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "apikey" {
  name = "apikey1"

}

resource "aws_secretsmanager_secret_version" "one" {
  secret_id     = aws_secretsmanager_secret.apikey.id
  secret_string = "blabla1"
}

resource "aws_secretsmanager_secret" "userpass" {
  name = "userpass1"
}

resource "aws_secretsmanager_secret_version" "userpass" {
  secret_id     = aws_secretsmanager_secret.userpass.id
  secret_string = <<EOF
{"username": "moshe", "password":"david"}
EOF

}
