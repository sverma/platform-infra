resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {

  name = "argocd"

  repository = "https://argoproj.github.io/argo-helm"

  chart = "argo-cd"

  namespace = "argocd"

  depends_on = [ kubernetes_namespace_v1.argocd ]

  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}

resource "kubectl_manifest" "root_app" {

  depends_on = [
    helm_release.argocd
  ]

  yaml_body = file("${path.module}/root-app.yaml")
}
