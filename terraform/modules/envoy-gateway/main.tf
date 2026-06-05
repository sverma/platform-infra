resource "kubernetes_namespace_v1" "envoy_gateway" {
  metadata {
    name = "envoy-gateway-system"
  }
}

resource "helm_release" "envoy_gateway" {

  name       = "envoy-gateway"

  repository = "oci://docker.io/envoyproxy"

  chart      = "gateway-helm"
  version = "v1.5.4"

  namespace = kubernetes_namespace_v1.envoy_gateway.metadata[0].name

  values = [
    file("${path.module}/envoy-values.yaml")
  ]
}
