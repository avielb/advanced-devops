resource "github_repository" "example" {
  name        = var.github_repo_name
  description = var.github_repo_description
  private     = var.github_repo_is_private
}