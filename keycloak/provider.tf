terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.1.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
