resource "kubernetes_service" "react-service" {
  metadata {
    name      = "react-service"
    namespace = "wdi"  # Provide namespace here, default is "wdi"
    labels = {
      app  = "react-kc"
    }
  }

  spec {
    type = "NodePort"
    selector = {
       app  = "react-kc"
    }

    port {
      name        = "http"
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
      node_port   = 30002
    }
  }
}


resource "kubernetes_deployment" "react-kc-deployment" {
  metadata {
    name      = "react-kc-deployment"
    namespace = "wdi"  # Provide namespace here, default is "wdi"
    labels = {
       app  = "react-kc"
    }
  }

  spec {
    selector {
      match_labels = {
        app  = "react-kc"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app  = "react-kc"
        }
      }

      spec {
        container {
          image = "raxkumar/k8s-terraform-react-keycloak:latest" # Provide react app image url
          name  = "react-kc"

          # Provide Keycloak url, as of now we proceed with default url (http://192.168.49.2:30001/)
          env {
            name = "REACT_APP_KEYCLOAK_URL"
            value = "http://192.168.49.2:30001"
          }

          # Provide public keycloak realm name 
          env {
            name = "REACT_APP_KEYCLOAK_REALM"
            value = "Mavas"
          }

          # Provide public keycloak client name 
          env {
            name = "REACT_APP_KEYCLOAK_CLIENT_ID"
            value = "mavas-web"
          }

          # Provide Backend URL, as of now we proceed with default url (http://"http://192.168.49.2:30010)
          env {
            name = "REACT_APP_BACKEND_API_URL"
            value = "http://192.168.49.2:30010"
          }
          
          
          port {
            name           = "react"
            container_port = 3000
          }
        }
      }
    }
  }
}