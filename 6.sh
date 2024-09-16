module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
