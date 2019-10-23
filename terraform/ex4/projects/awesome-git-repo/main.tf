provider "github" {
  organization = "avielb-org"
}
module "github_repo" {
  source                  = "../../modules/github-repository"
  github_repo_name        = "awesome-git-repo"
  github_repo_description = "This is going to be the best git repo ever"
}