resource "kubernetes_horizontal_pod_autoscaler" "hello_hpa" {
  metadata {
    name = "hello-k8s-hpa"
  }

  spec {
    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment.hello.metadata[0].name
      api_version = "apps/v1"
    }

    min_replicas = 2
    max_replicas = 10

    target_cpu_utilization_percentage = 50
  }
}