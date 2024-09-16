module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
https://registry.terraform.io/modules/terraform-iaac/nginx-controller/helm/latest?tab=inputs

module "app" {
  source = "../../modules/app"
  env = "prod"
  controller_kind = "Deployment" # use this
}
