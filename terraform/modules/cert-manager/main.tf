resource "kubernetes_namespace_v1" "cert_manager" {

  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert_manager" {

  name = "cert-manager"

  repository = "https://charts.jetstack.io"

  chart = "cert-manager"

  namespace = "cert-manager"

  version = "v1.18.2"

  create_namespace = false

  set {
    name  = "crds.enabled"
    value = "true"
  }
}
