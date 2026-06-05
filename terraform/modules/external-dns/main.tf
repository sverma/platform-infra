resource "helm_release" "external_dns" {

  name = "external-dns"

  repository = "https://kubernetes-sigs.github.io/external-dns"

  chart = "external-dns"

  namespace = "kube-system"

  version = "1.15.0"

  set {
    name  = "provider"
    value = "google"
  }

  set {
    name  = "policy"
    value = "sync"
  }
}
