resource "kubernetes_config_map" "postgres_cm" {
  metadata {
    name = "postgres-config-map"
    namespace = "wdi"  # Provide namespace here, default is "wdi"
  }

  data = {
    server-name   = "postgres-db"
    database-name = "test"
    username      = "root"
  }
}
