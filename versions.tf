terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.13"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.13"
    }
  }
  required_version = ">= 1.0.4"
}
