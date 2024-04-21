module "main" {
  source = "../../modules"

  common = {
    project     = var.project
    environment = var.environment
    system      = var.system
    region      = "asia-northeast1"
    zone        = "asia-northeast1-b"
    sops        = data.sops_file.secrets
  }


}
