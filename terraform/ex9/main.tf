provider "github" {
  organization = "Aviel-Org"
}

provider "gitlab" {}
resource "github_repository" "repo" {
  name        = "test"
  description = "this is test repo"
}
