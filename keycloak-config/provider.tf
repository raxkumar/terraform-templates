terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.1.0"
    }
  }
}

provider "keycloak" {
    client_id     = "admin-cli"
    username      = "admin"  # Provide admin password for keycloak(admin-cli)
    password      = "admin"  # Provide admin password for keycloak(admin-cli)
    url           = "http://kc.cdkdemo.tk"
}