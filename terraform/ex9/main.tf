provider "github" {
  organization = "Aviel-Org"
  token        = "123456789"
}

provider "gitlab" {}
resource "github_repository" "repo" {
  name        = "test"
  description = "this is test repo"
}
