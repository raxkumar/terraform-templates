resource "kubernetes_service" "demo_app_spring_service" {
  metadata {
    name      = "demo-app-spring"
    namespace = "wdi"  # Provide namespace here, default is "wdi"
    labels = {
      app = "demo-app-spring"
    }
  }

  spec {
    type = "NodePort"
    selector = {
      app = "demo-app-spring"
    }

    port {
      name        = "http"
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
      node_port   = 30010
    }
  }
}


resource "kubernetes_deployment" "demo_app_spring_deployment" {
  metadata {
    name      = "demo-app-spring"
    namespace = "wdi"  # Provide namespace here, default is "wdi"
    labels = {
      app = "demo-app-spring"
    }
  }


  spec {
    selector {
      match_labels = {
        app = "demo-app-spring"
      }
    }

    template {
      metadata {
        labels = {
          app = "demo-app-spring"
        }
      }

      spec {
        container {
          name              = "demo-app-spring"
          image             = "raxkumar/k8s-terraform-spring-postgres:latest" # Provide spring-boot application image url
          # image_pull_policy = "IfNotPresent"

          port {
            name           = "http"
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
          }

          env {
            name = "DB_SERVER"
            value = "postgres-db"
          }

          env {
            name  = "DB_PASSWORD"
            value = "root" // change this value, while taking input from the user for database server-name.
          }

          env {
            name  = "DB_NAME"
            value = "test" // change this value, while taking input from the user for database name.
          }

          env {
            name = "DB_USER"
            value = "root" // change this value, while taking input from the user for database username.
          }
        }
      }
    }
  }
}
