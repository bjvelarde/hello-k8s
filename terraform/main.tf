terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "hello" {
  metadata {
    name = "hello-k8s"
    labels = {
      app = "hello-k8s"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "hello-k8s"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-k8s"
        }
      }

      spec {
        container {
          name  = "hello-k8s"
          image = "bvelarde/hello-k8s:latest"  # Update if needed
          image_pull_policy = "Never"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello" {
  metadata {
    name = "hello-k8s-service"
  }

  spec {
    selector = {
      app = "hello-k8s"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "ClusterIP"
  }
}

