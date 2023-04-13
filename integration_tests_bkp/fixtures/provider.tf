provider "google" {
  project     = "proxycertificatecf"
  region      = "europe-west2"
  zone        = "europe-west2-a"
  credentials = file("proxycertificatecf-8ed769ba4e72.json")
}