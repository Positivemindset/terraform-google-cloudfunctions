# Define the Terraform configuration block for the module
terraform {

  # Specify the required providers for the module
  required_providers {

    # Define the required Google Cloud provider and its version
    google = {
      source  = "hashicorp/google"
      version = ">= 4.13"
    }

    # Define the required Google Cloud beta provider and its version
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.13"
    }
  }

  # Specify the required version of Terraform for the module
  required_version = ">= 1.0.4"
}
