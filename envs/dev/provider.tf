terraform {
  required_version = "1.6.3"
  required_providers {
    google = {
      version = "5.18.0"
    }

    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
  }

  backend "gcs" {
    bucket = "foo-bar-dev-gcp-terraform-state-gcs-bucket"
  }
}


provider "google" {
  project = var.project
}

provider "sops" {}
