# resource "kubernetes_storage_class" "example" {
#   metadata {
#     name = "kc-sc"
#   }
#   storage_provisioner = "kubernetes.io/no-provisioner"
#   reclaim_policy      = "Retain"
  
# }

resource "kubernetes_persistent_volume_claim" "example" {
  metadata {
    name = "exampleclaimname"
    namespace = kubernetes_namespace.wdi.metadata.0.name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = "examplevolumename"
    storage_class_name = "standard"
  }
}

resource "kubernetes_persistent_volume" "example" {
  metadata {
    name = "examplevolumename"
  }
  spec {
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteMany"]
    
    // This will change in future, as of this will work for minikube.
    persistent_volume_source {
      host_path {
        path = "/data/db"
      }
    }
    storage_class_name = "standard"
  }
}